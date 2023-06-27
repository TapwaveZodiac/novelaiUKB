This page contains **community-researched** content and aims to provide
in-depth tips to improve your experience with the AI.

This is an amalgamation of general use tips for the Clio model. Consider
this a vulgarization of advanced theorycrafting and less a \"best
practice\" guide.

There are no best practices than the ones you are comfortable with.

## Setting Up a Story
Many people tend to remark that a model \"doesn\'t generate like they
want to\" and then present a very short prompt, or a lack of biases, or
a lack of proper codification of the style they desire.

Before you start writing, ask yourself the following: **Do I only want
story text, or do I want to use additional \"data\" elements to support
generation?**

### Separating Data and Story

As a rule of thumb, Data (i.e Text Injections such as the *Lorebook,
Memory and Author\'s Note*) should mix with your story text as little as
possible. Interference between \"Data\" text and \"Story\" text will
lead to degraded story output.

The first element to consider is if you are using the **Lorebook** or
not. This will decide how your **Memory** will look like.

If you *are* using lorebook entries, then the **default insertion
settings** will put **Memory** below all **Lorebook** entries. In that
case, your **Memory** should look like this:

***
```
[ Author: Blah mc Blashson; Title: Heckin\' Creativity;
Tags: sicknasty tutti-frutti prose; Genre: Epic \]

 \*\*\*
```

***
If you are writing something that isn\'t prose, (such as a poem, or a
stat block, etc), you can substitute the **Dinkus (\*\*\*)** with a
**Separator (\-\-\--)**.

If you aren\'t using the lorebook, you can simply put the ATTG block in
memory *without a dinkus*.

### Setting up Biases

Generally, you want to keep your biases minimal, and use them for very
precise changes to things that you cannot control easily. **It is always
better to lead the AI by example in order to preserve its creativity**.
However, biases can be useful for prompting the AI until it \"gets\" the
style you desire.

It\'s easy to overdo biases and damage the model\'s creativity. What you
should focus on are mostly punctuation symbols.

#### \\n

Backdash-n is the \"newline\" token. Lightly downbiasing it is usually
the best way of forcing the model to output longer paragraphs early on.
Afterwards, you can turn it off.

#### \*\*\*, \-\-\--, ⁂, `<endoftext>`

Downbiasing those is generally not needed. If those show up regularly,
there is a problem with your preset, or your prompt is too short.

#### (space)"

Most dialogue begins with a space-quote token. Downbiasing it decreases
the likelihood of dialogue appearing. Upbiasing it will lead to more
rapidfire dialogue.

## Stage Directions

Clio is smart enough to recognize punctual **\"Stage Directions\"** much
more than Sigurd, Euterpe and Krake could in the past. Nonetheless,
those should have a fixed position in the text, and it\'s better you do
not use the Author\'s Note for them.

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
The Story so Far:`</code>`
```
