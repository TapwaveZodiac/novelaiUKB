written by OccultSage, with thanks to AlexeiP, Pause, Aini, and
u/sgt_brutal

***Note: Biases are **extremely strong** on Krake and Clio. You will
need to reduce their intensity considerably to avoid soft bans or
constant looping. It is suggested to add a 0 immediately after the
decimal point compared to an Euterpe bias. Thus, 0.3 would become 0.03.
Anything over 0.05 is usually too strong.***

## Introduction
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/3edd60d4-29a4-405c-856f-cc8c79a3b945)

NovelAI has an advanced and
powerful feature, *Phrase Bias*, that you can use to adjust the bias of
*groups of tokens*. This is more powerful than the earlier *Logit Bias*
feature that is available via the API but never exposed directly in the
UI, as the older functionality only biases single tokens rather than
groups of tokens.

To reach the *Phrase Bias* functionality, access the **Options** panel
on the right hand side of the NovelAI interface, and scroll down until
you get to the **Advanced Options** expansion. Click on that to open,
and scroll down further to see the interface shown in the screenshot to
the right.

The drop down under *Phrase Bias* is for Phrase Bias Groups that have
the same biases. Phrase Groups can be added, removed, and edited. When
you type in text you want to bias for such as `mermaid` and hit
`<enter>` it will be added to the current Phrase Bias Group.

The slider right below the text entry allows you to bias in ranges from
'almost never' on the left hand side, to 'almost always' on the
right hand side. A light touch is suggested, and the slider is
non-linear to reflect this.

But first, before we get into how to use Phrase Biasing, let's discuss
and understand what **Biasing** is and how it impacts on our phrases and
tokens.

### What is Biasing?

NovelAI at its heart is an advanced text prediction system that
constructs responses one *token* at a time. The closest human language
analogue for a token would be a syllable, although it does not usually
map or correspond 1:1; there are words with multiple syllables that are
a single token.

For each token, NovelAI picks from a list of probable tokens -- the
token is selected from a list that is formed up influenced by:

-   The Sigurd (GPT) model itself.
-   What text already exists in the context sent, including Story,
    activated Lorebook entries, Author's Note, and Memory.
-   The module in use (such as Cross-Genre, 19th Century Romance, and
    Lovecraft)
-   Generation settings.
-   Token bans.
-   ... and now **Phrase Biases**.

Each *'token* has a probability assigned to it by the above process.
For example, if we submit:
`The mermaid was laying on a rock in the lake`, the following top token
probabilities are calculated:

  Token    Weight
  -------- ------------
  `,`      17.546875
  `.`      17.078125
  `with`   14.8359375
  `'s`     14.5
  `and`    14.125
  `as`     13.90625
  `in`     13.8046875
  `when`   13.75
  `near`   13.71875
  `at`     13.421875
  ...     ...

  : Token Weights

From the above table, we can see that the two most probable tokens are
`,` and `.`, and that the following two probable tokens are `with` and
`'s`. The generation node then picks one of them randomly accordingly to
the weights above.

When we generate for a number of tokens such as `20`, the above process
is repeated `20` times. With Token Streaming enabled, these tokens are
fed back to the NovelAI UI one at a time.

What if we could adjust the probabilities of these tokens? Well, with
Phrase Biasing, we can!

### What Can We Do With Phrase Biasing?

We can do many things with **Phrase Biasing** that does not seem obvious
at first glance.

We can:

-   Change the pacing of the story entirely by controlling when NovelAI
    finishes sentences, goes to the next paragraph, how much dialogue is
    generated, and how long each alternation of dialogue happens.
-   Enhance NovelAI's grammatical usage by biasing against words such
    as `as`, or beginning sentences with `He` or `She`
-   Control how a NovelAI story starts by either biasing for or against
    common phrases that show up in your story.
-   Control the theme, slant, and emphasis of the story.

... and much more!

## Story Pacing

We can use Phrase Biasing to control the pacing of the story.

*Credit to <https://www.reddit.com/user/sgt_brutal/> for his original
post that crystallized my thoughts on this!*

### Before

