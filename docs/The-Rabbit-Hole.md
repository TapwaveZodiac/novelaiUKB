This page contains **community-researched** content and aims to provide
in-depth tips to improve your experience with the AI.

This is an amalgamation of general use tips for the Clio model. Consider
this a vulgarization of advanced theorycrafting and less a "best
practice" guide.

There are no best practices than the ones you are comfortable with.

## Setting Up a Story
Many people tend to remark that a model "doesn't generate like they
want to" and then present a very short prompt, or a lack of biases, or
a lack of proper codification of the style they desire.

Before you start writing, ask yourself the following: **Do I only want
story text, or do I want to use additional "data" elements to support
generation?**

### Separating Data and Story

As a rule of thumb, Data (i.e Text Injections such as the *Lorebook,
Memory and Author's Note*) should mix with your story text as little as
possible. Interference between "Data" text and "Story" text will
lead to degraded story output.

The first element to consider is if you are using the **Lorebook** or
not. This will decide how your **Memory** will look like.

If you *are* using lorebook entries, then the **default insertion
settings** will put **Memory** *above* all **Lorebook** entries. In that
case, your **Memory** should look like this:

***
```
[ Author: Blah mc Blashson; Title: Heckin' Creativity;
Tags: sicknasty tutti-frutti prose; Genre: Epic ]
 ***
```

***
If you are writing something that isn't prose, (such as a poem, or a
stat block, etc), you can substitute the **Dinkus (***)** with a
**Separator (----)**.

If you aren't using the lorebook, you can simply put the ATTG block in
memory *without a dinkus*.

Alternatively, by setting all your lorebook entries' insertion position to 0, and order under 400, you'll make them appear before Memory, allowing you to use Memory as the "footer" of the Data block. This is a practice I recommend but not one that is necessary per se.

### Setting up Biases

Generally, you want to keep your biases minimal, and use them for very
precise changes to things that you cannot control easily. **It is always
better to lead the AI by example in order to preserve its creativity**.
However, biases can be useful for prompting the AI until it "gets" the
style you desire.

It's easy to overdo biases and damage the model's creativity. What you
should focus on are mostly punctuation symbols.

#### \n

Backdash-n is the "newline" token. Lightly downbiasing it is usually
the best way of forcing the model to output longer paragraphs early on.
Afterwards, you can turn it off.

#### ***, ----, ⁂, `<endoftext>`

Downbiasing those is generally not needed. If those show up regularly,
there is a problem with your preset, or your prompt is too short.

#### (space)"

Most dialogue begins with a space-quote token. Downbiasing it decreases
the likelihood of dialogue appearing. Upbiasing it will lead to more
rapidfire dialogue.

## Stage Directions

Clio is smart enough to recognize punctual **"Stage Directions"** much
more than Sigurd, Euterpe and Krake could in the past. Nonetheless,
those should have a fixed position in the text, and it's better you do
not use the Author's Note for them.

You can put those in your memory when starting as well. Keep in mind
that if the Direction in your **Memory** and one in your **Story Text**
are conflicting, this can cause issues. Make sure you remove Directions
that are not relevant anymore.

### Style and Writing Type Directions

Shifting the style or type of document that will be generated can be
achieved using the following:

***
`[ style: poem ]`

***
Add a linebreak afterwards, and the writing should shift to the one
specified. Keep in mind that this is an *emergent feature*: Not all
styles might work, and some that were not trained for can work for some
reason. Here are some that were suggested:

***
```
text adventure, chat, lyrics, prose, blog post, actual
play, review, email, creepypasta

first person, second person, third person

simple, archaic, SFW
```

***
### Setting Directions

Changing the current location, time, or POV can be done using a stage
direction. Here are some examples:

**Time**

***
`[ 1990 ], [ 7am ], [ 3 hours later ]`

***
**Place**

***
`[ London ], [ Deep underground ], [ Meanwhile, in Buckingham Palace ]`

***
**POV**

***
`[ Tom ], [ Jack's POV ], [ Jenny's Thoughts ]`

***
### Chapter Headings

Chapter headings can be used as stage instructions to steer generation
according to the underlying concepts of the title.

***
`[ The Ambush ]`

***
## Getting Feedback from the Model

You can request different manners of feedback from the AI by inputting a
**Dinkus** and specific headers.

For example, you can request a summary of what happened by doing the
following:

***
```
Summary:
```

***
You can also prompt this with:

```
The Story so Far:
```

You can also request musings from the model about what the text is about, or even para-textual notes, by inputting the following at the end of your story text:
```
Notes:
-
```

# Creating Presets

Creating a preset requires use of the Token Probability viewer (the 🧠 button), as this will let you see the effects of your settings).

## The pillars of Preset Design

Presets are founded on three core principles: 
- **Openness**, or "how many tokens are considered at a time",
- **Confidence**, or "how top-heavy or normalized the probabilities are",
- **Constriction**, or "how much you negatively influence probabilities through penalties and such".

After that, you have four **qualities** that you seek to achieve through this preset:
- **Complexity / Color**, or "how varied and interesting the vocabulary and grammatical structures used are",
- **Consistency**, or "does it actually respect what you write, how well, and is it written in a way that makes any sense",
- **Creativity**, or "does it write anything original and pleasant to read".

You *absolutely cannot have all at once*. Your preset will seek to achieve a balance of those qualities in a way that is pleasing to you and the preset's users, but you will have to focus on something and make compromises.

Fundamentally, all principles are contradictory to at least one quality. It's up to you to figure out how to arrange them in a way that leads to a good result.

- **Openness** leads to **Complexity and Creativity** but takes away from **Consistency**.
- **Confidence** leads to **Consistency**, but takes away from **Creativity** (and sometimes **Complexity** as well.)
- **Constriction** can take OR add to *any* of the qualities depending on how strong it is.

- **Mirostat** and **CFG** have an extremely strong and distinctive effect. It is recommended to experiment with other sampling types first before using them. If you wish to use either, make sure that any other sampling is minimal (TFS and Typical is recommended).

To arrange a preset, there are three phases. **Sampling**, **Temperature** and **Penalties**. CFG is not considered because CFG is overly powerful and kind of does its own job so strongly that it heavily reduces what a preset does, but the philosophy is the same.

**Samplers** can be easily understood as the following:
- TOPK: Checks every token in order of probability. Once Token N°TOPK is reached, everything after is removed. Probabilities are then recaculated to 100% across the new, smaller pool.
- NUCL: Same as TOPK but it only checks for probabilities. Starts at the most likely, then adds ups probabilities until NUCL% is reached. Probabilities are then recaculated to 100% across the new, smaller pool.
- TOPA: Like TOPK but it is more flexible. If The Top token is less confident, then the pool is bigger. If it is very confident, then the pool is smaller. Basically, TOPA reinforces confidence if it already exists.
- TFS: Cuts off the weakest tokens. The higher it is set to, the less it cuts off.
- TYP: Reduces overconfidence. Checks for deviation from the norm and increases unlikely tokens. The higher it is set to, the wider the pool will be.

The more samplers you stack, the less tokens you'll have.

**Randomness** takes the pool and then **decreases confidence** if high, and **increases confidence** if low. You can use this to select a small pool but make it less confident, and thus "feel" more colorful by putting randomness AFTER sampling.

**Penalties** are what the Repetition Penalties do. Strong penalties actually **force** creativity but it creates inconsistency in structure, style, and content. Weak penalties can cause the writing to be samey because repetition reinforces repetition.
