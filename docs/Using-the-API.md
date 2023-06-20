***Written by *Aedial***

# 1. Introduction

The API is the backbone of the website. All text and image generation,
storage your content, and much more happens through API requests. As
such, it is possible to use API requests to interact with NovelAI's
back-end in ways that are more elaborate and sometimes originally
unintended by the developers. Due to this, using the API comes with some
restrictions that must be followed ([ToS](https://novelai.net/terms) -
sections 5.3 and 9.1) :

-   **No account sharing.** Any request using your access token should
    be done by the owner of the account.
-   **No automation.** There is some leeway, but the basis of it is that
    there should be some form of user interaction: **requests should be
    sent by users, and never automatically through a script.**

This means **no public bots** using a single API key, among other
things. Making a tool that lets you send a small batch of staggered
requests: OK. Making a tool that generates every 5s and downloads every
result: Not OK.

In the same vein, all requests should be done one request at a time, as
to not choke the server with too much load at once.

Failure to do so can result in your **account's permanent termination**
or your **right to free generations being suspended**

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/98bc914c-de64-4935-91d4-3bca412fb982)

# 2. The endpoints

The official API docs can be viewed at
[docs](https://api.novelai.net/docs), but might be vague about some
aspects.

Here is a breakdown of each endpoint, but **with only the *undocumented*
arguments, types, and schemas**. Documented args, types and schemas are
present in the documentation. **Each** endpoint should be prepended with
"https://api.novelai.net".

Several responses can come from any endpoint:

-   A Cloudflare error with an HTML response
-   A normal error with a JSON response containing an "error" field
    for more information
-   The expected response

## 2.1. Terms and concepts

### 2.1.1. Access key and Access token

To access most of the API, you will need an **Access token**. This token
is generated via the **/user/login endpoint**, and is valid for
**exactly 30 days** (2592000 seconds) after its creation. When you have
your access token, You can use it in the
[Authorization](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization)
header with the **Bearer** scheme.

To login, you will need to send your Access key to the /user/login
endpoint. The Access key is derived from your *email and password* using
the **blake2 and argon2 algorithms** (see
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L43)).

There are several ways to get your access key :

-   Implement /user/login or use a tool that implements it (recommended
    way, as you won't have to manually copy it when it expires)
-   Grab it from the Local Storage, having logged in beforehand
    (Browser's dev tools > Storage > Local Storage >
    https://novelai.net > session - see image below)
-   Use an external tool (:warning: Do not trust any external tool unless you
    know what it does)

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/37438fa2-9ebe-43d8-8d3d-73eb5c22bc5d)

### 2.1.2. Encryption and Keystore

"stories", "storycontent", and "aimodules" objects are encrypted
using [Salsa20/8](https://en.wikipedia.org/wiki/Salsa20), in an
[End-to-End](https://en.wikipedia.org/wiki/End-to-end_encryption)
manner. To get the key of an object, you will need to retrieve and
decrypt your **keystore** with your **Encryption key**. The Encryption
key is derived in the same manner as the Access key, using blake2 and
argon2 (see
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L49)).

The encrypted keystore contains the **encrypted data** ("sdata") and
the **nonce** ("nonce") to be used to decrypt it (it is also encrypted
using Salsa20), the key is your Encryption key. Once you have decrypted
your keystore, you will see a mapping of meta -> key. Each encrypted
object has a "meta" field, which is used to link them to their
encryption key (more info
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/Keystore.py#L113)
and
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L63)).

Once you have the key of the object, you can decrypt it by removing the
nonce that is stored in the 16 first bytes of the encrypted data, and
decrypting the rest using this nonce and the key from the keystore (more
info
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L188)
and
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L63)).

### 2.1.3. Compression