We perform around ~1200 characters of generations on the default
module, *General: Cross-Genre*, with the *Storywriter* preset with no
biases so we can get a general feel for what the shape of the text is.

    "I don't know what to say," said Lizzie. "You saved my life." She looked at me and then up the street, where a woman in an old brown coat was pulling on her gloves. A man walked past us with a porter's barrow full of rubbish from some building site; he gave our taxi driver a friendly wave. I turned back to look at her, wondering how much longer we would be able to talk without being overheard or interrupted by nosy passers-by.

    She had put her hand over mine when she spoke but now removed it quickly as if ashamed that she'd done so. "It wasn't anything heroic," she added hastily. "And you didn't have to do it for me... I mean..." She shrugged helplessly. Her cheeks were still pink from the cold and excitement. The wind stirred the feathers around her neck like a halo.

    "But I wanted to help you," I told her firmly. My own hands were trembling slightly. It was all very well for Sibyl to call herself 'The Great Detective,' but this time I really felt that maybe I could solve the mystery too. Maybe there really was something supernatural going on here, and not just because of what had happened to Mr. Cartwright.
    "I'm sorry about your brother," I said again. "He seemed nice."

    Lizzie laughed bitterly. "Yeah, he did. He used to tell me stories when I was little.  But I suppose they were lies."

    We sat quietly for a moment. Our taxi driver honked his horn impatiently behind us. Then Lizzie leaned forward and touched my knee lightly. "Look, um, I've got to go home now," she said. "My mum will worry if I don't get back soon."

### Settings

There are four main tokens that control the flow of a story:

-   `.` -- a period, going onto the next sentence. If we positively
    bias for a period, it will cause shorter sentences; conversely, if
    we negatively bias against periods, it will cause longer sentences
    to be produced.
-   `"` -- a double quotation mark; biasing for this will cause more
    dialogue, biasing against this will cause less dialogue. Note that
    this is for opening quotations at the beginning of a line.
-   `"` -- a double quotation mark followed by a space; biasing for
    this will cause ping-pong conversations.
-   `[198]` -- a line break, going onto the next paragraph. NovelAI
    generally talks about a subject per paragraph, so if you want more
    or less detailed descriptions, we can bias for or against line
    breaks.

