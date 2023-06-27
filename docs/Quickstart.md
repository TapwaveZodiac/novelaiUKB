***

# Quickstart
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/c2a943aa-18e2-4d10-899c-ea277b25470a)

This article serves as a tutorial to cover everything you should know,
and is aimed at newcomers to the service.

- **Overview**
  - **Main Concepts in *NovelAI***
  - [AI Writing Essentials](Quickstart#ai-writing-essentials)
  - [Data and Privacy](Quickstart#data-and-privacy)
  - [Customization](Quickstart#customization)

***

## Main Concepts in *NovelAI*

This section will explain the basics of *NovelAI*, from the interface to the basic workings.

***

### Input Field

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/4646584b-46bd-43d6-bfe6-fde7a24f8e11)

Type text in the **input box**, then press *Enter* or click ➡ Send to add this text to the story, and ask the AI to generate more.

This section of the interface is used to control the edit history of the Story, as well as being a place to type inputs for the AI.

The **edit history** can be thought of as a timeline - every change you make is a step forward in the timeline. **Undoing** will take a step backward, **Redoing** will take a step forward, and **Retry** will request a new generation attempt for the current step. The **Retry Tree** is basically a way to check all the steps taken forwards for the current point in the timeline. You can **undo** to go back, and then **redo** back to the point where you made your retries.

You can also directly edit the story text.

***

### Story Library
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/84246dfd-a3fc-438d-988c-0fcf9cc0ea53)

Also known as the 'left panel', this part of the interface controls everything outside of your Story. This includes the Settings menu, as well as the list of your Stories.

The **menu icon** (Ξ) contains the **Settings menu**, and is also where you can **log out**. Below them is the **Search Field** (🔍), which allows you to search through your Story collection by typing next to the magnifying glass. You can switch to a Story by simply clicking on it in the Story Library.

Every **Story** displays its **Title**, **Description**, the **date it was last edited**, and whether or not it's marked as a **Favorite**(❤️). The **Title** and **Description** can be modified by switching to the **Story**, then adjusting them in the **Story Options** (📝).

A new **Story** can be started by selecting the **New Story button** (+), found at the bottom of the **Story Library**.

------------------------------------------------------------------------

### Settings Tab

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/14ca54f1-e13b-4883-b499-ee9c517084cf)

This section of the interface, also known as the 'right panel', controls settings specific to your currently active **Story**. There are three tabs here - **Story**, **Advanced**, and **Generation**(🎚️).

The **Story** Tab lets you set the **Model**, **Module**, the **Generation Preset**, and fill in the **Memory**, **Author's note** and other similar things, as well as offer you export options.

The **Advanced** tab gives you powerful tools to adjust the generations to your liking, such as **Biases**, **Bans**, **Stop Sequences**, and the **Context Viewer**.

------------------------------------------------------------------------

### Color Code

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/9dcb0bc1-ee21-48e1-af5c-22a5265cf2a3)

*NovelAI* uses four colors to determine the source of a block of text.

Keep in mind these colors are used on the default theme, and might change if you edit the theme.

- **Gray** represents the *initial Prompt.* (First thing you wrote
  before the first AI response.)
- **White** represents the *text generated by the AI.*
- **Green** represents the *text generated by the AI* that was *modified.*
- **Blue** represents *user input*. It will only appear if you write something at the end of the context.

***

### Tokens

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/ae531c09-73c3-47d7-94b7-2281e9900930)

