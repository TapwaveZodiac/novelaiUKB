# Vibe Transfer
**This is more a set of research notes than a proper guide.** This is meant to help you interpret the feature and possibly get more out of it.

Vibe Transfer is a feature that NovelAI Diffusion V3 offers. It is its own technology and should not be described as "Just" Image-Prompt Adapter, Textual Inversion, and other such utilities, although the purpose is similar.

## What Vibe Transfer?

Vibe Transfer is *probably* best described as "semantic extraction from existing image which is then used as a prompt". It is **not** a LORA, Image-Prompt Adapter, or Textual Inversion Embedding, but its own technology.

This produces semantic data which is used **concurrently** with your prompt. It is not mixed and averaged with it. Instead, the relative strength of the semantic data is determined by the *Reference Strength* parameter.

To make the explanation simpler, we can compare it to Image To Image and Inpainting.

**Image to Image**

• Uses the image as a whole, and *then* iterates on it based on the prompt.

• Processes image information *solely* in the image space. No semantic interpretation is made.

• Is used to make adjustments to an existing image.

**Inpainting**

• Uses the surrounding area to the mask, but ignores everyting that is in the mask area.

• Interprets the surrounding elements to the mask and attempts to generate something that melds into it.

• Is used to regenerate parts of an existing images.

**Vibe Transfer**

• Takes an existing image and then interprets it in order to extract "meaning" out of it.

• Applies the meaning it extracted to a new generation.

• Is used to tune generation towards a style or type of content.

## Why Vibe Transfer?

You may remember **Prompt Mixing** (which you can still do). Vibe Transfer does more or less the same thing, but it is more effective, doesn't require tag-searching, and also uses **no** tokens, and **no** extra Anlas.

As a result, using "Key images" for Vibe Transfer is a much more versatile and stress-free way to tune your generations. Instead of using an image entirely as a base through Image To Image, you are using an image's *elements* as a base for *new* generations.

This allows you to replicate style from artists that aren't well represented in the finetune, or characters that have a low amount of art. This is done in a way that actually respects the content, whereas Image To Image fundamentally applies the existing model vectors to the image, which makes you *lose* information.

## When Vibe Transfer?

Vibe Transfer is best used to affect your generations until you get something close enough to what you want in terms of content and style, at which point you can do one of the following.

1. Use the image as is, because you feel it is good enough.

2. Disable Vibe Transfer, and use Image to Image to make corrections that do not require extensive processing.

3. Use Image to Image **and** Vibe Transfer simultaneously if you have trouble "preserving" the content that VT provided you. The Image to Image generation will be affected by VT and hopefully preseve that information not normally present in the model.

**VT is not used when inpainting.**

In general, if the information you extracted out of VT was mostly **style**, you shouldn't need to keep it enabled for further processing, but if it was **content and complex details**, then keeping it on is probably a good idea.

## How Vibe Transfer?

In actual use, Vibe Transfer works like a concurrent prompt, which is processed along with your normal Positive/Negative prompt.

**Reference Strength** is how strong this concurrent prompt is. The higher you go, the less your Positive and Negative prompts matter. Too high, and you're just using extracting the prompt out of the image, more or less.

**Information Extracted** is the "quantity of information" that the VT model retrieves from the base image. Think of it as using a magic wand selector in image processing, and the setting is the tolerance. Higher tolerance means it'll retrieve more.

## Information Extraction

The best way to illustrate the influence of information extraction is to generate an image with an extremely short prompt with VT, and see how much you "retrieve" from the VT image without prompting for it as you adjust the setting.

For this example, we are using Aini's illustration of Clio. This is useful because Aini's illustrations have very complex shading, a definite and identifiable style, and makes use of small details quite extensively.

We are using the same settings as my artist analysis sheet. This means Seed **1**, **25** Steps, Guidance of **5**, **100%** UC strength, and the **Euler** sampler with **Native** scheduling. Reference Strength is set to the default of **0.6**

The prompt here is ```[amazing quality, very aesthetic], 1girl, blonde hair, aqua eyes, adjusting hair```. UC is ```worst quality, low quality, bad image, displeasing, [abstract], bad anatomy, very displeasing, extra, unfocused, jpeg artifacts, unfinished, chromatic aberration, womb tattoo,```

![Ref1](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/7c085a8c-3ab4-40c5-8421-75a72aaf06d5)

As you can see, there are *Information Extracted* thresholds where notable changes happen. Composition switches closer to the reference image at 2.955%, Style starts to carry over around 7%, and more detailed elements of shading and texture are present from 14% onwards.

Returns are sensibly diminishing past that, with 30% and 100% having extremely similar outputs. Tests for 40-99% were carried out and have remarkably similar images.

These thresholds are not, however, perfectly consistent. Here is a comparator with the same settings, but with the following prompt: ```sidelocks, braided bangs, no bangs, braided bun, single hair bun, forehead, medium hair, platinum blonde hair, aqua eyes, laurel crown, laurels, leaf on head, aqua shawl, aqua choker, white dress, {{{sideless outfit}}}, cross-laced corset, golden bangle, gold ring, sandals, {{{{medium breasts}}}}, [[[[small breasts]]]], greek goddess``` UC: ```parted bangs, gold leaves```

![ref2](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/2e4ce97f-70df-4b96-89d3-da6e786022f8)

In general, there are thresholds in the areas listed, but those shift about based on prompt complexity. It appears that order of Information selected is, more or less:
* Composition
* Details
* Shading and Coloring

## Reference Strength

Reference Strength is the influence of the VT relative to your prompt. With a Strength of **1**, your prompt is effectively disregarded entirely. This is not the same as Image to Image with no Strength.

Using the same settings and prompt as before, we'll now adjust Strength only, and leave IE at 100%.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/2af6d4f1-c7f8-40b7-ba0b-ee042fe5ead4)

The thresholds are somewhat comparable at first, but it is clear that the parameter scales higher than IE does.

To compare, here are the same settings, but IE is set at 50% instead of 100%.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/8b86b1e8-a24a-4f9b-94f6-f1def5918b8d)

As with all settings, remember to fine-tune based on your preference. Start small and do increments of ~5% at most until you find your happy medium.

## Other Recommendations

Not organized. Just things worth experimenting with

@shambibble: Since VT image doesn't need to match the size of the generated image, you can collate images with elements you want together as one big image, and feed it into VT.
