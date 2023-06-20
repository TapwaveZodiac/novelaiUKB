**This section is based on community findings using Sigurd V3. This is
based on outdated information and mostly kept as a historical snapshot.
Techniques shown here can apply to newer models but may have unexpected
results..**

Thanks go to **Cass** for putting together the initial draft,
**OccultSage** for formatting and enriching this, **Kalmarr** and
**TravelingRobot** for experimentation, and the folks of
#community-research who went through hundred of permutations in the name
of research!

***

## Tags & Metadata

The finetune team has done a lot of work tagging the NovelAI model's
finetune data with metadata such as *Genre*, *Author*, or *Tags*.
Additionally, the trained model itself has emergent properties that
strongly associates certain words and styles, making them useful as
metadata tags.

These tags can have a profound influence on your stories if included in
the **Author's Note section**, or in the **prompt itself**.

The people in #community-research on the Discord server have been
experimenting with various formats. The below list are **attribute-tag
pairings** that can be used to generate prompts.

Please note that **Capitalization: Matters!** As does whether there is a
space *before* the closing ] *or not*. The **ordering of tags** within
an attribute can also make a profound difference!

Try various combinations! Some of us have discovered that **including
prose descriptions associated with the attributes** have worked better.

These tags work best with either *some context* already present in the
prompt, or *with narrative direction*. *Capitalization*, *Bracket use*,
*Spacing*, and *Order* can all make a small or large difference.

### Categories

- `[ Genre: Word ]` (whether or not it is capitalized can have an
influence)

- `[ Tags: word, word, word ]` (flexible, usually lowercase, adding a
space after a word may help)

- `[ Author: Name]` or `[ Author: Name ]` (single author may work
better)

- `[ cast: Name ]` (for a list of characters)

- `[ setting: word ]` (very flexible, try various capitalization and
spacing,)

- `[ Style: word, word ]`

- `[ tone: word, word ]`

- `[ place: word ]` or `[ Location: word ]`

- `[ theme: word ]`

- `[ pairings: Name 1 / Name 2 ]` (flexible, can use Name 1/Name 2 or
switch order)

- `[ Do: action ]`

#### Examples

```
[ Style: poetic, descriptive, sensual, deviant ]

[ Genre: Pulp, pulp ]

[ Author: Sylvia Day ]
```

```
[ Style: Verbose, epic ]

[ Tags: combat, talking animals, animal protagonist ]

[ Do: War between geese and rats breaks out. ]
```

```
[ Style: poetic, descriptive, romantic ]

[ Author: Sylvia Day ]

- A boy named Brian.

- A girl named Ashley.

- A tree in the middle of the land.

- Ashley and Brian are neighbors.

- Brian has a crush on Ashley.

[ Tell me a story about Brian meeting Ashley under the tree and
confessing his love for her. ] 
```

***

### Layering

Layering categories on each line may produce a stronger effect. You can
also use layering to combine two different Genres. You can swap them
too!

`[ Genre: Cyberpunk ]` `[ Genre: Space Western ]`

-   When layering, it seems the AI will prioritize the bottom one (most
    of the time).

***
-   Genres may get stronger if you layer them.

***
-   Using a term on multiple categories may have a stronger effect.

***

## Tag Discovery

The most frequently asked question was, "How do I discover what tags,
genres, and authors there are?" This set us out on another journey of
discovery.

All testing was done with Sigurd v3 on **default settings**, with **Max
Output Length set to 60 tokens**. Sigurd v3 is where a lot of the
finetune team's tagging and cleanup work happened.

### Formatting

The most important thing to do is: **enable bracket generation** -- if
you have this disabled, it will throw out the highest scoring
alternates, and go for the highest score without brackets. You should
also **disable trimming incomplete sentences**.

The metadata that the finetune team tagged is of the following format:

`[ Author: ***; Title: ***; Tags: ***, ***, ***; Genre: ***, *** ]`

If you write your prompt in the above format, you will have very
powerful results. Tags are almost always **lower-case**, and *case
matters*! *The semicolon ; delimiter is important, as is spacing.*

### Tags Associated with an Author

