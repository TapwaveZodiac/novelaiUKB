This page serves to catalogue interesting tags for image generation, which can lead to useful behavior, or have unusual effects that can be exploited **reliably**.

# V4+

## V4.5 Text: character style seeding

If `Text:` is followed by non-ASCII characters, unexpected behavior occurs. Normally, non-conventional characters are converted into `UNK` tokens. However, if these characters are in a `Text:` segment, this does not appear to be the case, even though it should be.

Expected behavior would be that `Text:ドキドキ` and　`Text:フラフラ`, being the same length, should encode the same way, as `Text:` followed by four `UNK`.
On V4.5, this generates different images instead. This is because V4.5's tokenizer supports Japanese tokens, but these have not been trained for, and their effect isn't properly defined as a result.

## 0 or Micro-strength tags
The mere presence of a tag, even if it is `0.001:tag::` or `0::tag::`, has an influence on generations. This is remarkably powerful at influencing style, especially for things such as `nsfw` and other artistic medium tags. This is because a token appearing at all affects the semantics of all other tokens.

## Tag Strength Normalization

On V4 tag emphasis is Zero-sum. This means that if you strengthen a tag, other tags are weakened. This is not the case on V4.5. 

## Vibe Low/High Pass Filter

Since Vibe Transfer appears to convey pose and character information at low IE, and style information at higher IE, using the same Vibe twice, but setting the second instance at negative strength, and IE~0.1-0.3 should keep the style information but cancel out the character/pose adherence. This works like a low pass filter. The opposite is also possible for a high pass filter.

# V1-V2
## Tags and Tag Combos

> prismatic

Leads to gem-like and colorful elements. Can be combined with specific objects or facial features. Is rather strong, so it is better used with some weakening.

> freckled skin

V1: Much more reliable and artifact-free freckles. Generally subtle, cheeks/shoulders.
V2: use `freckled body` instead.

> braces + fangs / sharp teeth / razor teeth

V1: Generally leads to more detailed sharp teeth that are more consistently shaped.
V2: Unnecessary. Fangs generates sharp canines, sharp teeth generates seesaw teeth as expected.

> rigid teeth

V1: "Cringing" or gritting teeth. Without facial expression, generally has a note of disgust/disappointment.
V2: Makes the character yawn (slightly squinted eyes and open mouth with teeth above and below), better than then `yawning` tag.

> lion hair

Very voluminous and wild hair like you'd expect out of a lion girl's mane. Animal ears will tend to generate, so put them in UC if you don't want them.
V2: `Lion girl` tends to generate that kind of hair by default.

> shaped pupils

Usually leads to white/light colored pupils with dense iris detail.
V2: Mostly makes pupils white, and sometimes shapes them like hearts, or slits.

> X-Y-Z-hair

Can be used for tri-tone hair. Order is not always respected, and it generally goes from tips to roots.

> Detailed Skin

V1: As opposed to "Detailed" which often damages quality by itself, this can lead to faces with greater texturing and more fancy-looking eyes. Tends to give lipstick to characters, so Lipstick can be put in UC.
V2: Affects the general texturing, and has a stronger effect on outfits than skin. Tends to change facial anatomy quite strongly.

> white inner eye

 V2: brightens irises. Combine with `empty eyes` to create irises that are bright and flat colored.

## Magic UCs

> petite, loli, toddler

Severely reduced youthfulness for all. Should always be used when generating anyone adult-looking.

> 幼児化

Infantilization in Japanese. Adds maturity to the subject.
V2: less effective.
V3: No effect.

> claw

Tends to improve hand anatomy by reducing sharp angles.

> tears

Reduces eye artifacts when using tags like `colored eyelashes, eyeliner, eyeshadow`
v2: Not necessary.

> sanpaku

Seems to break away from "NAIDiffusion style" with default quality tags. More detailed eyes.
V2: Increases iris size as expected, but no other notable effect.

> jpeg artifacts

Already in default UC but worth reinforcing when using very low scale and more painterly styles like `watercolor, ink sketch`

> red eyeliner, red eyeshadow

V2: `Eyeliner` and `Eyeshadow` tend to create red outlines around the eyes of characters. If you want thick eyelashes, try `mascara`

> chromatic aberration

Improves outline clarity and reduces color artifacting around them.  Already in the default UC in Heavy and Human Focus (V3 only) presets.

> genshin impact

V2: Strongly interferes with some prompts, it may be worth using if you feel the style is stilted with your current prompt.
