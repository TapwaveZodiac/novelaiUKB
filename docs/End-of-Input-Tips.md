**This page was conceived during the Euterpe Era of
NovelAI. Some tech here might not be relevant anymore, but some tips can
still be useful. Refer to [The Rabbit Hole](The-Rabbit-Hole) For the current
model.**

This page contains **community-researched** content and aims to provide
in-depth tips to improve your experience with the AI.

This is an **expert** guide. There will be much less
hand-holding from now on. Terms and tools will not be explained if they
were defined in the feature pages and [Writing Help](Writing-Help), so make sure you have fully
read these two pages before continuing.

***

## The Importance of the Final Token

Regardless of what is in the rest of your context, the absolute final
token is by far the most important to the generation.You
can lead the AI into different directions depending on your phrasing.

Consider the following example:

`Bryan is in the kitchen.`

The text ends on a period, which ends the sentence. There is nothing
after it. As a result, the pool of potential continuations to this
sentence can get rather large.

Most of the time, when people say that "The AI is going into random
directions!", this is often a symptom of ending your input like this.

Now, consider this alternative:

`Bryan is in the kitchen. He`

This will put the onus of the next sentence on Bryan. He will be forced
to act, think, or say something, as *he* refers to Bryan by virtue of
proximity. This can help direct the AI rather well, especially if your
generation length is rather low. At longer generation length, the AI
*can* get a little off-topic with a small context.

Now try something akin to this:

`Bryan is in the kitchen. "`

This opening quote here will forcefully initiate dialogue. It may be
from Bryan, but it has a chance to come from another character entirely.
Usually this sticks to the latest named person, but has a chance of
relying on another previously named character as well.

Now look at this example:

``` 
Bryan is in the kitchen. 

```

What we did here is create a **linebreak**. Linebreaks are powerful
tools. The important part is that this creates a break in the text, which pushes the AI to
move on to something else. It can be moving forward in time, changing
speaker, changing scene, and many other things.

If you go to your **Account Settings**, you'll find an option called
**Trim Trailing Spaces**. You should absolutely enable it, but even if
it is, multiple spaces might not be trimmed. So why is that a problem?

A **lot** of tokens are words that **start with a space.** if
you end on a space, the AI might trip over itself because it is
struggling to find a word to start with, and a lot of continuations will
behave erratically, such as suddenly inserting newlines, or using words
that aren't connected to the current clause. Avoid trailing spaces as
much as you can!

