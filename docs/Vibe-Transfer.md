# Vibe Transfer
**This is more a set of research notes than a proper guide.** This is meant to help you interpret the feature and possibly get more out of it.

Vibe Transfer is a feature that NovelAI Diffusion V3 offers. It is its own technology and should not be described as "Just" Image-Prompt Adapter, Textual Inversion, and other such utilities, although the purpose is similar.

## What Vibe Transfer?

Vibe Transfer is *probably* best described as "semantic extraction from existing image which is then used as a prompt".

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
• Is more effective
• Requires less tag-searching
• Uses **no** tokens.