As an example, you want to discover the tags associated with an Author.
You should write:

`[ Author: CJ Cherryh; Tags:`

It will result in something like the following:

```
[ Author: CJ Cherryh; Tags: aliens, gender roles,
military, space opera, time travel ]

The ship was small. It had been built to carry a crew of five and a
cargo hold that could be filled with enough supplies for two months in
the wilderness or three weeks on an expedition. That was how long it
would take ...
```

### Authors Associated with a Tag

If you want to know what authors are associated with a tag:

`[ Tags: space opera, Authors:`

Resulted in the following:

`[ Tags: space opera, Authors: David Brin and Jack McDevitt ]`

### Tag-starting a Prompt

If you start a story prompt with all the metadata attributes, you will
have a very powerful kick-start!

`[ Author: David Brin; Tags: space opera ]`

Generated the following:

`The first time I saw the sky, it was blue. Not a deep azure like that of Earth's oceans or an oceanic midnight blue, but a pale, delicate shade of cobalt. It was so beautiful and pristine that my breath caught in wonder at its color and clarity. The sun above me seemed to be made from light rather than heat. But this wasn't the real world. This was one of those virtual worlds where people could go exploring and see things they'd never seen before. I had been flying through space for hours now, searching for something on a map. My ...`



***

### Give me a Story, any Story

If you put the following: `[ Author: ; Tags: ; Genre: ]` in a prompt all
on its own, it will generate surprisingly coherent stories from any
random genre.

```
[ Author: ; Tags: ; Genre: ]

The sun was setting. The wind had died down, and the only sounds were of
birdsong from the trees around them. They sat on a hill overlooking the
village below; it looked like an idyllic scene to her. It wasn't until
she saw the first person come out of the tavern that she realized just
how wrong things could be. 
```

```
[ Author: ; Tags: ; Genre: ]

"You're going to be late." The words were spoken in a voice that was
both familiar and yet completely different. It had been so long since
I'd heard it, but the tone of the voice itself hadn't changed at all.
The same words were being said by my little sister as they always were
when she scolded me for something.

My name is Haruhi Suzumiya.
```

#### Further Refinement

You can fill the Author, Tags, or Genre: variables individually, and
leave the other ones blank.

**Author:**

```
[ Author: Issac Asimov; Tags: ; Genre: ]

The three men and one woman sat around the table in a small conference
room. The walls were covered with glass, but it was too dark to see
anything through them. The only light came from several small lamps on
the table. One of the women wore white gloves that reached almost to her
elbows. She had long blonde hair pulled back into a ponytail. Her eyes
were blue-gray like sapphires. A large diamond glittered at her
throat.
```

**Tags:**

```
[ Author: ; Tags: space opera; Genre: ]

The Rask were an alien race that had invaded the galaxy from beyond
their own star system. The invasion of Earth by a vast armada of these
strange, insectile creatures was one of the great turning points in
human history and would forever change humanity's relationship with its
neighbors. Nowadays it is commonly believed that the aliens' intentions
were benign, but at the time there was widespread panic on both sides of
the conflict.
```

**Genre:**

```
[ Author: ; Tags: ; Genre: Sci-fi ]

"This is the future, right?" I asked. "The one where everything's
powered by magic? Where we have flying cars and robots that look like
giant insects?" "That's correct," said the robot as it walked past
us. It was a lot smaller than I expected, but still bigger than me or my
sister. Its body was covered in shiny metal plates with two arms
sticking out from its sides.
```

**Author, Tags, and Genre:**

```
[ Author: Issac Asimov; Tags: space opera; Genre: Sci-fi
]

"You're too young to be here." The man's voice was a deep rumble.
"I don't allow children in the library." He stood, his face hidden
behind an opaque visor that left only two slits for eyes and mouth. His
hands were huge---the size of hams---and covered with thick black
gloves. The child shrank back from him, but did not run away. She had
been taught never to show fear or weakness before anyone bigger than
herself.
```

#### Other Attributes

The consensus in #community-research is not as conclusive here, but
evidence suggests that any additional metadata that you want to add
should be in the same [] as the Author, Tags, and Genre attributes.