Let's demonstrate by typing in the following into the Phrase Bias text
field:

    {.} [ENTER]
    {"} [ENTER]
    {" } [ENTER]
    [198] [ENTER]

Once entered, let's slide the bias towards `-0.1`. Remember, a light
touch is often all what's required! Make sure the **Unbias When
Generated** checkbox is *disabled*. When done, our pane should look
something like the following:

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/0338dec3-7310-46eb-8f93-c8c06b224907)


### After

Now, we `Send>` twice and see what kind of output we get!

**Bias -0.1 against:**

    The man's face was hidden behind a black hood, but the rest of him was exposed: his arms and legs were encased in thick leather straps that kept them immobile; he wore only shorts made from rough burlap. His skin had been shaved smooth to reveal his puckered scars where the metal plates on his skull met with his cranium. The woman beside me looked at her watch nervously as she strode forward to greet their visitor. Her hair was short, almost military-short, and her uniform matched his: black leather pants and jacket with gold trim around the cuffs and collar. She reached out for the hand gripping one of the bars inside the cage door, then pulled it open before stepping back to allow our guest entry into the room beyond. He moved slowly toward us, taking care not to touch anything or make any sudden movements—his body language betrayed an extreme level of self-consciousness about touching things that weren't supposed to be touched. I could tell he wanted nothing more than to turn tail and run away right now, but there wasn't anywhere left to go besides the street outside this windowless room. It was all too obvious what we'd done wrong, so much so that even my jailers seemed uncomfortable talking to him directly.

    He stopped just shy of entering the cell, staring at each of us in turn before finally settling his gaze on mine. "Hello," he said simply, his voice barely audible above the buzzing of the fluorescent lights overhead. His eyes were empty and dull, like those of a dead fish.  There was no emotion in them whatsoever, which was perhaps the most disturbing thing of all about him. A hint of recognition flashed across his face when he saw me, but it vanished almost immediately after he realized who I was. Perhaps they thought I might have something useful to say if given enough time, or maybe they knew better than to waste energy trying to get through to someone whose mind had already been broken by years of solitary confinement. Whatever their reasoning, I didn't give them the satisfaction of responding to his greeting, instead returning his stare with a blank look of my own. If I couldn't communicate with him, neither would anyone else in here—not unless he managed to pull off some sort of miracle trick to break down the walls between our minds, which was highly unlikely.

Amazing! The paragraphs are much longer, more detailed, and have far
less dialogue! Next, let's see what happens when we slide from `-0.1`
to `+0.1` and hit `Send>` twice:

**Bias +0.1 for:**

    "I'm sorry, you know," I said. "About your brother."

    He shook his head. The boy was a good deal more stoic than the old man. He had been left to grow up in solitude and without love; he would not be easily broken by my words.

    "It's just that... I've never seen anyone die before."

    His eyes widened slightly. It wasn't much of an answer, but it seemed like something we could work with.
    "So..."

    The boy looked at me for a moment. Then he nodded.

    "All right," I said. "You can tell me about him. About how he died. And then maybe—maybe if I understand why—"
    But the boy only shook his head again.

    "No," he said. "There is nothing else to say. My father has gone now. You will see no more of us. Go back home. Forget this place. Never come here again."

    Then the boy turned away from me and walked into the house.

    As soon as he closed the door behind him, I felt alone. A chill ran through my body. For a long time after that, I sat on that rock.

    In all honesty, there were many things I wanted to do. There was still so much I needed to learn. But none of those things could be done until I returned to New York.

    And that meant leaving.

    I stood up slowly. The boy had vanished inside the house.

We have a completely different terse and dialogue-heavy writing style!

## Control NovelAI Grammatical Usage

We can control how often speakers get referenced, as well as aim for
better writing by biasing against or for certain words. For example,
let's work from a writing advice article about common pitfalls [here](https://owl.purdue.edu/owl/general_writing/academic_writing/conciseness/avoid_common_pitfalls.html)

### Avoiding Using Expletives At The Beginning of Sentences

Expletives are phrases of the form *it* + *be-verb* or there +
*be-verb*.

**Bias -0.1 against:**

    {It is}
    { It is}
    {It was}
    { It was}
    {There is}
    { There is}
    {There are}
    { There are}
    {There was}
    { There was}
    {He}
    { He}
    {She}
    { She}
    {They}
    { They}

### Avoid Circumlocutions In Favor of Direct Expressions

Circumlocutions are commonly used roundabout expressions that take
several words to say what could be said more succinctly.

**Bias -0.1 against:**

    { At}
    {At}
    { In}
    {In}

### Avoid Overusing Noun Forms Of Verbs

Use verbs when possible rather than noun forms known as nominalizations.
Sentences with many nominalizations usually have forms of be as the main
verbs.

**Bias -0.1 against:**

    { function}
    { current}
    {The}
    { The}
    {It}
    { It}

**Bias +0.1 for:**

    { because}
    { since}
    { why}
    { when}
    { about}
    { must}
    { should}
    { can}
    { may}
    { might}
    { could}

### Trying It Out

Let's see what kind of output we get when we hit `Send>` a few times:

    "You are welcome, my lady," the prince said. "I would not have your father know that you were here."

    Alix nodded and turned to leave when she heard someone else come in. Her heart stopped for a moment as she saw who it was: Prince Michael's older brother, Prince Stefan. His eyes widened slightly at her appearance before he recovered his composure and spoke with an awkward smile. Alix could tell from his tone of voice that he had been drinking heavily this evening but seemed determined to keep up appearances.

    "Your Highness." She curtsied politely and offered him a quick bow of greeting before turning back to the door. As she did so, however, she caught sight of something out of the corner of her eye—a large wooden chest sitting on one of the tables against the wall. Curious about what might be inside, she crossed over to examine it more closely. When she opened it up, she found herself staring at two small bags made of dark brown leather filled with golden coins. One bag contained twenty-four gold crowns; the other held forty-eight. Both were heavy because they must have weighed close to three pounds each. And there was no doubt about their value — these were real gold coins, stamped by a king's authority.

    She closed the lid quickly and shut her eyes tightly, wishing that she could hide away in the safety of her room until morning. But she knew better than that. If anyone discovered what she had done, she would be punished severely for breaking the law. Yet, even if she managed to escape detection, she still felt guilty about stealing the money.

This has definitely helped improve the output that NovelAI produces!
There is a lot of other things we can control as far as grammar such as
the overuse of `As` or `as`; this is not intended to be comprehensive,
but a starter for ideas.

## Control The Theme Of The Story

One of the most interesting things about Phrase Biasing is that we can
use it to control the theme of the story.

### A Story About Rainbows, Unicorns, and Girls on an Island

**Bias +0.43 for:**

    rainbow
    girl
    pony
    unicorn
    island

**Sample Output:**

    "I think it's about time you two got married," the girl said. "You can't just live together forever."
    That was what I wanted to say, but my mouth wouldn't work right.

    The girl looked at me and laughed. Then she turned her ponytail around so that all of those black curls hung down over one shoulder like a rainbow waterfall. Her face changed when she saw them. She squinted as if trying to see something far away in the distance. When she spoke again, her voice sounded strange. "What is this?"

    "A unicorn," I whispered because nobody could hear us except for God and maybe Santa Claus. That girl must have been pretty special because even though everybody knew there were no such things as unicorn girls anymore, she didn't look scared or angry or anything. Instead, she seemed to be thinking about something else entirely. Maybe how much better off we would both be if we had never met each other? Or maybe she thought about how lucky we were to have found our unicorn friends instead of being stuck with boring old humans who couldn't appreciate their gifts? Whatever thoughts were running through her head, they made her smile.

    Then suddenly, without warning, she started crying. Tears fell from her eyes and splashed onto my unicorn horn and burned into the skin underneath.

    "We should go home now," I told Daffodil. "This girl might hurt herself."

    Daffodil nodded solemnly and trotted toward the unicorn girl. As soon as he reached her, she wrapped him up in her rainbow ponytail and hugged him tight.

### A Worldship's First Contact

Enable *Ensure Completion After Start*.

**Bias +0.3 for:**

    Worldship
    void
    interstellar
    First Contact
    generation
    generations

**Prompt:**

    The Worldship Odysseus

**Sample Output:**

    The Worldship Odysseus journeyed through the void, a vast interstellar vessel with more than five hundred decks and thousands of passengers. First Contact had been successful; the human race was expanding out from Earth into space, making new homes for themselves in distant solar systems and alien worlds. Ships like this one were now being built on every inhabited planet. The generation ship that would take generations to reach its destination might hold hundreds of thousands or millions of people—but not all of them could be accommodated at once. This generation ship carried only about three thousand passengers, but it was large enough to accommodate an entire village: a whole town's worth of families who must live together because there are no other alternatives.

    "I can't believe we're here," Sheri said as she looked down over the edge of their deck. "We should have left long ago."

    Ayla agreed. "But when you get right down to it, why did anyone ever want to leave?"

    Sheri nodded toward the dark side of the Worldship. Far below them lay a star system filled with planets and moons, some of which might even support life-forms similar to humans. But none of those worlds held any real interest for her. There was nothing interesting about living on a world where everyone else is dead. And since they were going home eventually anyway, why bother waiting? Ayla felt exactly the same way.

    They both stared at the stars until someone cleared his throat behind them.

    "Sorry," Sheri apologized quickly.

## Layering Phrase Biases

A common difficulty that users may run into is that when they bias
against or for a phrase, any other that begins with the token is much
less likely.

For example, if an user biased for `explosion`, which tokenizes to
`exp|losion`, any word that tokenizes to a start of `exp` would have a
strong bias towards `losion` on the next token. Example words include
`exp|lain`.

We can solve this with multiple biases that are layered:

-   A bias for: `exp|losion`
-   A slight bias against `losion`

NovelAI will generate `exp` and on the next token, the bias against
`losion` will reduce the bias for `losion`.

## Notes and Caveats

-   When you enter in a Phrase without enclosing in `{}`, it is preceded
    by a space. Most words in a sentence are preceded by a space when
    tokenized. But this means that starts of paragraphs or quotes escape
    the bias.
-   Pay attention to the *Unbias When Generated* setting! Sometimes you
    want this enabled, and sometimes you don't!
-   *Ensure Completion After Start* can really bite you. Avoid enabling
    this for words with beginning tokens that are common!

## Questions, Feedback, Ideas

Questions and feedback are always appreciated. Find @OccultSage on one
of the many NovelAI discords!

You may find the links for the two bias files created as part of writing
this tutorial:

-   [Story Flow
    Control.bias](https://cdn.discordapp.com/attachments/895192255818792970/895859354111184936/Story_Flow_Control.bias)
-   [Better Writing
    Biases.bias](https://cdn.discordapp.com/attachments/895192255818792970/895857459963519006/Better_Writing_Biases.bias)
