# Context Window

The Context Window is effectively the AI's memory. As it can only read what is inside the window, understanding how it works will greatly help with leading to "good" generations.

The context window is comprised:
- On older models (Sigurd, Euterpe, Krake, Snek, Genji) of **2048** Tokens, or **1024** if you are subscribed under the Tablet tier.
- On Clio, the context size is **8192** for all tiers.
- On Kayra, of **3072** Tokens for Tablet, **6144** tokens for Scroll and **8192** for Opus.
- On Erato, the window is **8192** tokens for Opus.

*View Last Context* at the top of the **Advanced** tab of the settings panel opens a window which displays all the tokens sent to the AI for the previous generation. This helps you check if anything you feel is important was forgotten. *View Current Context* does the same, but for the text you're about to send.

***

# Elements of Context

## Prompt

The prompt is displayed in **cream** by default. It is the first piece of text fed into the AI. If you have put anything into the **Memory** or **Author's note**, they will be inserted before it in the context before being sent to the AI.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/25a1815f-4053-457c-b6a4-961958f5df19)


## Injected Text

**Injected Text** is any text that is not part of the story, but part of the context. All of these elements are injected text:

- The **Memory.**

- The **Author's Note**, or **A/N** colloquially.

- **Lorebook** entries.

- **Ephemeral Context** entries.

There are two important things to consider about injected text:

- **Position** determines the strength of the injection's influence. Towards the bottom = Stronger. Further at the top = weaker.

- **Style** determines how it influences the generation. Generally, you want to stay close to your Story's style, perhaps with minor concessions such as using the Attributes method for your entry, or writing "caveman style" for stage directions.

Square brackets are recommended mostly for **Author, Title, Tags, Genre** metadata in Memory, and Knowledge or Style tags, either in Memory or Author's note. The brackets must be separated from their contents by a space, and everything should be lowercase outside of category titles and proper nouns.

`[ Author: George R.R. Martin; Title: A Song of Ice and Fire; Tags: dragons, politics, dynasty; Genre: fantasy ]`

***

### Memory

By default, the **Memory** is inserted at the **top** of the context. Its position may be adjusted for a **stronger** (closer to the bottom) or a **weaker** (further to the top) effect.

Traditionally used it to make the AI remember broad context elements and the **Author, Title, Tags, Genre** metadata.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/1a65becd-7605-4a6e-abe8-8b1c05e15fb1)

***

### Author's Note

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/e246544c-bb7b-4b1d-aa9e-30d6e7390ae9)

The **Author's Note** or **A/N** is identical in format and use to Memory, but it is inserted **three paragraphs** (newlines) by default before the last token in the input. It has a greater influence as a result. The A/N's position may be adjusted for a **stronger** (closer to the bottom) or a **weaker** (further to the top) effect. Traditionally, it is used to either **give immediate instructions**, and **immediately important information**, such as the name of the POV character, the date, etc.

Keep in mind that Author's Note influence is **very intense**. It is **strongly recommended** to leave it empty unless you are using it for a specific purpose, after which it should be cleared. Leaving elements in the Author's Note can degrade text quality.

### Lorebook

Further described in the dedicated [Lorebook](Lorebook) page. Lorebook entries are positioned at the top of context, **after** Memory.

***

## Why use Brackets?

Bracketed text is used specifically in the fine-tuning material for **metadata**, which includes **Author, Title, Tags and Genre**.

Brackets used for metadata, look like this:

`[ Author: Neil Gaiman; Title: Sandman; Tags: ; Genre: Modern Fantasy; ]`

As you can see, you can use empty categories, or even omit them outright. Note the spaces next to the brackets! For optimal effect on your story, it is recommended to include the metadata headers in their original order, even if they are empty. You can omit the first ones if they are empty, but it is better if you keep Genre: at the very least.

Each category is separated by a **semicolon** (;) and elements in a category are separated by a **comma** (,).

It is also usable for:

- **Dates and locations**: `[ 1889 , London ]`
- The **name of the POV character** `[ Batman ]`
- To contain text that has a tendency to leak into generations.

Bracketed text is thus best described as being read by the AI as "important information but not part of the text." This helps it keep things into memory without trying to continue from them as if they were sentences in the text.

Punctuation outside of colons is usually only as part of a chapter/work title.

You can encase descriptive passages in Injected Text entries if their style is different from the usual style of your prose.

Brackets **do not notably affect the accuracy of the text** - this is [Generation Settings](Generation-Settings) at work.

It is generally not recommended to use brackets in Euterpe or Krake for anything outside of the aforementioned purposes.

As a note, if you are using Krake, enable the **Preamble** in your AI settings to reinforce the Metadata's effect.

***

## Context Viewer

The Context Viewer is a powerful tool to identify what elements were used by the AI in the last generation. This helps you diagnose Memory, Author's Note and Lorebook usage. Check for bloat, trimmed entries, or ones that take too much space using this tool.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/6facab34-249d-4e37-9dcb-46a00d14741c)

