**This guide is focused on nascent technology. As a result, contents
might be highly volatile.**

Anlatan already provides an in-depth guide to using their Image
Generation service [here](https://docs.novelai.net/). It is highly
recommended you read it thoroughly because it explains every
functionality and all pieces of the UI in great detail.

You should also read [Traveling Robot's research
notes](https://github.com/TravelingRobot/NAI_Community_Research/wiki/NAI-Diffusion:-Various-Tips-&-Tricks)
as well. This guide expounds on some of them.

This guide aims to provide with more in depth information for power
users.

**For people looking for the magic voodoo to create NSFW artwork: Add
NSFW to the prompt. Anywhere.**

# How is the AI trained?

The AI was trained on tagged images, based on the Danbooru standard.
Boorus are "imageboards", sites where large amounts of images are
saved in order to catalogue the body of work of artists. This stemmed
from a difficulty to find and archive art reliably, as Japanese artists
have a very different relationship with their works than Western
cultures do.

As a result, these sites were created to host as many images as
possible, and make them easy to find by applying tags. These tags
describe elements of the image, such as character design elements (hair,
eyes, etc), poses, objects, and much more.

There are two parts to training: Quality training, and Aesthetic training. This will be explained in the next section.

If you are going to go and trawl Danbooru's tag database, keep in mind
that the site is **extremely unsafe for work!**

If you are using the Furry model, **you'll need to use E621's tags.**
This means all the following information will not work for this specific
model. E621 is just as extremely unsafe for work.

***

# Diffusion Models

A diffusion model works by resolving noise into an image. If you ever used a photo editing tool to remove noise from an image, the idea is the same, except pushed to its logical extreme. You are giving the AI nothing *but* noise, and ask it to denoise it into a full image.

This has several implications:

• The AI has **no grasp** of the position and boundaries of image elements. It knows what it's trying to make, but it does not know where things start and end *exactly*.

• The AI does not have pure semantic understanding of tags. It just knows that this tag tends to lead to those shapes and those colors. It does not understand what hair *is*, but just how it *looks* and how it is usually drawn.

• The AI does not know what applies to what in the image, this means you can't tell it "I want this, but ONLY for this character". This is why it can struggle with multiple characters in long prompts.

## Noise V. Sampler:  Steps, Scale/Guidance and Seed

Diffusion models work by using Steps to resolve noise. The more steps, the more compute is used, (which is why the Anlas cost goes up with steps).

Steps are carried out by a **Sampler**, which attempts to resolve the noise based on an algorithm. Each Sampler uses a different algorithm, and has different results. Some Sampler are *Ancestral*, meaning they iterate in a way that performs well at lower steps more quickly than non-Ancestral samplers. 

(That does not mean they perform better **in general**, just that it costs less to get them to look decent.)

Scale/Guidance affects *how much* the prompt affects the Sample steps, but not their "intensity" or their "length". **All steps are equal in terms of compute**. Guidance thus does *not* affect cost.

However,  **Negative Guidance Scale** *does*, because it uses additional processing power to run **CFG** or **Classifier-Free Guidance**. If the Negative Guidance is equal to Positive Guidance, then there is no need for extra compute, and the cost is the same.

**Noise** is the primordial soup from which the AI will unravel an image. **Seed** is what decides the base noise pattern, however, **Noise Schedule** in Advanced Settings changes how that noise is generated and interpreted by the sampler, resulting in different outputs with the same seed.

Effectively, Noise Schedules are variations of the same Sampler's algorithm.

`native`, `exponential` and `polyexponential` are *mostly* the same, with Polyexponential being the most similar to `native` in its output. `karras` leads to very different generations on the same seed.

## The limits of Guidance

Guidance is nice and all, but V2 and **especially V3** work best at a narrow band of scale. V2 works well from 3 to 11, while V3 works best at 2-6.

Guidance is much stronger on V3 because it uses a different base model, which is more reactive than V2.

Higher scale leads to stronger contrast, stronger outlines, and all around stronger "bounding" of elements. This can also cause some elements to overpower others more readily. This is why low scale is considered more "painterly", because noise is resolved more loosely, which leads to the aesthetic "blurriness" of mediums like watercolor, oil paint, etc.

To allow for a stronger Prompt Guidance without having those issues, the advanced setting **Prompt Guidance Rescale** attempts to compensate for them, but this will result in a blurrier output. You can always use image 2 image to refine the picture once you feel the base is good enough.

Much like Negative Prompt Guidance, you should adjust Rescale in very small increments starting from 1.

## SMEA

SMEA is an application of Euler Ancestral sampling, but instead of being applied once per generation, it is applied iteratively, per step. This can result in increased image quality, and is especially useful at **larger resolutions than the base resolutions**.

SMEA requires considerably more compute (and its Dynamic version even moreso), so it will lead to **increased Anlas costs**. The other issue is that generating with SMEA with the same seed will lead to very different results than without, so you cannot try and find a good base cheaply, then regenerate it with SMEA.

As a consequence of how it functions, SMEA reduces the influence of Guidance. Thus, when turning it on, you should also increase Guidance slightly to compensate.

# Tag-based Prompting

To use Tags in NAIDiffusion, simply assemble a list of tags freely. Use
commas to separate tags. While tags on Boorus use underscores instead of
spaces, the parser replaced all underscores 'with spaces' to make it
easier to write prompts.

Thus, write prompts with spaces in them if they use multiple words, and
bound them with commas. Forgetting a comma might cause the prompt to be
interpreted incorrectly.

Something that is important to note is that prompts are interpreted with
linear priority, which is the reverse of text generation. What comes
first has more weight, but the rest is more or less normalized in
strength.

**When weighing tags with curly braces or square brackets, stacking them
has a multiplicative effect, rather than additive. The multiplier is 1.05 per pair of brackets**.

Tag-based prompts tends to lead to consistent designs. However, they
come out stylistically different and less diverse than Prose-based
prompts.

There are several tag categories that are important to know, due to how
extensively they were used in tagging.

## Quality Tags And Aesthetic Tags

You may have heard of the `masterpiece` tag being used to "improve
generation quality". This goes a little bit more in depth.

Images were classified according to a percentile "quality score".
Different tags were then applied to training images based on that score.

**For V1**, from highest percentiles to lowest percentiles:

`masterpiece, best quality, high quality, normal quality, low quality, worst quality`

**For V2**, from highest percentiles to lowest percentiles:

`best quality, amazing quality, great quality, normal quality, bad quality, worst quality`

Keep in mind that "amazing quality" incidentally has more NSFW content, so it may be more appropriate to use for NSFW images, as opposed to "best quality". (This also explains why it tends to generate beaches and people in swimsuits.)

If you use any of the Unwanted Content default filters, `worst quality, bad quality,`
are **automatically inserted in Unwanted Content**. You can disable the filter or
write them in your prompt to activate them anyway.

**Aesthetic tags** are used exclusively in V2 and V3 and onwards to designate pictures which match the intended "feel" of the model, as opposed to images that diverge too greatly from the aesthetic that NovelAI sought. The tags for Aesthetics are:
`very aesthetic, aesthetic, displeasing, very displeasing`
Effectively, displeasing images stray too far from the intended "look" of NAI Diffusion, or have aesthetics considered "poor" so that the model knows to avoid them.

You only need one tag for quality and one for aesthtics, though generally you won't need one. It is
better to downbias bad things than overly bias "good" things, as this
may damage creativity. Generally just using the default Unwanted Content
filters will be fine.

## Counting Characters and Gender

One of the ubiquitous booru tags is the gender count tag. Whenever there
is a number of characters in frame, then they are counted by gender.

The tag format is always the same. A number from one to 6 (with a plus
if more than 6), followed immediately by the gender. `1boy, 2girls`

You can also use `other` as a gender for androgynous or transgender
characters. Generally, they will look rather feminine nonetheless.

This tag is almost universally put in first position because it starts
with a number rather than a letter, but you can put it anywhere. Those
tags are **very** powerful, so you might not even need to use them, if
you simply describe a character. It is mostly to make sure you have that
number of characters in frame, or reinforce gender expectations.

If you are looking to generate gender noncomforming characters, here are
a few tags.

`twink, otoko no ko,` or `1girl, flat chest` can help generate soft boys.

`toned female, tomboy, tough` can help generate butch girls.

## Character Reference and Artist Reference

After you specified quality and character number/gender, you'll want to
specify, if applicable, the **Reference Character**, followed by its **source franchise**.
Keep in mind that Boorus use Japanese name order, meaning that family
name comes first for Japanese characters.

`yor briar, spy x family`

`yamamura sadako, the ring`

If you wish to use an artist's style, use `artist:(artistname)`.

For example, if you want to generate Makoto Kusanagi in the style of the
latest Ghost in the Shell production, you would use:

`Kusanagi Makoto, ghost in the shell, Artist:Ilya Kuvshinov,`

You can, of course, put this information anywhere else, this is simply
how file names are generally arranged.

## Tag Interaction

An easy way to mess up your generations (or improve them!) is to have
tags that interact. One common example of tags overwriting each other is
as follows:

`1girl, brown hair, blue eyes, sleeping, eyes closed, laying down`

While the problem is not immediately apparent, specifying an eye colour
*and* them being closed means that one will be ignored in favour of the
other. **Make sure you don't specify information about things that are
not in frame.** Images on Danbooru follow the **"tag what you *see*"** guideline.

A more positive example is:

`1girl, black hair, blue highlights, blue eyes,`

Putting a color highlight next to the hair color will give you colored
strands and bangs. Adjust the wording until you get the specifics you
like!

### Incomplete Interactions

Breaking up interactions that occur naturally can result in artifacts or
odd elements. It is easy to achieve if you strengthen a specific part of
a tag rather than the whole tag.

`1girl, black hair, {{{orange}}} eyes`

This can lead to the spontaneous appearance of tasty, tasty oranges
everywhere in frame. Whether or not this is a bad thing is up to you.

### Priority Interference

As tags placed earlier in the prompt have more strength, colors and other elements tend to leak.

`blue eyes, black hair`

Can lead to the hair being tinted blue, or being blue outright. Eyes tend to have powerful color influence on other elements, as most character designers tend to match palette to the eyes. Thus, it may be better to write the hair tags first to avoid that.

### Mutual Dependencies

Some tags implicitly require each other and can lead to artifacts or
tags being ignored if one of them is banned through Undesired Content.
For example, requesting `gloves` but having `hands` in Undesired Content
can lead to weird generations. Make sure you account for these
dependencies to avoid this!

### Facial Expressions

You'll quickly realize that facial expression tags are non-intuitive
and lead to odd faces. This is because emotions aren't often tagged,
and their vectors are surprisingly strong. Try putting `shy` in UC and you'll see
what this leads to. Some like `pensive` work fine as is.

There are various emotes that can be used as facial expressions, with
fairly strong vectors: `:), :(, :3` and so on.

Be aware that some, like :|, can break the prompt. Try using an emoji
instead: 😐, or look up the tag database. (For instance, this would be `expressionless`)

Having characters look in certain directions also tends to force certain poses. `looking back` has a strong tendency to partially obscure the face with the shoulder, and make the character bend over.

## Strenghtening and Weakning Math

You may have seen curly braces and square brackets be used to make a tag stronger or weaker. Here is a more direct explanation.

Each tag has a base value of 1.

If `]` or `{` is present, multiply the value of all tags following it by 1.05 (a 5% increase).
If `}` or `[` is present, divide the value of all tags following it by 1.05 (a 5% decrease).

This operation is **multiplicative**, and **make generations partially non-deterministic.** In the following examples:

`blue eyes, black hair`

`{[{[blue eyes, black hair]}]}`
Will lead to different results on the same seed and settings.

You do not need to close bracket pairs. Hell, you don't even need to open them!

`{blue eyes, black hair`

and

`]blue eyes, black hair`

Are fundamentally the same.

## Unwanted Content, or "Negative Prompting"

Unwanted Content is a way to direct the generation away from things you'd like to avoid. By virtue of how it works, UC is rather "destructive", so you should keep it as short and focused as possible. Generate with a short UC, then narrow it down based on what you need per image.

There are multiple default UC presets, we will focus on V3's specifically to explain what each element does.

Light: `nsfw, lowres, jpeg artifacts, worst quality, watermark, blurry, very displeasing`

Heavy: `nsfw, lowres, {bad}, error, fewer, extra, missing, worst quality, jpeg artifacts, bad quality, watermark, unfinished, displeasing, chromatic aberration, signature, extra digits, artistic error, username, scan, [abstract]`

Human Focus: `lowres, {bad}, error, fewer, extra, missing, worst quality, jpeg artifacts, bad quality, watermark, unfinished, displeasing, chromatic aberration, signature, extra digits, artistic error, username, scan, [abstract], bad anatomy, bad hands, @_@, mismatched pupils, heart-shaped pupils, glowing eyes`

* nsfw: Prevents generating explicit pictures without explicit request from the user.
* lowres: Reduces artifacts caused by upscaling low-res images to larger canvas sizes.
* {bad}: Part of several tags such as `bad anatomy`, used on its own to avoid using multiple tags starting with "bad", and including things like `bad hands` which can result in hands not being drawn at all.
* error, artistic error: Reduces potential artistic mistakes.
* fewer, extra and missing: Similar to bad, used to reduce the occurence of missing digits and limbs, or extraneous anatomy. `extra digits` reinforces `extra` specifically for hands in order to avoid hands with 6+ fingers.
* worst quality and bad quality: Used to tell the model not to generate images in a similar style to training material with low score.
* jpeg artifacts: Reduces pixelation, palletization and dithering artifacts caused by heavy JPEG compression.
* watermark, signature, username: Reduces text and logo artifacts that the model cannot generate cleanly.
* unfinished: Reduces the frequency of broken, irregular, and missing outlines. Also tends to reduce the frequency of digits being sketched but left unfinished.
* (very) displeasing: Like `worst quality, bad quality` but for Aesthetic tuning.
* chromatic aberration: Reduces color artifacting that can occur in blue, red, and mixed hues thereof. Especially happens on outlines. (This is an effect similar to Bicolor 3D stereoscopy.)
* scan: Reduces scan-induced artifacts such as odd banded lighting and messy outlines.
* `[abstract]`: Reduces overly geometric and amorphous shaping of objects and people.
* ` @_@, mismatched pupils, heart-shaped pupils, glowing eyes`: Several eye-related tags that may incidentally leak into a generation. Reducing their influence means that eyes should generate "cleaner" most of the time.

***
# Prose Prompting

To prose-prompt in NAIDiffusion, simply write a sentence describing the
image. Use commas to separate clauses. Try to keep clauses short and
using as little grammatical words as possible. Try to phrase your
sentences so that you use vocabulary close to Booru tags.

Again, prompts are interpreted with linear priority, which is the
reverse of text generation. What comes first has more weight, so keep
the core content at the beginning of the sentence.

Prose-based prompts tends to lead to more varied output. They are
stylistically different and more diverse than Tag-based prompts, and are
best suited for situations or scenes which are very dynamic and which do
not require consistent character portrayal.

### Story Conversion

You can, with some slight adjustments, copy paste excerpts from your
story and use them as prompts. There might be some fine tuning needed,
but you should get something similar to what was described.

***

# Image to Image Practices

Variations are just Image to Image queued multiple times for the same image.

Image to Image uses a base image as opposed to Noise. This helps keeps elements you like in a picture that is good, but not good *enough*. 
Noise adds more noise to the base image, causing it to change more substantially as you add noise. 

Strength is actually, for once, the intensity of the steps. Strong steps will take more compute (and thus more Anlas).

If your steps and Strength are too low compared to your Noise, your image will stay noisy, because the noise was not sufficiently resolved! Make sure you keep the Noise/Processing ratio to a minimum.

Image to Image is best used for the following purposes:

• Fixing a detail that was badly rendered, like an extra finger or a messed up frill.

○ *Recommended edit: Obscure or paint over with surrounding color palette. 0 noise, 0.2-0.35 strength. (Lower if you trust your detail-fixing skills better.)*

• Keeping the same pose but changing lots of misshapen or artifacted elements.

○ *Recommended edit: None. 0-0.1 noise, 0.7-0.85 strength.*

• Adding a new element to a "good enough" base image.

○ *Recommended edit: Draw shape of object using colors similar to surrounding palette. 0 noise, 0.4-0.6 strength. Keep in mind your image will look substantially different.*

• Drawing a foundation for inpainting.

○ *Recommended edit: Draw the general shape/background of what you want. Do not generate a new image. Instead, click "Inpaint image" on the **left**, and select the area you drew on.*

***

# Bounding & Prompting for Inpainting

## Bounding

Make sure you select areas carefully and include some of the "edges" of what you're filling in. This will help the generated content "fit in" better and reduce artifacting. Do not try to select very precisely, instead, go for clean polygonal shapes.

It is better to inpaint large areas as opposed to small ones, details are best handled by Image to Image. Very small Inpaint canvases are very difficult for the AI to handle.

## Prompting

A common issue that people encounter when inpainting is confusion as to what you should prompt for.

When inpainting, **only** prompt for what must appear in the inpainted area. Do not use your full prompt! This may cause the model to try and cram all these things into the inpainting area, which will look messy and wrong.

You should avoid using any UC outside of default UC when inpainting as well, for the same reason.

***

### CLIP Interrogator

[Clip Interrogator](https://colab.research.google.com/github/pharmapsychotic/clip-interrogator/blob/main/clip_interrogator.ipynb#scrollTo=YQk0eemUrSC7)
can be used to read an image you like and extract tags and prose that
will help you refine your prompt.

## Combo Prompting

If you are generating an image of a specific character that has a small
amount of pictures, you can combine a prose prompt and tags appends in
order to obtain something closer to the desired result.

`a picture of {ayanami} from azur lane, white hair, red eyes, ponytail,`

# Vibe Transfer

Vibe Transfer is a feature that reads an existing image and attempts to apply existing elements from it onto a new generation. This is not **quite** Image to Image, as it lets you generate new content, rather than mapping off of the existing image.

While this can be compared to [Image Prompt Adapter](https://huggingface.co/h94/IP-Adapter), or [Textual Embedding](https://ieeexplore.ieee.org/document/10377571), Vibe Transfer is its own technology and uses a trained model. The details are as of yet kept confidential.

Two settings are at play when using Vibe Transfer to prepare a generation: **Reference Strength** and the **Information Extracted** Factor.

**Reference Strength** is the inverse of Image to Image Strength. The higher it is, the closer the generation will be to the VT Reference image. Since the image itself is not used as-is, it will not be replicated, but excessive strength will cause prompt vectors to be overpowered by the VT Reference's content, generating something very similar to it in terms of content, even if you did not prompt for it.

**Information Extracted** is best compared to using a Magic Wand selector in an image editing software. Instead of selecting pixels based on color, you select an increasing amount of "meaning" from the image. It is theorized that simpler elements are included sooner than more complex ones, but as this is nascent technology, it is unclear how this proceeds, or if it has any consistency.

Experiment and perhaps contribute your research efforts to this wiki!

# Furry Model

The Furry Model is based on a different dataset, and tagging practices. By default, it is set to a higher Scale setting (6.2) and may benefit from running at slightly higher Scale than Anime does.

## Tag differences
The Furry Model uses [E621 Tags](https://e621.net/wiki_pages/1671) instead of Danbooru tags. This leads to several important differences:

* There is no `xGirl` or `xBoy` tags, instead, you specify `male, female, intersex`, etc, and then state the number with `solo, duo, group`
* You can specify colors for different body parts more precisely.
* Gender tags are different. For instance, `intersex` is used rather than `futanari`, and `girly` instead of `otoko no ko`
* Some expression and clothing tags are different.

## Furry Model Quality Tags and Unwanted Content
The default quality tags are the same as for the Anime model, but strengthened. It is `{best quality, amazing quality}` added at the **end** of the prompt.

The light UC is as follows: `nsfw, {worst quality}, guide lines, unfinished, bad, url, tall image, widescreen, compression artifacts, unknown text`

The Heavy UC is as follows: `nsfw, {{worst quality}}, [displeasing], {unusual pupils}, guide lines, {{unfinished}}, {bad}, url, artist name, {{tall image}}, mosaic, {sketch page}, comic panel, impact (font), [dated], {logo}, ych, {what}, {where is your god now}, {distorted text}, repeated text, {floating head}, {1994}, {widescreen}, absolutely everyone, sequence, {compression artifacts}, hard translated, {cropped}, {commissioner name}, unknown text, high contrast`

While most of the tags used in the UC are chosen for similar reasons relative to the Anime UC, there are a few additions that are especially relevant for this model:

* `{unusual pupils}`: Reduces eye artifacts. Pupil shape is highly variable between animals.
* `floating head, guide lines, sketch page, ych, comissioner name,`: Reduces the occurence of unfinished sketch-like drawings often used as bases for Your Character Here art auctions.
* `comic panel, sequence, impact (font),`: Reduces meme-format leaking.
* `text`-related tags and `hard translated`: Text and dialogue is frequently present. This helps reduce text-like artifacts.
* `high contrast`: Reduces the likelihood of eye-searing color palettes.
* `what, where is your god now`: tags used for pictures with especially confusing, abstract, or disturbing/purposefully offensive subject matters.
* `absolutely everyone`: Reduces the likelihood of images with a mess of blobs that are meant to be a huge crowd of characters.
* `1994`: Unclear, but this year has a substantial amount of zoo content and pictures with extremely low, MS-paint like quality.

## Artist Tags for the Furry Model

The Furry model was not trained with artist tags like the Anime model was. As a result, prompting for `artist:artistname` will not result in that artist's style. **However**, any tag you construct this way **will** have consistent stylistic results. You just have to invent and artist's name, and document the results. Hopefully you will find an artist the model "hallucinates" in a pleasing way.

# In-depth UI info

## Anlas Cost Calculation

The calculation for Anlas cost uses the following algorithms:

V3
```
r = w * h
smea_factor = !smea (1.0) else if smea (1.2) else if smea_dyn (1.4)

per_sample = math.ceil(2951823174884865e-21 * r + 5.753298233447344e-7 * r * steps) * smea_factor
```
