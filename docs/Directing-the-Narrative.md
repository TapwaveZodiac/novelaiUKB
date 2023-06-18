*By placebomancer*

This guide will teach you how to direct the AI to describe characters,
items, locations, and even actions and events. Additionally, you will
learn how to direct the AI to *stylize* the descriptions it generates.

## Directing the AI

### Describing People/Places/Things

Describing people, places, and things is relatively easy. To describe a
farm, you might write a direction like:

    Description of the farm:

Note that you can add a newline to the example above so that the
description is written on the line *beneath* the direction. I'll be
doing that for the remaining examples.

It sometimes helps to begin the description yourself with the subject:

    Description of the farm:
    The farm

The AI completes the description with:

    Description of the farm:
    The farm was a large one, covering almost half a hectare of land. A large house of a rustic, primitive design sat in the middle of it, surrounded by fields and gardens.

Now delete the direction line, leaving only the generated description:

    The farm was a large one, covering almost half a hectare of land. A large house of a rustic, primitive design sat in the middle of it, surrounded by fields and gardens.

If you leave the direction in the story, the AI *will* start generating
directions---and you don't want that, do you?

### Describing Actions

Actions are a bit trickier. Sometimes, the AI will mistakenly treat the
direction as an event that already happened. The best results are
obtained from writing the direction in the present tense, like so:

    Description of John chopping down the tree:

Sometimes, a `Description of how … :` direction works better:

    Description of how John chops down the tree:

One method will often perform better than the other, but either approach
may require retries. Again, it can help to start the description for the
AI if i's having difficulties:

    Description of how John chops down the tree:
    John

Allowing the AI to complete the text produced:

    Description of how John chops down the tree:
    John swung his axe and brought it down in the center of the trunk. The tree shuddered from the force of the blow. The blade went all the way through the trunk.

Remember to delete the direction!

## Writing with Style

### Author Directions

One way to impart style to a direction is to use an author the AI is
familiar with:

    Description of the sky in the style of H.P. Lovecraft:

The author doesn't actually have to be in the fine-tune, as long as the
AI is familiar with their style.

It may be helpful to add a comma for clarity to more complex directions:

    Description of Harold walking through the field, in the style of Jane Austen:

Sometimes *style* can be confusing to the AI:

    Description of how Marie drinks the gin in the style of F. Scott Fitzgerald:

It may help to use a comma and specify that we are interested in
Fitzgerald's *writing style* rather than his manner of drinking:

    Description of how Marie drinks the gin, in the writing style of F. Scott Fitzgerald:

This direction produced the text:

    Marie, a dark-haired, slender woman with big, brown eyes and an impish, naughty smile, sipped her gin slowly, languorously, while she flirted with her audience.

### Style Directions {#style_directions}

What if we don't want to use a specific author, but we know the sort of
writing style we want to generate? We can use style directions:

    Description of Anna in a style that is terse:

All the same tips apply from *Author Directions*. Use commas and clarify
*style* when it might confuse the AI. For instance:

    Description of Anna in a style that is elegant:

Is the description elegant or is Anna dressed in an elegant fashion?
It's best to clarify:

    Description of Anna, in a writing style that is elegant:

This direction produced the text:

    The eyes of my Anna were two of the most beautiful things I've ever seen. They were a deep, vibrant, blue that made the rest of the world pale in comparison.

#### Very Style, Much Wow

We can also use words like *very* or *extremely* before the style to
great effect:

    Description of the moon in a style that is very gothic:

The results can be surprising and sometimes rather comical, so I'd
recommend experimenting before throwing *very* on every style.

## Put the Style Last

The above examples might seem rather wordy. There is a reason:

**The last word in the direction has the strongest influence on the
description**.

For example:

    Description of the sun in a terse style:
    The sun is a sphere of hot iron, glowing and shining in the sky.

This direction is less effective at imparting terseness because the
influence of *style* overpowers it. Compare:

    Description of the sun in a style that is terse:
    The sun is a sphere with a diameter of 864,000 miles.

I tested a large number of direction variations and the one factor that
granted the style the strongest influence on the generated description
was *putting the style last*.

## Advanced Concepts

### Everything is Effective

*Every word/token in the direction has some effect on the generated
description*. The effect may not always be especially apparent, but
it's there. As already mentioned, words near the end of the direction
usually have more effect on the description. The examples provided so
far attempt to maximize the impact of a single chosen style on the
generation while ensuring the AI is reasonably confident in what we're
asking for. But everything involves trade-offs, and there are other
variations that may produce output you prefer, even if the chosen style
isn't imparting its maximum effect on the description.

#### Punctuation