The conclusion here is that **you should initiate for the AI as much as
possible, even if it's using a single symbol to do so.** Any sort of
hand-holding helps the AI stay on track much better than leaving it to
its own devices and expecting it to guess what you want. (Hint: it
won't.)

***

## Typography Symbols

There is a wealth of **[Symbols](https://en.wikipedia.org/wiki/Category:Typographical_symbols)** used in books that we can make use of.

### Basic Symbols

Let's starts with the basics. English mostly uses 7 punctuation marks.

-   The **Period** ( . ) symbolizes the end of a sentence.
    -   Good for concluding dialogue, as it tends to generate an end
        quote if you finish on one.
    -   Good for making the AI talk about something slightly different,
        or push it to continue the scene.
    -   Good for ending lists or paragraphs.

-   The **Comma** ( , ) symbolizes the end of a clause, or an item in a
    list.
    -   Good for asking the AI to continue on a very similar track. Less
        of a *push-forward* effect than the period.
    -   Good for setting up and continuing lists.
    -   Good for keeping the current speaker in dialogue.

-   The **Colon** ( : ) symbolizes the introduction of a name, an
    example or a list, or separates the speaker from the dialogue.
    -   Good for theatrical or chat-like writing where the speakers are
        clearly labelled.
    -   Good for chapter titles, sub titles, and any other header.
    -   Good for beginning a list or answering a previously asked
        question. `The answer? It's simple:`

-   The **Semicolon** ( ; ) is uncommon and mostly used to separate
    large clauses that are all subordinate to the same one, such as long
    items in a list.
    -   Good for separating large elements in a list, especially with
        incomplete linebreaks (just pressing enter once).
    -   Good for code, too, since a lot of languages use semicolons.

-   The **Ellipse** ( ... ) symbolizes a trailing sentence,
    thoughtfulness, etc. Generally, incompleteness, or interruption.
    -   Good to have someone trail off during their dialogue, or to
        sound like they're nervous or stammering.
    -   Good for ending a paragraph thoughtfully... or leading straight
        into a surprise, sometimes!

-   The **Interrogation Mark** ( ? ) is for asking questions.
    -   Good for dialogue, as it tends to either ask another question
        for emphasis, or switch speakers to get an answer.
    -   Good for getting more information from the AI about whatever the
        question is about.

-   The **Exclamation Mark** ( ! ) works exactly like a period but has
    a strong *tonal* effect.
    -   Good for switching the tone to something "louder", making
        characters scream, get upset, excitable narration, so on and so forth.

### Whitespace

This is basically any character like spaces and linebreaks.

-   **Single Spaces** should be kept away from the end of your text.
    -   This is because a lot of tokens start with a space included
        inside them. Leaving a dangling space means that the AI needs to
        find another token, which might be very difficult depending on
        your settings, and can result in strange stuff being generated.
    -   Dangling spaces can be trimmed with a toggle you can find in
        your **Account settings.**
    -   **Unbreakable Spaces** ( ) [ALT+NUM2,NUM5,NUM5] are
        automatically converted to normal spaces.

- **Em and En** spaces are used specifically for Poetry verse and citations/quotes, respectively.

-   **Incomplete linebreaks**, as in, a linebreak that does not create a
    *full blank line*.
    -   Good for AI 'push-forward' without going too far. Stronger
        than a single period.
    -   Good for creating a split between two speakers in dialogue.

-   **Full Linebreaks**, as in, a linebreak that creates a **single,
    full blank line.**
    -   **Avoid those as much as possible unless going for special
        formatting. Their effect on writing quality is noticeable.**

### Encasers

-   **Parentheses** ( ) are used to denote side comments or side
    thoughts.
    -   These can change the writing style a little, but make sure not
        to abuse them.

-   **Brackets** [ ] in NovelAI are a little special because they are
    banned from generation by default. They can be used as markers for
    **notes outside of the main text**. Extensively detailed in [The Rabbit Hole](https://tapwavezodiac.github.io/novelaiUKB/The-Rabbit-Hole.html#stage-directions).
    -   Keep in mind that you need to put **spaces after opening
        brackets and before closing brackets for them to work
        properly.**
    -   If you want to give instructions to the AI, use a curly brace instead.

-   **Less Than and More Than** < > are used in the finetune to *encase
    telepathic communication, or thoughts.*
    -   As such, you can use them to denote when a character is
        thinking.
        
-   **Curly Braces** { } are used specifically for instructions in Kayra. For other models, they are used for code.
    -   You only need to open the brace, not close it.
    -   Snek uses them extensively to generate Python code.

### Headers

-   **Bullet Points** ( • ) are used to mark elements of a list. One per
    line.

-   **Single dashes** ( - ) are used for discrete lists.
    -   Very practical if you want to present neatly indented lists.

-   **More Than** ( > ) When used to start a new row, > denotes text
    and computer console messages. It is also used by Text Adventure, though it's not always displayed.

-   **Em Dash** ( ─ ) is used for LitRPG format, such as stat
    blocks and MMORPG style skills.
    -   Note that this heavily influences the output, usually making the
        protagonist aware that they're in a game-like world.

-   **Double pound sign** ( ## ) is used for commented out text that will not be processed by the AI.
    - Any paragraph starting with a double pound sign will not be considered part of the context.      

####  Separators

 -   **Dinkuses** ( `***` ) are used to denote a section break in a text, and separate stories.
    -   Consider it as powerful "break from current scene" device.
    -   Often interpreted as a time skip or even a switch to a different
        character, depending on the preceding text. Experiment.

-   **Asterisms** (⁂) are a symbol used to separate sections of a single
    text, but for NovelAI, it's used to separate *whole texts.*. It is
    also the symbol used if you append a Preface to your text.
    -   As a result, it has a very strong "breaking from current
        scene" effect.
    -   Note that an asterism is almost always followed by square
        brackets in the data (containing the story title etc) and as
        such this does not function well when the bracket ban is
        enabled.

-    **Four dashes** (----) are used to separate blocks of non-story data, and Attribute blocks.
    - To return to Story text, use a Dinkus (***).

-    **Six equal signs** or "double bar" (======) are used to separate forum posts or email blocks.
    - Optionally combine with `Thread: (thread name)` before the first double bar to set its subject.
    - Follow the double bar immediately on the **next line** with the user name.
     ```
     Thread: What's the deal with airline food?
     ======
     Seinfeld
     ```