### Identifiers

Lists the **Identifier** of each element of the context that describes it's origin from one of the following:

- **Story**: From the main text.
- **Memory**: From the Memory block.
- **Author's Note**: From the Author's Note block.
- **Display Name of a Lorebook Entry**: The name that you gave that entry in the Lorebook, not its keys.

### Inclusion

Lists if this element is included in the context:

- **Included**: Successfully inserted in the context.
- **Partially Included**: Inserted in the context but some trimming was performed.
- **Not Included**: Insertion in the context failed or was not attempted.

### Reason

Lists the reason for this element's inclusion or omission:

***Included***

- **Default**: Reserved to Story, Memory and Author's Note. Included by default.
- **Key Activated**: This Lorebook entry was triggered by one of its keys.
- **Forced**: This Lorebook entry was activated because it was set to Forced.

***Omitted***

- **Disabled**: This Lorebook entry was omitted because it was disabled.
- **No key**: This Lorebook entry was ommitted because it could not find any of its keys in the text.
- **No space**: This entry was ommitted because it could not be given enough tokens to fit.
- **No text**: This entry was deactivated because it contains no text.

### Key

Lists the key that triggered this Lorebook entry.

### Reserved

Lists the amount of tokens reserved for this entry. This is usually lower than the **Reserved Tokens** setting of that entry, as that setting is the upper limit.

### Tokens

Lists how many tokens are used by this entry **on its own, before it is inserted in the story**. Tokenization can cause a couple extra (or sometimes *less*) tokens to be used when this entry is placed in the text.

### Trim Type

Lists how this entry was trimmed. There are four trim steps, which occur in this sequence:

- Fit the entire entry without trimming. (**No Trim**) If it doesn't fit, go to the next step:
- The entry was trimmed to a new line character inside its text. (**New Line**) If this results in the entry having less than 30% of its allowed token content inserted, go to the next step:
- The entry was trimmed to a sentence delimited (period, ellipse, semicolon) (**Sentence**) If this causes the entry to have less than 30% of its allowed token content inserted, go to the next step:
- The entry is trimmed by the individual token, and then all the content that can fit in the space that remains is inserted. (**Token**) If this **STILL** fails, this is likely because the Prefix and Suffix can't fit in the context, so the entire entry is omitted.

### Advanced Context Settings

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/bb95d656-5b18-4294-8ae6-a893d0860b19)

Remember all the advanced settings of the [Lorebook](Lorebook)? Those are used here, but for the **Story**, **Memory** and **Author's Note**.

These can be accessed in the **Advanced Options** collapse in the **Options** tab on the right.

This allows you to:

- Fine-tune the maximum size of these blocks.
- Make Memory or the Author's Note get trimmed before the Story by setting them to a lower priority.
- Change the way these three blocks are trimmed.
- Force suffixes and prefixes that you won't need to write in the blocks directly.

***

## Ephemeral Context

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/fc05235e-dec1-4436-92c1-8ff8f0a12f59)

**Ephemeral Context** entries are effectively *time-sensitive Text injections.* Think Mission Impossible:

`This message will self-destruct in 30 seconds...`

Every time you **generate text**, you perform a *step*. Ephemeral Context entries wait a certain number of steps, appear, remain for a certain number of steps, and disappear.

The syntax example is as follows:
`{0+30r~15,+5:[Angela's amnesia temporarily dissipates.]}`

Several symbols are used to define the type of information specified:

- {} Contains the block.
- The first number specifies the exact starting step, if necessary. You can also specify negative steps using **-**
- **+** specifies the delay in **steps** before activation. +0 will trigger immediately. Adding **r** to it will make it repeat after the number of steps set passes, **even if the entry is still active**. As a result, make sure the delay is longer than the duration if you don't want the entry to be always on, if it repeats.
- **~** specifies the **duration** of the entry, in **steps**, before it disables.
- **,** followed by **+** or **-** specifies the **insertion position** of the entry, **in new lines**. + starts from the top the context, - starts from the bottom of the context.
- **:** specifies the beginning of the text content of the entry.

Thus: `{0+30r~15,+5:[Angela's amnesia temporarily dissipates.]}` will add `"\[Angela's amnesia temporarily dissipates.\]"` to the context, five new lines from the top of the context, for fifteen steps, starting thirty steps after you set up this entry. Effectively, it'll be on half the time.

You may also add a **!** after the first curly brace to be able to specify **a temporarily inactive entry**. This makes it *always* present **except during the Ephemeral Context's entry duration.**

`{!0+30r~15,+5:[Angela's amnesia makes her forget why she is here and what she is doing..]}`

This one will be *off* half the time, when the other entry is active.

You can also type out Ephemeral Context entries directly in the Input box.