Tokens are how the AI sees pieces of text. Think of it as the AI equivalent of a [morpheme](https://en.wikipedia.org/wiki/Morpheme), the smallest unit of text that carries meaning.

The AI reads your input text and cuts it up into tokens. It then analyses the relationships between tokens to determine if it should choose one over the other.

#### Tokenizing

Tokenizing is the act of taking text and cutting it up into tokens. Tokens can be single letters, groups of letters, words, but also punctuation and other symbols.

Generally, short, common words tokenize neatly while rare, longer words tend to be cut up into multiple pieces. Punctuation, linebreaks, and symbols, usually are one token per instance, and all of these also carry meaning!

The amount of tokens available to you is limited, so it's important to learn how to write effectively to help the AI keep more in its Memory.

#### Tokenizer

NovelAI includes a built-in [Tokenizer tool](Tools#tokenizer) that allows you to see not only the breakdown of tokens used in an input, but also the token IDs, token count, and character count.

This tool is accessed through the main menu, or by clicking on the token count of Memory, Author's Note or Lorebook entries.

#### Efficiently using the Tokenizer

In order to use the tokenizer efficiently for things you want to keep short (such as the Context Memory, or the Author's Note), make sure to write in short sentences using simple words, finished with full stops.

Different symbols and linebreaks have different uses. For example:

1. Commas (,) generally mean the current [clause](https://en.wikipedia.org/wiki/Clause) will change.

2. Full Stops/Periods (.) generally mean the sentence has concluded, leading to a new one starting, or the speaker changing.

3. Ellipses (...) generally mean the sentence is trailing off, and another one should begin (usually from someone else)

4. Semicolons (;) signal a strong break in the sentence, and is usually for lists of long elements.

Because NovelAI works by identifying links between tokens, including a token will cause it to have a higher chance of appearing. This means that writing John cannot see., a negative, will cause the AI to still consider see as a possibility.

This is similar to [ironic process theory](https://en.wikipedia.org/wiki/Ironic_process_theory). Instead, you should phrase positively - John is blind. - where possible.

***

## Context

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/87b53d64-d2a6-497c-a3c4-a0847654ba47)


The **Context** represents all the tokens the AI has in its Memory to prepare the next generation.

Depending on your account, the maximum amount of tokens that can fit in that **Context** varies. You can view both the Current Context and the Last Context in the Context section of the Options panel.

The **Context** helps the AI understand the current writing style, the characters involved, the situation, and many other things.

### Elements

The Context is built from four blocks.

- The **[Memory](Detailed-Concepts#memory)**.
- The **[LoreBook](Detailed-Concepts#lorebook) entries** that
  have been triggered.
- The remaining text that can fit.
- The **[Author's Note](Detailed-Concepts#authors-note)**,
  inserted three new-lines before the end of the text.

#### Author's Note

The **Author's Note**, or "**A/N**" is a comment which serves to describe how the AI should write in terms of style. By default, the **A/N** is inserted *three newlines from the bottom*, though its position may be adjusted for a stronger (closer to the bottom) or a weaker (further to the top) effect.

It's best to be concise when writing your **A/N**. Make sure to make good use of adjectives to explain how the style should be.

You can also use the **Author's Note** to give the AI orders to perform quick changes, though it's usually easier to insert them directly into the text at the correct spot.

**A/N** can also be used to signal that something needs to happen shortly.

Here is an example: 

```
[ Style: purple prose, poetry ]
[ Jack gets stabbed ]```

#### Memory

The **Memory** is inserted at the top of the **Context** by default, though its position may be adjusted for a stronger (closer to the bottom) or a weaker (further to the top) effect. It is mostly used to give broad Context information.

Use it to keep important things in the AI's mind regardless of the current situation. It is also useful for starting a story without prior inputs.

It is best to use short, curt sentences focusing on the most important details, and to update it regularly.

Here is an example:
```
Ja'arkael is a male night elf, his rival is Yaenaen.
Yaenaen is a female human.
Ja'arkael and Yaenaen want an artifact from the dungeon.
```

#### Lorebook

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/0a3de88e-1487-462d-9640-9be102de2679)

The **Lorebook** is a powerful tool that allows you to define entries for practically anything, letting the AI look up what is mentioned in the text and use your written definitions to keep information in mind.

You can access it by clicking the **Lorebook icon** (📘) on the left of the input bar, or by clicking **View All** above the Lorebook search field.

The **Lorebook** is an advanced feature and has a more detailed guide [Here](Lorebook)!

#### Leaking

"Leaking" is a minor anomaly where contents of the **Memory**, **Author's Note** or **Lorebook**, which are likely to be written differently than the rest of the text, shows up in the AI's generated text.

```
The mighty warlord turned to face his foe.

Style: Epic, Grandiose, Wuxia;
```

With the size of *NovelAI*'s Context window, and the finetune of its models, this only rarely happens. If it is a recurring issue, you can close the Memory and Author's Note with with a **dinkus**: `***`, and use **brackets** in your **Author's Note**.

#### Limits of Context

NovelAI's Context window is limited by it's AI model's.

Depending on your subscription level, your token ceiling might be lower (1024 for older models, and 3072 for Clio), which goes up all the way to 2048 (old) / 8192 (Clio) tokens. This means around *38000* English characters for Clio on Opus, and ~*9000* on Tablet!

If the token ceiling is reached, less of the main text will be used as part of the **Context**, to ensure there is room for the **Memory**, the **Author's Note**, and any **Lorebook** entries necessary.

It is also important to note that the AI is similar to a text prediction AI. Such a model has no true formal understanding of grammar or syntax. Instead, it operates on inter-twinning probabilities to replicate human language and its structure.

As a result, it does not completely understand what you write. It operates deductively based on the words you have written.

***

### Input and Output

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/a5e5507e-9add-4ce9-9d85-822cc03dc397)

The input is all the tokens you send to the AI. The Output is the tokens the AI sends back to you, also known as a Generation. This section explains what the buttons of the interface do.

- Send ➡

This sends the **Current Context** to the AI, and asks it to respond.

You can find what the **Current Context** is by opening the **Advanced Tab** on the right panel, and clicking **Current Context** at the bottom.

You can also check what Context was sent for your previous output with **Last Context**.

- Retry 🔁

Deletes the latest output and creates a new one.

Every time you click **Retry**, the counter next to the Redo button increments by 1. By clicking that counter, you can access all the previous tries the AI offered. This is known as the Retry Tree.

If you edit the text in any way, this counter will reset. Retry will grey out, since you have started a new step.

- Undo and Redo ↩ ↪

↩ **Undo** moves one step back in the edit history.

↪ **Redo** moves one step forward in the edit history.

If you edit the text, you cannot **Redo**. (Think of it like time travel paradoxes!)

If you modify the text after doing retries, you can **Undo** until you go back to the moment you made these retries to access the **Retry** Tree again.

- Pressing Enter

If you press Enter in the **Input box**, it will send the input. If you want to create a linebreak, hold SHIFT then press Enter.

If you enter text in the **Story box** and want to ask the AI to generate, you can hold CTRL / CMD⌘ then press Enter. Pressing Enter in the main text box creates a linebreak.

When your cursor is in the main text box, pressing CTRL / CMD⌘ + SHIFT + ENTER will ignore all text after the cursor, and replace all highlighted text with a new generation. The text generated will be inserted at the cursor position, rather than at the end.

Consult the [Shortcuts and Hotkeys](Shortcuts-and-Hotkeys) page for more detail.

***

## AI Writing Essentials

This section will explain what you need to know about typing with the
AI, which is different to typing on your own.

### Prompting

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/25a1815f-4053-457c-b6a4-961958f5df19)

You begin your story by Prompting the AI. The Prompt is easily the most important thing you will write, because this the only thing the AI will be able to work with, even with all the information in Author's Note and Memory.

A Prompt may be as long as you wish. It can be a single word, or several paragraphs long. 

#### Priming (X-Shotting)

The AI will read your Prompt and try to discern several types of information.

    Writing format. (Prose? Verse?)

    Writing style. (How are your sentences built?)

    Writing Perspective. (Who is speaking? Using what person?)

    Lexical fields. (What vocabulary is used?)

    Tonal elements. (What helps convey emotion and tone?)

    Situational components. (Environment, characters, etc)

As a result, the way you write the Prompt will directly affect how the AI will respond. It will attempt to replicate your style to the best of its ability.

The more data you give to the AI, the better it can do this. This is known as **Priming** or increasing the number of **Shots**. A **Shot** in AI terminology is basically an example. The more examples it has, the better.

Having many **Shots** might be detrimental to creativity if you're not sure of where to go. Sometimes it's good to give it as little as possible and let it improvise! 

#### Dangling Prompts

The AI will go off of the last Token you provided. If it is the end of a sentence, it will start a new one.

However, if you end a Prompt like this:

    He pulls the curtain aside and is blinded by a bright light. After he gets used to the brightness, he

The AI will try to complete your sentence. You can do this at any point in your story, not just at the end of the Prompt. This is very useful for guiding the AI into doing specific actions.

#### Perspective

If you used similar services to *NovelAI*, you're likely used to using **Second Person Perspective**. This is when the main character is referred to as **You** and everyone else in third person (He/She/It).

*NovelAI*'s models are trained mostly on literature written in **First Person** and **Third Person**. Second person can work, but is likely to perform less reliably.

##### First Person

First person acts as if the main character is you. You are speaking,thinking, and acting, as if talking to yourself. As a result, your pronoun will be **I**.

Everyone else will be referred to using their name or third person pronouns: He, She, It or They.

##### Second Person

Second person acts as if someone that has no presence in the story is describing the story as happening to *you* directly.

As a result, the main character is referred to as **You** like in a text adventure game. (Think of 'Zork'.) Everyone *else* is referred to by their name or a third person pronoun: He, She, It or They.

##### Third Person

Third person acts as if someone that has no presence in the story is describing the story **without** speaking to *you* directly.

As a result, everyone is referred to by their name or a third person pronoun: He, She, It or They.

#### Prose, Verse and Writing structure

**Prose** is text that is written without a particular structure.
**Verse** is based on a structure of *length*, *rhythm* or *rhyme*.
(There are exceptions, but this is the gist of it.)

*NovelAI* can recognize the difference between common structures. If you start writing a poem using stanzas, it will attempt to replicate it. This works for a myriad of things: Haikus, Sonnets, and even theatrical plays!

Keep in mind the AI has no concept of phonetics and thus doesn't know how to rhyme or how to use an accent meter (like Shakespeare). You'll need to curate output heavily.

Non-prose formats might need a lot of shots to perform well.

***

### Formats

A **format** is the term used in AI writing to refer to a specific way of writing and organize information to maximize its impact on the AI.
This is almost exclusively for the **Author's Note** and **Lore Book**.

Think of it as 'speaking to the AI' in a way that the AI can understand better.

The purpose of using Formats in **Author's Note** and **Lore Book** is to help them influence the AI's output more strongly, reducing how many retries you may need to have the AI give you an output you find appropriate.

It's important to note that with NAI's large context window, **using formats is not necessary most of the time** You can write your Author's Note and Lore Book entries in natural prose. Just be aware ofthe following points:

- The use and combination of adjectives with specific words (style,
  prose, theme, situation) is important.

- Consistency in how you organize information is important.

- Focus strongly on the specific things that you want. Vocabulary is
  important.

- Commas, semicolons, periods and square brackets especially have a
  strong effect. Punctuation is important.

Keep in mind that **formats are not magic**. NAI does not specifically support nor recommend any format. Feel free to [explore what has been researched](https://github.com/valahraban/AID-World-Info-research-sheet/blob/main/AID%20WI%20Research%20Sheet.md#preface) and use what you feel is best for you.

***

## Data and Privacy

This section will explain the basics of what you should know about the security of your information with *NovelAI*.

### Storage

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/303ce935-977e-4547-96fd-28bf34dd2c0f)


Stories used with *NovelAI* can be stored either locally or remotely, depending on the user choice. **By default, all your Stories are stored locally**.

#### Local Storage

By default, *NovelAI* stores your stories locally, in your browser's local database. If you have heard of **cookies**, this is similar, but not quite the same thing.

This implies the following:

- Your stories are only stored on the current device. If you switch to your phone, or another computer, you won't have access to them.
- If you deny all third party data (by using private/incognito mode), *NovelAI* will not be able to store anything, which means the story will disappear when you close the tab.
- If you purge your browser data, all your local stories will be deleted.

#### Managing your local storage

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/50890833-c28e-4325-86ad-7f5a3eb83529)

At the bottom of the **options** Tab, you can export your story to your clipboard or to a file in JSON for importing. You can also delete the story if you want.

You can import .story and other types files or simply drag and drop them to the window.

Stories exported in .story JSON will preserve their Memory, Author's Note, and Lore Book Entries. Plaintext **will not**.

#### Serverside Storage

You can opt to store your story on the server. This will let you access it on any device from your account.

Simply click the tickbox above the import options labelled **Remote Storage** to make it switch from *Local Storage* to *Serverside Storage*.

You can also set this to be the default in your **Account Settings**.

Your Serverside storage is encrypted using your credentials, so if you change your password, **all your stories will be inaccessible!**

***

### Data Privacy

One of the chief concerns in the creation of *NovelAI* was ensuring a high standard of privacy for user data.

#### Wait, NovelAI Staff can read my content?!

**No**, NovelAI staff cannot read your stories. They are under multiple layers of encryption, and the keys cannot be accessed remotely by staff.

#### Encryption

The only parts of the process that have any access to unencrypted content are the backend and the processing Cloud GPU.
While the requests aren't encrypted, they only contain the context tokens, and no other identifying data as a default. NovelAI's servers also do not log any of these requests unless you specifically ask them to for debugging purposes.

**The encryption is done on your machine**. The server has no controlover it. Developers *are* able to request the email address associated with a specific subscription plan ID, but that's about it.

Keep in mind that *exported content is unencrypted*! Don't share things you don't want to be made public!

For further details about how the Encryption works, read project lead ***Kurumuz's***'[Open Beta blogpost](https://novelai.medium.com/the-first-month-of-novelai-30a4a551a4ba), which explains it more thoroughly.

***

## Customization

Themes allow you to bring a high level of customization to your *NovelAI* experience. **Themes** allow you to instantly change the look of the entire [**frontend**](https://en.wikipedia.org/wiki/Front_end_and_back_end) with the click of a button! There are a number of Themes to choose, all available in the **Customization** section of the **Options Menu**, accessible from the **Story Library** pane.

The Themes area also allows you to adjust your [font size](https://en.wikipedia.org/wiki/Point_(typography)), as well as the **paragraph indent**. The indent causes every new paragraph to begin to the right of other text by the amount specified in the setting.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/7ea2d4f9-79d8-4d11-84d2-7bb8121adb13)