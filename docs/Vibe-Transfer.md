# Vibe Transfer
**This is more a set of research notes than a proper guide.** This is meant to help you interpret the feature and possibly get more out of it.

Vibe Transfer is a feature that NovelAI Diffusion V3 offers. It is its own technology and should not be described as "Just" Image-Prompt Adapter, Textual Inversion, and other such utilities, although the purpose is similar.

## What Vibe Transfer?

Vibe Transfer is *probably* best described as "semantic extraction from existing image which is then used as a prompt".

It is **not** a LORA, Image-Prompt Adapter, or Textual Inversion Embedding.

To make this simpler, we can compare it to Image To Image and Inpainting.

**Image to Image**

• Uses the image as a whole, and *then* iterates on it based on the prompt.

• Processes image information *solely* in the image space. No semantic interpretation is made.

• Is used to make adjustments to an existing image.

**Inpainting**

• Ignores everyting that is in the mask area.

• Interprets the surrounding elements to the mask and attempts to generate something that melds into it.

• Is used to regenerate parts of an existing images.

**Vibe Transfer**

• Takes an existing image and then interprets it in order to extract "meaning" out of it.

• Applies the meaning it extracted to a new generation.

• Is used to tune generation towards a style or type of content.

## Why Vibe Transfer?

You may remember **Prompt Mixing** (which you can still do). Vibe Transfer does more or less the same thing, but:

• Is more effective.

• Requires less tag-searching.

• Uses **no** tokens, and **no** extra Anlas.

As a result, using "Key images" for Vibe Transfer is a much more versatile and stress-free way to tune your generations. Instead of using an image entirely as a base through Image To Image, you are using an image's *elements* as a base.

This allows you to replicate style from artists that aren't well represented in the finetune, or characters that have a low amount of art. This is done in a way that actually respects the content, whereas Image To Image fundamentally applies the existing model vectors to the image, which makes you *lose* information.

## When Vibe Transfer?

Vibe Transfer is best used to affect your generations until you get something close enough to what you want in terms of content and style, at which point you can do one of the following.

1. Use the image as is, because you feel it is good enough.

2. Disable Vibe Transfer, and use Image to Image and Inpainting to make corrections that do not require extensive processing.

3. Use Image to Image/Inpainting **and** Vibe Transfer simultaneously if you have trouble "preserving" the content that VT provided you.

If the information you extracted out of VT was mostly **style**, you shouldn't need to keep it enabled for further processing, but if it was content and complex details, then keeping it on is probably a good idea.