As already mentioned, commas in your direction can help clarify your
intent to the AI---but they also increase the probability of commas
showing up in your description. Yes, *even the punctuation in a
direction stylistically affects the description*. The same is true of em
dashes (---), which also work if you're as fond of them as I am.

#### The Elements of Style

Every word added to a description provides an additional effect, whether
desired or not. As mentioned earlier, it is sometimes helpful to specify
*writing style* for clarity. However, this has an effect that competes
somewhat with the chosen style. You might not mind this effect. Adding
words like *author* or *writer* can provide a more literary description:

    Describe the mountain in the style of an author whose writing is flowery:

Feel free to mix it up and add additional words to the direction, noting
that each word competes with or reinforces the others.

#### Describe vs Description Of

`Describe … :` works as well as `Description of … :` directions for
people, places, and things. The only reason it isn't mentioned earlier
in this guide is because it's not nearly as effective for actions. Of
course, like anything, choosing one over the other imparts some
stylistic effects. For example, `Describe … :` makes the description of
a character more likely to begin with a pronoun than a name. Broadly
speaking, descriptions generated with `Describe … :` are a bit more
terse and those generated with `Description of … :` are a bit more
wordy.

### Quotes for Adherence

Directions with a starting double quote adhere more closely to the given
instructions than those without an opening quote:

    Description of the sun in the style of H. P. Lovecraft: "

However, quotes have some drawbacks:

-   Quotes work particularly well with Krake and Sigurd, but Euterpe
    tends towards shorter output with an opening quote
-   The AI may assume the quote represents the start of dialog, rather
    than the start of a description
-   If an author is specified, the generated description is more likely
    to be in the author's preferred tense and POV
-   Any dialog generated inside the quotes is likely to use single
    quotes, which you may have to change to double quotes (unless
    you're from the UK)
-   You have to remove the opening and closing quotes after generation

Despite these problems, the effect really is noticeably stronger with
Krake and Sigurd and the improved quality is often worth the effort of
rewriting the description into your preferred tense.

Here are some tips to avoid the AI interpreting the opening quote as
dialog:

-   Always prefer `Description of … :` over `Describe … :`
-   Use words like *author*, *writing*, and *style* in the direction to
    give the AI hints about what we expect:
    `Description of the watch, in the style of an author whose writing is evocative: "`
    (it needn't be this elaborate)

While I haven't tested it thoroughly, you may try substituting a
starting single quote for a double quote as well. When dialog is
generated inside a single quote, the AI will usually generate it with
double quotes. However, this *Britishism* likely has some stylistic
effect on the generated descriptions.

### Discovering New Styles

So you can impart stylistic effects on the descriptions the AI
generates, but what if you're not sure what styles to try? Here are
some ways to mine the AI for ideas. Not all of the styles you discover
will work well, of course, but you can't try out new things until you
have a list of things to try!

Additionally, this process must be done separately for each model: just
because Krake understands a word one way doesn't mean Euterpe has an
identical understanding of the word.

All of these methods involve looking at token probabilities. If you want
to see more than just the top 10 tokens, ban the ones that have already
been generated and retry to get 10 more.

**Synonyms:**

`A synonym of "descriptive" is "` or
`A synonym for a writing style that is terse is "`

**Antonyms:**

`The opposite of loquacious is`

**Definitions:**

`A style of writing that engages all the senses, including sight, sound, emotion, touch, smell, and taste is called "`

**Authors:**

`Ernest Hemingway has a writing style that is often described as`

**Finding authors:**

`One author whose writing style is often described as lucid is` (note
that this one is very biased towards popular authors, to the point that
the top tokens may not be accurate at all---once you have a list of
authors, test them against the Authors prompt above this one)

**Lists:**

`Synonyms for "evocative" include` (each generated item biases the list,
which is fine if you're looking for a generally broad set of related
concepts)

These are not exhaustive, by any means; many, many variations are
possible. Be aware that not every style you discover will work well;
they always need to be tested against prompts like
`Description of the farm in a writing style that is synesthetic: "`. And
one style might seem to work terribly when it actually works great and
you just had five unlucky generations in a row---*and vice versa*. But
you will undoubtedly discover some really interesting effects doing
this, and broaden your vocabulary while you're at it!

#### Prose for Pros

*Can't you just find styles using [INSERT FORMAT HERE]?*

Well ... *kinda*? Feel free to experiment, but the ones I've tested
don't compare well with simple prose for this task. Try it out for
yourself:

    [ Author: Ernest Hemingway; Style:

or

    Author: Ernest Hemingway
    Writing Style:

Try whatever variations you like: *Style* vs *Writing Style*, lowercase
attributes, &c. Then compare the likely tokens to
`Ernest Hemingway has a writing style that is often described as`. Prose
provides results closer to the sort of styles we're looking for and the
styles generated by prose seem more applicable to Ernest Hemingway.