"shelf", "preset", and any decrypted object might be compressed
using [DEFLATE](https://en.wikipedia.org/wiki/Deflate). It is easily
recognizable as the data is prefixed with
0x00000000000000000000000000000001 (hex representation of byte data),
which should be **removed when decompressing** and **added back when
compressing** (note that the prefix is matched and removed *before
decryption*, but the *decompression takes place after decryption* - see
[here](https://github.com/Aedial/novelai-api/blob/8120fcb5db67cf01d254a40e49063b4e71355d17/novelai_api/utils.py#L72)).
The compression library used by the NovelAI team is
[fflate](https://www.npmjs.com/package/fflate), which might result in
slightly different results, but should be fully compatible with the
standard.

### 2.1.4. Logprobs

Logprobs, or logarithm of probabilities, are useful information for
knowing where the AI is going. They are returned by text models when the
parameter is enabled, and show the probability of the top alternatives
in descending order, for a specific token. The logprobs come in the
"logprobs" field of the response, and will contain a "chosen" field
for the tokens that were chosen, and a "before" field for the top
alternatives of these tokens, with their probability before and after
applying sampling.

### 2.1.5. Infilling

Infilling, or Bidirectional inline generation, is a specific feature and
a totally different way of generating, which takes into account both the
text before and after the targeted spot.

The current model used for infilling is GPT-J-6B, but it is unsure
whether it is a finetune or a module v2. It uses token 50261 as mask for
the part to replace, token 50257 at the end of context sent to prompt it
into infilling mode, and token 50258 for the end of generation (so put
that as Stop sequence).

### 2.1.6. Hypebot

Hypebot is a commenter bot, which sees the story and comments on it.

The current model used for hypebot is GPT-J-6B, finetuned on ~300
samples with some augmentation. It uses token 49527 at the end of
context sent to prompt it into hypebot mode, and token 48585 for the end
of generation (so put that as Stop sequence).

## 2.2. Endpoints starting with /

### 2.2.1. /

Checks if the API is reachable.

## 2.3. Endpoints starting with /user/

### 2.3.1. /user/register

Registers an account. Automation is mitigated by ReCaptcha.

### 2.3.2. /user/login

Get a new access token from your access key.

### 2.3.3. /user/change-access-key

Change your access key and email (access key is based on email and
password).

### 2.3.4. /user/resend-email-verification

Send an email with a verification token to verify your email address.

### 2.3.5. /user/verify-email

Verify your email address with the verification token sent to it.

### 2.3.6. /user/information

Get miscellaneous information about your account.

### 2.3.7. /user/deletion/request

Send an email to the account deletion. The email address should be the
same you provided for the registration.

### 2.3.8. /user/deletion/delete

Confirm the account deletion with the deletion token to your email.

### 2.3.9. /user/recovery/request

Send an email to recover your account, in case you forgot your password.
The email address should be the same you provided for the registration.
**Changing your password will make all stories permanently inaccessible,
so make sure you back up everything!**

### 2.3.10. /user/recovery/recover

Change your access key, using the recovery token sent to your email.

### 2.3.11. /user/delete

Delete the account.

### 2.3.12. /user/data

Combination of all user data (/user/priority, /user/subscription,
/user/keystore, /user/clientsettings, and /user/information)

### 2.3.13. /user/priority

Get the priority level. (Legacy system, now deprecated.)

### 2.3.14. /user/giftkeys

Get the gift keys you bought

### 2.3.15. /user/subscription

Get information about subscription, payment processor info, and current
Anlas count

### 2.3.16. /user/keystore

Get/Edit the keystore.

### 2.3.17. /user/objects/{type} (type = "stories", "storycontent", "aimodules", "shelf", "presets")

Get/Upload all the objects of a specific type, that you have uploaded to your account. "stories", "storycontent", and "aimodules" are encrypted, while "shelf" and "presets" are compressed (storycontent is both).

### 2.3.18. /user/objects/{type}/{id}

Get/Edit/Delete a specific object, that you have uploaded to your
account.

### 2.3.19. /user/clientsettings

Get/Edit user-specific settings for the website, like font, theme, etc.

### 2.3.20. /user/submission

Submit content for an event hosted by NovelAI.

### 2.3.21. /user/submission/{event}

Get the content your submitted for the event.

### 2.3.22. /user/vote-submission/{event}

Vote, get your voting status, or delete your vote for an event.

## 2.4. /user/subscription/

### 2.4.1. /user/subscription/bind

Bind new subscription info from the payment processor to your account.

### 2.4.2. /user/subscription/change

Change the subscription tier to a new tier.

## 2.5. /ai/

Image generation returns image(s) as PNG file(s) packed into a zip file
using DEFLATE.

### 2.5.1. /ai/generate

Generate using one of the text AIs. For the input and output, see
parameters.use_string. The most relevant generation options can be
viewed in [Generation
Settings](Generation-Settings#generation-options).

The input you send will be all the AI sees, which mean any context
building needs to be done before sending the request. The maximum length
(in tokens) you can send to the model depends on the selected model,
your subscription tier, the generation length (parameters.max_length),
if a module v1 is loaded, and if generate until sentence
(parameters.generate_until_sentence) is true. For example, if the chosen
model and your tier give you 2048 tokens of context, you need to remove
the generation length (up to 150 tokens), 20 tokens if a module v1 is
loaded, and 20 tokens if generate until sentence is true. Any additional
token above this limit is truncated, starting from the top of context.
If parameters.generate_until_sentence is true, the model will try to
generate up to 20 tokens past the generation length, until a period is
found.

For parameters.order, the sampling methods are **ordered**, the disabled
ones are **removed**, and they are then arranged into an array with
temperature => 0, top_k => 1 , top_p => 2, tfs => 3, top_a => 4,
typical_p => 5

The number of lobprobs per token is set by parameters.num_logprobs. If
this field is not set, no logprob will be sent with the response.

Stop sequences (parameters.stop_sequences) and Banned tokens
(parameters.bad_words_ids) both expect a list of tokenized word(s).

Modules can be selected through parameters.prefix, and have a unique
identifier, which you can usually find by exporting a scenario using
this module and looking into the file. Official modules have a simple
identifier (e.g. "general_crossgenre"), while custom modules have a
longer one containing the model, location, and password of the encrypted
module (e.g.
"6B-v4:c6021aaa523e2dcb8588848b5fd4e2516dd4bb7107268aaa6050b5430c3a4b47:b764a71f139d0d829ed0f3077f026db43fdb25bc6b45ac508e85dd4c405a2fae").
All custom modules are encrypted and stored server-side.

### 2.5.2. /ai/generate-prompt

Unknown, unused yet.

### 2.5.3. /ai/generate-stream

Same as /ai/generate, but uses
[SSE](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
to transmit the response one token at a time.

### 2.5.4. /ai/annotate-image
Get the mask for ControlNet, from an image. The parameters should
contain an "image" field with the base64-encoded PNG image to convert.
For the model, Palette Swap is "hed", Form Lock is "midas",
Scribbler is "fake_scribble", Building Control is "mlsd", and
Landscaper is "uniformer".

### 2.5.5. /ai/generate-image

Generate an image using normal text to image, image to image, or
inpainting.

-   **Parameters.width**: Width of the image to generate.


-   **Parameters.height**: Height of the image to generate.


-   **Parameters.n_samples**: Number of images to return. The maximum
    value is 8 up to 360,448 px, 6 up to 409,600 px, 4 up to 1,310,720
    px, 2 up to 1,572,864 px, and 1 up to the max size.


-   **Parameters.seed**: Random seed to use for the image (between 0 and
    4294967295), defaults to 0. Seed 0 means that a random seed will be
    chosen, but **not set in the metadata** (so giving a seed yourself
    is important). **Note**: When generating multiple images, each
    consecutive image adds 1 to the seed parameter. This means it can go
    beyond the limit of 4294967295, making it **unreproducible** with a
    single generation.


-   **Parameters.extra_noise_seed**: Unknown, but seems to be fulfill
    the same role as Parameters.seed.


-   **Parameters.sampler**: Refer to
    [sampling](https://docs.novelai.net/image/sampling.html). The full
    list of samplers is (some may not work due to being deprecated):
    "k_lms", "k_euler", "k_euler_ancestral", "k_heun", "plms",
    "ddim", "nai_smea", "nai_smea_dyn", "k_dpmpp_2m",
    "k_dpmpp_2s_ancestral", "k_dpmpp_sde", "k_dpm_2",
    "k_dpm_2_ancestral", "k_dpm_adaptive", "k_dpm_fast".


-   **Parameters.noise, Parameters.strength**: Refer to [strength and
    noise](https://docs.novelai.net/image/strengthnoise.html).


-   **Parameters.steps, Parameters.scale**: Refer to [steps and
    scale](https://docs.novelai.net/image/stepsguidance.html).


-   **Parameters.negative_prompt**: Refer to [Undesired
    Content](https://docs.novelai.net/image/undesiredcontent.html).


-   **Parameters.sm, Parameters.sm_dyn**: Enables SMEA and SMEA DYN, if
    True (SMEA needs to be enabled for SMEA DYN). Refer to
    [SMEA](https://docs.novelai.net/image/sampling.html#special-samplers-smea--smea-dyn).


-   **Parameters.image**: Base64-encoded PNG image for Image to Image.


-   **Parameters.controlnet_condition**: Base64-encoded PNG ControlNet
    mask retrieved from the /ai/annotate-image endpoint.


-   **Parameters.controlnet_model**: Model to use for the ControlNet.
    Palette Swap is "hed", Form Lock is "depth", Scribbler is
    "scribble", Building Control is "mlsd", is Landscaper is
    "seg",


-   **Parameters.controlnet_strength**: Controls how much influence the
    ControlNet has on the image.


-   **Parameters.dynamic_thresholding**: Refer to
    [descrisper](https://docs.novelai.net/image/stepsguidance.html#decrisper).
    The technical details can be found on
    [GitHub](https://github.com/mcmonkeyprojects/sd-dynamic-thresholding)
    and
    [Twitter](https://twitter.com/Birchlabs/status/1582165379832348672).


-   **Parameters.add_original_image**: Refer to [Overlay Original
    Image](https://docs.novelai.net/image/inpaint.html#overlay-original-image).


-   **Parameters.mask**: Base64-encoded black and white PNG image to use
    as a mask for inpainting. White is the area to inpaint and black is
    the rest.

More fields can be added in parameters, which will be present in the
metadata of the image, like qualityToggle or ucPreset. These fields are
mainly for the website to remember some key information when importing
the image.

### 2.5.6. /ai/upscale

Upscale the provided PNG image.

### 2.5.7. /ai/classify

Unknown, unused yet.

### 2.5.8. /ai/generate-image/suggest-tags
Suggest tags with a certain confidence, considering how much the tag is
used in the dataset. The confidence is between 0 and 1.

### 2.5.9. /ai/generate-voice

Generates an audio file reading the text sent. The endpoint accepts up
to 1000 characters to read, any more being cut out.

There are 2 versions, selected via the "version" parameter. This
parameter should be set to "v1" for TTS v1, or "v2" for TTS v2.

The voice choice is governed by the "voice" parameter for TTS v1, or
the seed "parameter" for TTS v2. When using TTS v2, the "voice"
parameter can be set to a default value (-1). Furthermore, the "seed"
parameter allows for
seedmix.

If the "opus" parameter is true, the returned audio file will be in
WebM format, otherwise it will be in MP3 format.

## 2.6. /ai/module/

### 2.6.1. /ai/module/train

Send a new module to the training queue.

### 2.6.2. /ai/module/all

Get the modules currently in training or that finished training.

### 2.6.3. /ai/module/{id}

Get/Delete a module currently in training or that finished training.

### 2.6.4. /ai/module/buy-training-steps

Buy Anlas (steps) using your payment processor information.

# 3. Unofficial API resources

-   C# - <https://github.com/Draco18s/NovelAPI>
-   Golang - <https://github.com/wbrown/novelai-research-tool> (more of
    a tool than an API, but uses the API)
-   Python - <https://github.com/Aedial/novelai-api>
