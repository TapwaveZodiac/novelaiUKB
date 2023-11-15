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

• The AI has **no grasp** of where is what element. It knows what it's trying to make, but it does not know where things start and end *exactly*.

• The AI does not have pure semantic understanding of tags. It just knows that this tag tends to lead to those shapes and those colors. It does not understand what hair *is*, but just how it *looks* and is usually drawn.

• The AI does not know the bounds of elements in the image, this means you can't tell it "I want this, but ONLY for this character". This is why it can struggle with multiple characters in long prompts.

## Noise V. Sampler:  Steps, Scale/Guidance and Seed

Diffusion models work by using Steps to resolve noise. The more steps, the more compute is used, (which is why the Anlas cost goes up with steps).

Steps are carried by a **Sampler**, which attempts to resolve the noise based on an algorithm. Each Sampler uses a different algorithm, and has different results. Some Sampler are *Ancestral*, meaning they iterate in a way that performs well at lower steps more quickly than non-Ancestral samplers. 

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

**Aesthetic tags** are used exclusively in V2 and onwards to designate pictures which match the intended "feel" of the model, as opposed to images that diverge too greatly from the aesthetic that NovelAI sought. The tags for Aesthetics are:
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

`twink, otoko no ko, "girl, flat chest"` can help generate soft boys.

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

An easy way to mess up your generations ( or improve them!) is to have
tags that interact. One common example of tags overwriting each other is
as follows:

`1girl, brown hair, blue eyes, sleeping, eyes closed, laying down`

While the problem is not immediately apparent, specifying an eye colour
*and* them being closed means that one will be ignored in favour of the
other. **Make sure you don't specify information about things that are
not in frame.** Images on Danbooru follow the "tag what you see" guideline.

A more positive example is:

`1girl, black hair, blue highlights, blue eyes,`

Putting a color highlight next to the hair color will give you colored
strands and bangs. Adjust the wording until you get the sepcifics you
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
instead: 😐

Having characters look in certain directions also tends to force certain poses. `looking back` has a strong tendency to partially obscure the face with the shoulder, and make the character bend over.

## Strenghtening and Weakning Math

You may have seen curly braces and square brackets be used to make a tag stronger or weaker. Here is a more direct explanation.

Each tag has a base value of 1.

If `]` or `{` is present, multiply the value of all tags following it by 1.05 (a 5% increase).
If `}` or `[` is present, divide the value of all tags following it by 1.05 (a 5% decrease).

This operation is **multiplicative**, and **mathematically imperfect.** In the following examples:

`blue eyes, black hair`

`{[{[blue eyes, black hair]}]}`
Will lead to different results on the same seed and settings.

You do not need to close bracket pairs. Hell, you don't even need to open them!

`{blue eyes, black hair`

and

`]blue eyes, black hair`

Are fundamentally the same.

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

### CLIP Interrogator

[Clip Interrogator](https://colab.research.google.com/github/pharmapsychotic/clip-interrogator/blob/main/clip_interrogator.ipynb#scrollTo=YQk0eemUrSC7)
can be used to read an image you like and extract tags and prose that
will help you refine your prompt.

## Combo Prompting

If you are generating an image of a specific character that has a small
amount of pictures, you can combine a prose prompt and tags appends in
order to obtain something closer to the desired result.

`a picture of {ayanami} from azur lane, white hair, red eyes, ponytail,`