```
 [ Author: ; Tags: ; Genre: Sci-fi; style: poetic,
descriptive ]

The last of the three moons rose over a vast plain. A thousand miles in
width and stretching to infinity, it was a landscape devoid of life or
even vegetation. Yet there were signs that something had once lived
here---the remains of ancient cities scattered across its surface like
broken toys. The only thing moving on this barren land was the
wind.
```

***

### Seeded Prompt Generation

You can use a random string of numbers and characters to make a
"**seed**". The AI will use that to create a prompt. Setting **Top-K
Sampling** to 1 (and disabling others), you will be able to see the
exact same answer on Sig v3 using the same seed.

```
[ d7893qhf37hg345h7g ]

"I'm sorry, but I can't do that," she said. "You're not a member
of the family."
```

Your seed can also be comprised of words, or even a request, although
**this will severely reduce the scope of randomness.**

`[ artificialmechanicalostriches ]`

`[ Generate fictional planet using seed: h1f45a688j9kk ]`

***

## Tips

-   The big 3 elements are **Genre**, **Tags**, and **Author**. They
    tend to work better when capitalized (e.g. Genre).

***
-   The other categories tend to work better **lowercase**.

***
-   The "Words" have a different effect depending on if they are
    **capitalized** or if there's a **space after them**.

***
-   Most categories can have more than one tag, separated by **commas**
    or **semicolons**.

***
-   Using too many tags on one line may dilute their effect.

***
-   You can use blank tags too! (e.g. [ Genre: ]).



***

## Scaffolding

Scaffolding is the mystical art of organizing things depending on how
relevant they are to what you need *right now.*

Conceptually, it is very simple. Imagine you have a queue. Every entry
takes a ticket and gets in line. The first in line is at the bottom of
the context window, then number 1 on top of it, number 2 on top of that,
so on and so forth.

All of these settings are set through the [Context
Viewer](Context#context-viewer) and
[Lorebook](Lorebook).

This is your **Insertion Order** setting. Story is **0**.

What you want to do, is that anything that is very important should be
as close to 0 as possible.

In order to make sure you still have room for the story, however,
you'll need to make sure you have a certain amount of tokens reserved.
By default, the story has **512** tokens. That is half the window on
Tablet tier. If you are on Scroll or Opus, you can easily raise that to
**1024**.

This is your **Reserved Tokens** setting. You only need to edit these
two settings for an easy scaffold.

In order to set it up, create **Categories** in your lorebook. Each
Category should have its **Subcontext** enabled. The settings you will
edit are the settings of the **Subcontext** only.

Here is an example which *Bunray* uses for *Akyuu's Knowledge for
NovelAI*.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/ca19fb0e-20bd-4e33-9f64-daa6b6eb1bfc)

**Note:** This scaffold has 1612 tokens allocated. If you are on tablet
tier, reduce the categories' reserved tokens to 100 (with 50 for low
priority categories).

This will position everything in a stack, just like in the table. Things
that should be close together are kept together.

The **Prefix** field is set to **[** and the **Suffix** field is set to
**]n**. This will effectively "encase" all categories in a bracket
block, and separate them with a newline.

You can add `***` to the suffix of the **Objects** block to reinforce
the separation between data and story, but this usually isn't
necessary.

OnePunchVAM offered the following sheet. Insertion order and position
columns are flipped, to be consistent with NovelAI's.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/f41b0d19-de6f-46f2-927a-abccc2e4ddde)

This means that your story will be limited to 512 tokens, and the rest
of the context will be filled with as much information as possible.
**All Forced Active entries will be inserted as ideally as possible.**
After that, it will be following the insertion order, going from the
closest to 0, to the furthest from 0.

You can adjust that scaffolding to your liking. If you don't need to
define certain things, simply spend the token budget on others until you
reach 2048-200 total tokens, or 1024-100 total tokens. (The context
window is 1900 tokens on Krake.)

Kalmarr offers several Scaffolding examples and more indepth information
on his [Research
Page.](https://github.com/Kalmarr120/Kalmarr_NAI_Public/wiki/Format--and-Customization-Research#lorebook-settings)
