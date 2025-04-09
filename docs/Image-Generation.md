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
Boorus are "imageboards", sites where large amounts of images are saved in order to catalogue the body of work of artists. This stemmed from a difficulty to find and archive art reliably, as Japanese artists have a very different relationship with their works than Western cultures do.

As a result, these sites were created to host as many images as possible, and make them easy to find by applying tags. These tags describe elements of the image, such as character design elements (hair, eyes, etc), poses, objects, and much more.

There are two parts to training: Quality training, and Aesthetic training. This will be explained in the next section.

If you are going to go and trawl Danbooru's tag database, keep in mind that the site is **extremely unsafe for work!**

If you are using the Furry model, **you'll need to use E621's tags.** These can also work on V4, to a degree.
This means all the following information will not work for this specific model. E621 is just as extremely unsafe for work.

***

# Diffusion Models

A diffusion model works by resolving noise into an image. If you ever used a photo editing tool to remove noise from an image, the idea is the same, except pushed to its logical extreme. You are giving the AI nothing *but* noise, and ask it to denoise it into a full image.

This has several implications:

• The AI has **no grasp** of the position and boundaries of image elements. It knows what it's trying to make, but it does not know where things start and end *exactly*.

• The AI does not have pure semantic understanding of tags. It just knows that this tag tends to lead to those shapes and those colors. It does not understand what hair *is*, but just how it *looks* and how it is usually drawn.

• For older models, the AI does not know what applies to what in the image, this means you can't tell it "I want this, but ONLY for this character". This is why it can struggle with multiple characters in long prompts. **For V4, you have character tagging, but it is not perfect. Sometimes, the character may merge together.**

## Noise V. Sampler:  Steps, Scale/Guidance and Seed

Diffusion models work by using Steps to resolve noise. The more steps, the more compute is used, (which is why the Anlas cost goes up with steps). Most NAI models were trained from **Stable Diffusion** models. V4 is an inhouse model.

Steps are carried out by a **Sampler**, which attempts to resolve the noise based on an algorithm. Each Sampler uses a different algorithm, and has different results. Some Sampler are *Ancestral*, meaning they iterate in a way that performs well at lower steps more quickly than non-Ancestral samplers. 

(That does not mean they perform better **in general**, just that it costs less to get them to look decent.)

Scale/Guidance affects *how much* the prompt affects the Sample steps, but not their "intensity" or their "length". **All steps are equal in terms of compute**. Guidance thus does *not* affect cost.

However,  **Negative Guidance Scale** *does*, because it uses additional processing power to run **CFG** or **Classifier-Free Guidance**. If the Negative Guidance is equal to Positive Guidance, then there is no need for extra compute, and the cost is the same.

**Noise** is the primordial soup from which the AI will unravel an image. **Seed** is what decides the base noise pattern, however, **Noise Schedule** in Advanced Settings changes how that noise is generated and interpreted by the sampler, resulting in different outputs with the same seed.

Effectively, Noise Schedules are variations of the same Sampler's algorithm.

For V4, `Karras` is the default noise scheduler. `native`, `exponential` and `polyexponential` are *mostly* comparable to each other, with minute differences.

## The limits of Guidance

Guidance is nice and all, but V2 and **especially V3 and V4** work best at a narrow band of scale. V2 works well from 3 to 11, while V3 and V4 works best at 2-6.

Guidance is much stronger on V3 because it uses a different base model, which is more reactive than V2.

Higher scale leads to stronger contrast, stronger outlines, and all around stronger "bounding" of elements. This can also cause some elements to overpower others more readily. This is why low scale is considered more "painterly", because noise is resolved more loosely, which leads to the aesthetic "blurriness" of mediums like watercolor, oil paint, etc.

Addtionally, with multiple character prompts, higher scale may be preferable.

To allow for a stronger Prompt Guidance without having those issues, the advanced setting **Prompt Guidance Rescale** attempts to compensate for them, but this will result in a blurrier output. You can always use image 2 image to refine the picture once you feel the base is good enough.

Much like Negative Prompt Guidance, you should adjust Rescale in very small increments starting from 1. Start in increments of 0.1 or 0.2 with the same seed, and decide what you prefer from there.

## SMEA

SMEA is an application of Euler Ancestral sampling, but instead of being applied once per generation, it is applied iteratively, per step. This can result in increased image quality, and is especially useful at **larger resolutions than the base resolutions**. SMEA is used for V1-V3 models, and V4 uses its own solution independently, meaning it does not require it.

SMEA requires considerably more compute (and its Dynamic version even moreso), so it will lead to **increased Anlas costs**. The other issue is that generating with SMEA with the same seed will lead to very different results than without, so you cannot try and find a good base cheaply, then regenerate it with SMEA.

As a consequence of how it functions, SMEA reduces the influence of Guidance. Thus, when turning it on, you should also increase Guidance slightly to compensate.

## Decrisper

When operating at high Scale settings, the aesthetics can get lost as contrast grows excessive, shapes break apart, and colors leak into the wrong areas. To correct this, Decrisper dynamically sets thresholds on the [image latents](https://x.com/Birchlabs/status/1582165379832348672) for every diffusion step, in order to keep them in a more "expected" space. This helps keep things on track and avoid a breakdown of style during generation at higher scale. You may require to turn it on as early as ~7-8 Scale on V3.

Decrisper has no effect on V4 and isn't available for it.

## Variety Booster

A side effect of high scale setting is that the increase in consistency results in a loss in variety. In order to circumvent that, you can let the model generate without guidance for a very small amount of steps, letting it start with a more audacious base, and *then* enable guidance and get the positive effects of a higher setting, without compromising the model's creative abilities.

NovelAI detects when the general composition and body shape (if applicable) is present, and then enables Guidance for the remainder of the steps. Keep in mind that this requires your negative prompt to only kick in at the same time as guidance, so this can lead to it being less effective, and artifacts or unusual props appearing.

***

# Tag-based Prompting

To use Tags in NAIDiffusion, simply assemble a list of tags freely. Use commas to separate tags. While tags on Boorus use underscores instead of spaces, the parser replaced all underscores 'with spaces' to make it easier to write prompts.

Thus, write prompts with spaces in them if they use multiple words, and bound them with commas. Forgetting a comma might cause the prompt to be interpreted incorrectly. **It is important to write your tags in all lowercase (even for proper nouns) and properly space them, as the tokenizer will not automatically flatten case or correct spacing. Try to only use latin characters and punctuation.**

When autocompleting tags, a comma will be added automatically. **Tags do not require underscores, with the exception of facial expressions like `^_^`. You should not use underscores outside of these specific tags.**

Keep in mind that most non-latin characters and punctuation will be turned into `UNK` tokens. The AI generally interprets those as tildes or hearts in dialogue.

Something that is important to note is that prompts are interpreted with linear priority, which is the reverse of text generation. What comes first has more weight, but the rest is more or less normalized in strength. It can be useful, or detrimental depending on the result, to put style, composition, or artist tags at the very beginning of the prompt, as it will strongly increase their effect.

Tag-based prompts tends to lead to consistent designs. However, they come out stylistically different and less diverse than Prose-based prompts.

There are several tag categories that are important to know, due to how extensively they were used in tagging.

## Quality Tags And Aesthetic Tags

You may have heard of the `masterpiece` tag being used to "improve generation quality". This goes a little bit more in depth.

Images were classified according to a percentile "quality score". Different tags were then applied to training images based on that score.

**For V1**, from highest percentiles to lowest percentiles:

`masterpiece, best quality, high quality, normal quality, low quality, worst quality`

**For V2 onwards**, from highest percentiles to lowest percentiles:

`best quality, amazing quality, great quality, normal quality, bad quality, worst quality`

Keep in mind that "amazing quality" incidentally has more NSFW content, so it may be more appropriate to use for NSFW images, as opposed to "best quality". (This also explains why it tends to generate beaches and people in swimsuits.)

If you use any of the Unwanted Content default filters, `worst quality, bad quality,` are **automatically inserted in Unwanted Content**. You can disable the filter or write them in your prompt to activate them anyway.

**Aesthetic tags** are used exclusively in V2 and V3 and onwards to designate pictures which match the intended "feel" of the model, as opposed to images that diverge too greatly from the aesthetic that NovelAI sought. The tags for Aesthetics are:
`very aesthetic, aesthetic, displeasing, very displeasing`

Effectively, displeasing images stray too far from the intended "look" of NAI Diffusion, or have aesthetics considered "poor" so that the model knows to avoid them.

You only need one tag for quality and one for aesthtics, though generally you won't need one. It is better to downbias bad things than overly bias "good" things, as this may damage creativity. Generally just using the default Unwanted Content and Quality Tag presets will be fine.

## Counting Characters and Gender

**For V4, this mostly helps for composition. Character tagging mostly supersedes this, but it can be useful to use gender/number tags as to ensure consistency.**

One of the ubiquitous booru tags is the gender count tag. Whenever there is a number of characters in frame, then they are counted by gender.

The tag format is always the same. A number from one to 6 (with a plus if more than 6), followed immediately by the gender. `1boy, 2girls`.

You can also use `other` as a gender for androgynous or transgender characters. Generally, they will look rather feminine nonetheless.

This tag is almost universally put in first position because it starts with a number rather than a letter, but you can put it anywhere. Those tags are **very** powerful, so you might not even need to use them, if you simply describe a character. It is mostly to make sure you have that number of characters in frame, or reinforce gender expectations.

**However, V4 strongly expects these tags, even if using multi-character prompts. You should try to include them as a result.**

If you are looking to generate gender noncomforming characters, here are a few tags.

`twink, otoko no ko,` or `1girl, flat chest` can help generate soft boys. (You may need to put `breasts` and similar tags in Unwanted Content)

`toned female, tomboy` can help generate butch girls.

## Character Reference and Artist Reference

After you specified quality and character number/gender, you'll want to specify, if applicable, the **Reference Character**, followed by its **source franchise**.
Keep in mind that Boorus use Japanese name order, meaning that family name comes first for Japanese characters.

`yor briar, spy x family`

`yamamura sadako, the ring`

If you wish to use an artist's style, use `artist:(artistname)`.

For example, if you want to generate Makoto Kusanagi in the style of the latest Ghost in the Shell production, you would use:

`Kusanagi Makoto, ghost in the shell, Artist:Ilya Kuvshinov,`

You can, of course, put this information anywhere else, this is simply how file names are generally arranged.

**Keep in mind that characters with a low amount of images are easier to generate on the curated model *if* their images are mostly safe for work.**

### "Hallucinated Artists"

When using `artist:` You can add *any* name as an artist name, rather than a real one. Sometimes, the effect is quite remarkable and consistent. Experiment and document those you enjoy most!

## Tag Interaction

An easy way to mess up your generations (or improve them!) is to have tags that interact. One common example of tags overwriting each other is as follows:

`1girl, brown hair, blue eyes, sleeping, eyes closed, laying down`

While the problem is not immediately apparent, specifying an eye colour *and* them being closed means that one will be ignored in favour of the other. **Make sure you don't specify information about things that are not in frame.** Images on Danbooru follow the **"tag what you *see*"** guideline.

A more positive example is:

`1girl, black hair, blue highlights, blue eyes,`

Putting a color highlight next to the hair color will give you colored strands and bangs. Adjust the wording until you get the specifics you like!

### Incomplete Interactions

Breaking up interactions that occur naturally can result in artifacts or odd elements. It is easy to achieve if you strengthen a specific part of a tag rather than the whole tag.

`1girl, black hair, {{{orange}}} eyes`

This can lead to the spontaneous appearance of tasty, tasty oranges everywhere in frame. Whether or not this is a bad thing is up to you.

### Priority Interference

As tags placed earlier in the prompt have more strength, colors and other elements tend to leak.

`blue eyes, black hair`

Can lead to the hair being tinted blue, or being blue outright. Eyes tend to have powerful color influence on other elements, as most character designers tend to match palette to the eyes. Thus, it may be better to write the hair tags first to avoid that.

### Mutual Dependencies

Some tags implicitly require each other and can lead to artifacts or tags being ignored if one of them is banned through Undesired Content.
For example, requesting `gloves` needs hands to be visible, so if you want no hands in frame, do not request anything that hands would manipulate or wear, or gestures that require hands to be performed.

### Facial Expressions

You'll quickly realize that facial expression tags are non-intuitive and lead to odd faces. This is because emotions aren't often tagged, and their vectors are surprisingly strong. Try putting `shy` in UC and you'll see what this leads to. Some like `pensive` work fine as is.

There are various emotes that can be used as facial expressions, with fairly strong vectors: `:), :(, :3` and so on.

Be aware that some, like :|, can break the prompt. Try using an emoji instead: 😐, or look up the tag database. (For instance, this would be `expressionless`)

Having characters look in certain directions also tends to force certain poses. `looking back` has a strong tendency to partially obscure the face with the shoulder, and make the character bend over.

## Strenghtening and Weakning Math

You may have seen curly braces and square brackets be used to make a tag stronger or weaker. Here is a more direct explanation.

Each tag has a base value of 1.

If `]` or `{` is present, multiply the **weight multiplier** for all tags following it by 1.05 (a 5% increase).
If `}` or `[` is present, multiply the **weight multiplier** for all tags following it by 0.95 (a 5% decrease).

This operation is **multiplicative**, and **make generations partially non-deterministic.** In the following examples:

`blue eyes, black hair`

`{[{[blue eyes, black hair]}]}`
Will lead to different results on the same seed and settings.

You do not need to close bracket pairs. Hell, you don't even need to open them!

`{blue eyes, black hair`

and

`]blue eyes, black hair`

Are fundamentally the same.

## Setting the Base weighing

You can directly specify the tag weight by entering a number, then **two** colons. `1.05::`, for example, adds 5% to the weight.

The weight affected by this is the *base weight*. Weight affected by braces and brackets is a *multiplier* that is calculated *on top* of the base weight.

This will affect **every tag afterwards** until you close the weighing section with another pair of colons: `::`. which is equivalent to setting the *base weight* to 1, refer to the table below for values equivalent to the number of braces you would have used. **You can have as many decimal places as you want when specifying your base weight**, technically, but don't overdo it, or it may break the parser.

e.g. `1.2::long hair, blue hair, wavy hair::, blunt bangs` will strengthen everything from long hair to wavy hair, then set the base weight back to 1.

You can use braces and brackets after setting the base weighing, as this sets the multiplier, which is then applied to the base weight. i.e setting the base weight to 1.2 and using a set of braces will do 1.2*1.05.

**However, setting the Base Weighing immediately closes braces and brackets opened before you did so, if they are still open.**

This means that you **shouldn't close** anything you have opened **before** the base weight setting! 

![image](https://github.com/user-attachments/assets/55782f7c-f523-4ce4-bc92-c7b36a1102fc)

It will be interpreted as a loose bracket/brace and change the multiplier once again.

Specifically, it uses this regex for parsing: `-?\d*\.?\d*::`. This means that entering `-.`, `-.::`or `-::`as the value is equivalent to setting the base weight to 0. `::` without a value is equivalent to `1::`. 

**If you are weighing prose or anything that ends on a period, or a number put a space before the closing colons.** This is because a period followed by two colons will be interpreted as a zero-weight, and any number will be interpreted as the weight as well.

i.e `1.2::year 2002::` will set base weight to 2002 and cause shenanigans. Do `1.2::year 2002 ::` instead.

## Strengthen autocomplete

You can automatically strengthen a tag by highlighting the entire tag in the text box, then pressing any **opening** bracket or curly brace key. It will automatically frame the tag with the type you've selected. This doesn't work with numerical weighing (yet).

## Strenghtening value cheat sheet

![image](https://github.com/user-attachments/assets/44740f46-86c9-4421-a728-eb57ccd88e11)

Table graciously provided by **DarkTentacleMaster**! 

If you are using **legacy prompt conditioning**, the model reads the prompt differently.
There is no easy explanation for this that we have access to (even from the devs).Keep in mind the "old" math is purely here for historical reasons. Only the right side of the table is in use.

## Unwanted Content, or "Negative Prompting"

Unwanted Content is a way to direct the generation away from things you'd like to avoid. By virtue of how it works, UC is rather "destructive", so you should keep it as short and focused as possible. Generate with a short UC, then narrow it down based on what you need per image.

There are multiple default UC presets, we will focus on V3's specifically to explain what each element does.

V3

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


== V4 information TBA ==

***

# Character Prompting

V4 allows you to specify prompts *per character*. The base prompt will apply to the entire scene. 

## Per-character Tagging
Each character prompt uses its tags for a single character, this includes unwanted content. To create a new character prompt, click "Add Character".

![image](https://github.com/user-attachments/assets/6634ddc8-d9d9-4686-b0e6-a25eda2e4a96)

Be mindful that there can be some leakage between characters, especially when using compositions that focus on a single character, such as `portrait`.

## Positioning

By default, the AI has a general idea of how to position characters based on what interactions you have specified. Otherwise, you can center them to a specific 5*5 grid position on the canvas. Be careful not to forget to adjust it if you have made changes to posing/interaction tags.

If no positions are specified, the AI will tend to order characters from *top to bottom, left to right*.

## Interaction source and target

Any interaction such as `licking another's face` can have a **Target** and a **Source**. To define the target, put the tag in their prompt, and append `target#` immediately before the tag in question: `target#licking another's face,` Source works the same, with `source#` instead. You may also use `mutual#` for actions that the characters are doing to each other.

Keep in mind that the AI may sometimes mix the roles up and be confused. Higher Guidance **can** alleviate that, but this may cause other issues.

***

# Prose Prompting

To prose-prompt in NAIDiffusion, simply write a sentence describing the image. Use commas to separate clauses. Try to write neatly with proper grammar and punctuation, and try to phrase your sentences so that you use vocabulary close to Booru tags. You can use prose both for scene (main prompt), or character prompts, but it is more difficult to reliably describe characters in prose.

It is recommended to use prose to describe scene, image composition and style. Elements are usually easier to simply tag like usual.

Again, prompts are interpreted with linear priority, which is the reverse of text generation. What comes first has more weight, so keep the core content at the beginning of the sentence.

Prose-based prompts tends to lead to more varied output. They are stylistically different and more diverse than Tag-based prompts, and are best suited for situations or scenes which are very dynamic and which do not require consistent character portrayal.

## Referring to Characters in a Prose Prompt

When adding character prompts, start them with the name you wish to use to refer to the character in the prompt. Do not put it in quotes. You can either follow it with a colon or a comma, but be aware that some names are valid tags and may be interpreted as such.

After this, use the name at the start of character prompts to refer to that character in your prose prompt.

### Story Conversion

You can, with some slight adjustments, copy paste excerpts from your story and use them as prompts. There might be some fine tuning needed, but you should get something similar to what was described.

***

# Text-on-image Prompting

You can request V4 to generate text by using `text:your text here.`

When using Text prompting, write your prompt as normal, and end it on a period. (**.**) Then, add the text prompting at the very end of the prompt, after this period.

If you want to have multiple units of text, separate them with a **linebreak**. Make sure your text units end on a period, exclamation or question mark if possible.

Both of these examples work, your mileage may vary:

```
2girls, full body, speech bubble.
Text: Go to bed!
Text: I don't want to...
```

```
2girls, full body, speech bubble, Text: Go to bed!
I don't want to...
```

***

# Tag Randomization

You can randomize a section of your prompt by encasing it with pairs of pipe characters: `||`. Once a randomized section is open, write any tag you want, then add a single pipe `|` to add another tag to be randomly selected. Close with another pair of pipe characters. 

You can also only put in part of a tag, if you want to randomize the color of hair or eyes, for example. Both `||tareme|tsurime|jitome||` and `||red|blue|orange|| eyes` work.

Remember not to put spaces at the end of a random selection. Just put it at the end of the entire section so that it formats neatly. That means `||burger |hotdog ||` is bad (it'll doublespace). However something like `||red |blue ||eyes` works as well. Just make sure that it leads to a properly spaced prompt after an option is selected.

You can also have a random "nothing" option by just putting a single comma as a random selection. `||tall|,|short||` Double-commas get purged from the prompt, so this results in a blank if the option is selected.

You can strengthen and weaken tags inside a random selection just like anywhere else.

The strengthening will only apply to the selection if it was picked *as long as the brackets or weighing factor is inside the random selection*. Like this: `||1.2::tomato::|{{potato}}||`

Otherwise it'll apply to the entire set of options, like this: `1.2::||foo|bar||::` This will apply 1.2 to both options. (You can still add brackets and braces in there afterwards.)

It is also possible to randomize your weight factor! Try `||1.1::|1.2::|1.3::||`

After you used a random prompt, check the "Actual Prompt" at the bottom to get the result with all the final selections only. The rest will have been purged.

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

[Clip Interrogator](https://colab.research.google.com/github/pharmapsychotic/clip-interrogator/blob/main/clip_interrogator.ipynb#scrollTo=YQk0eemUrSC7) can be used to read an image you like and extract tags and prose that will help you refine your prompt.

**V4 does not use CLIP, therefore, this is less useful when seeking tags for V4.**

### Combo Prompting

If you are generating an image of a specific character that has trouble coming out consistently, perhaps because there are other characters with a similar name, you can combine character and franchise tags in order to obtain something closer to the desired result.

`sotheby, Reverse:1999,`

# Vibe Transfer

Vibe Transfer is a feature that reads an existing image and attempts to apply existing elements from it onto a new generation. This is not **quite** Image to Image, as it lets you generate new content, rather than mapping off of the existing image.

While this can be compared to [Image Prompt Adapter](https://huggingface.co/h94/IP-Adapter), or [Textual Embedding](https://ieeexplore.ieee.org/document/10377571), Vibe Transfer is its own technology and uses a trained model. The details are as of yet kept confidential.

Two settings are at play when using Vibe Transfer to prepare a generation: **Reference Strength** and the **Information Extracted** Factor.

**Reference Strength** is the inverse of Image to Image Strength. The higher it is, the closer the generation will be to the VT Reference image. Since the image itself is not used as-is, it will not be replicated, but excessive strength will cause prompt vectors to be overpowered by the VT Reference's content, generating something very similar to it in terms of content, even if you did not prompt for it.

**Information Extracted** is best compared to using a Magic Wand selector in an image editing software. Instead of selecting pixels based on color, you select an increasing amount of "meaning" from the image. It is theorized that simpler elements are included sooner than more complex ones, but as this is nascent technology, it is unclear how this proceeds, or if it has any consistency.

Experiment and perhaps contribute your research efforts to this wiki!

***

# But what about ControlNet? And LoRAs?

V4 is an inhouse model, and most plugins are designed for Stable Diffusion. It's like trying to put an USB key in a HDMI port. Maybe it looks similar, but it's not going to work. LoRAs are also risky, as they allow the model to generate content that Anlatan isn't legally allowed to provide, such as photorealistic renders.

Therefore, be patient, and hope for the team to develop inhouse tools!

***

# Furry Model

The Furry Model is based on a different dataset, and tagging practices. By default, it is set to a higher Scale setting (6.2) and may benefit from running at slightly higher Scale than Anime does.

**In V4, you can use E621 tags by adding `fur dataset` at the start of the prompt.**

## Tag differences
The Furry Model uses [E621 Tags](https://e621.net/wiki_pages/1671) instead of Danbooru tags. This leads to several important differences:

* There is no `xGirl` or `xBoy` tags, instead, you specify `male, female, intersex`, etc, and then state the number with `solo, duo, group`
* You can specify colors for different body parts more precisely.
* Gender tags are different. For instance, `intersex` is used rather than `futanari`, and `girly` instead of `otoko no ko`
* Some expression and clothing tags are different.
  
Tag for species by preceding them with `species:` For example: `species: domestic cat`.

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

The Furry model was not trained with artist tags like the Anime model was. As a result, prompting for `artist:artistname` will not result in that artist's style. **However**, any tag you construct this way **will** have consistent stylistic results. You just have to invent an artist's name, and document the results. Hopefully you will find an artist the model "hallucinates" in a pleasing way.

# In-depth UI info

## Anlas Cost Calculation

The calculation for Anlas cost uses the following algorithms:

- V1 and V2 (under 1 megapixel for plms/ddim/k_euler/k_euler_ancestral/k_lms samplers)
```python
r = width * height  # in pixels
size = r / 1024 / 1024  # in megapixels

per_image = math.ceil(15.266497014243718 * math.exp(size * 0.6326248927474729) - 15.225164493059737) * steps / 28)
```
For V1 and V2 images over 1 megapixel or using other samplers, see the [cost tables](https://github.com/Aedial/novelai-api/blob/2174602d346152d38ce2b43fcec8c9666a72f89a/novelai_api/ImagePreset.py#L588).

- V3 & V4
```python
r = width * height  # in pixels

if smea and smea_dyn:
    sma_factor = 1.4
elif smea:
    smea_factor = 1.2
else:
    smea_factor = 1.0

per_image = math.ceil(2951823174884865e-21 * r + 5.753298233447344e-7 * r * steps) * smea_factor
```

Strength and uncond scale are then applied to the per_image cost.
```python
per_image = math.ceil(per_sample * strength)
per_image = math.max(per_image, 2)
per_image = math.ceil(per_image * uncond_scale)
```

If the parameters fall within the Opus free image limit, one image is removed from the cost calculation (only applies for Opus users).
