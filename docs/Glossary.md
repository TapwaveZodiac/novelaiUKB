This page aims to define terms that are often used by the community and
may not be immediately accessible to newcomers.

## Asterism (⁂)

*Typography*

A group of three asterisks brought together as a single symbol. Usually
used to separate stories in the finetune, making it a powerful
separator. Similar, but not identical to a Dinkus, which is weaker.

## ATTG

*Technique*

ATTG stands for the `[ Author: …; Title: …; Tags: …; Genre: … ]`
metadata, which is present in the dataset. This row can be inserted at
the top of the Context to heavily influence the AI output. The first two
categories are usually omitted as they\'re less useful than Tags and
Genre.

## Attributes

*Technique*

Attributes is a technique where various data --- such as characters or
locations --- is formatted similarly to database entries or wiki-style
data blocks. Due to these being common in both the Base and the Dataset,
the Attributes can be as efficient as prose --- and often easier to
write.

## Author's Notes (A/N)

*Text Injection, Feature*

A type of [Text Injection](Context) that is
usually situated three newlines from the bottom of the context. It is
much stronger than Memory and can often be disruptive, especially if the
inserted text doesn\'t fit the output seamlessly. The typical
side-effects include looping and degradation of the output quality. Use
with caution.

## Banned Tokens

*Generation, Feature*

A token the AI is not allowed to generate. Instead, the AI will use the
next most likely token.

## Brackets

*Typography*

Shorthand for *Square Brackets*, which are these symbols: \[ \]. They
are part of the finetune data, and used to contain metadata about the
text files. They are traditionally used in [Injected
Text](Context) to separate it from story text.

## Branch

*Generation, Writing*

A version of the story. When you redo, or undo then edit, you create a
new branch. Think of it like time travel.

## Calliope (model)

*AI*

A finetuned version of the GPT-NEO 2.7B model. It is inferior in
creative performance to Sigurd, but very lightweight and can run on
cheaper, slower hardware. It was used by NovelAI during the Pre-Alpha
and Alpha stages.

## Canvas

*Image Generation*

The area taken by the image. You can freely edit it directly in NovelAI,
or import it in the image editing tool of your choice.

## Cascading Activation
*Injected Text, Generation*

A flag that tells a Lorebook entry to check for other text injections
(Memory, Author's Note) for its keys, rather than only the story text.

## Caveman Format

*Writing, Technique*

Writing while removing most grammatical words, and focusing only on
words that carry semantic meaning. As an example,
`John usually wears a bright blue coat which he likes dearly` would
become `john wear bright blue coat, john like coat`. It is used for
lorebook entries to reinforce connections between subjects and objects
and reduce token use at the expense of writing quality. Caveman is
mostly obsolete in advanced models.

## Clio (Model)

*AI*

A in-house model trained by NovelAI. It boasts a much larger context and
higher performance than Krake with only 3 Billion parameters.

## Context

*Injected Text, Generation*

All the text that the AI has in its memory before it attempts to
generate more text. This is all the activated injected text, plus all
the story text that can fit inside the context window.

## Context Window

*AI, Limit*

GPT-J and GPT-NEO both share a limit of 2048 tokens, or ~9000 Latin
Alphabet characters used as a person would need to communicate in a
natural manner. This is the maximum memory that the AI can use. On
Tablet tier, the window is 1024 Tokens.

For Clio, this limit is 8192 Context for Opus, which is around 35000 characters.

## Context Viewer

*Injected Text, Feature*

A tool that lets you visualize all text injections, and what the context
window contains. This can help diagnose generation problems due to poor
text injection settings.

## Dataset

*AI*

A batch of text files, used for fine tuning or module training. It must
be presented in a specific format for best results.

## Dinkus (\*\*\*)

*Typography*

A set of three asterisks in a row. Often used to separate large
sections. Breaks the current event sequence before resuming generation.
Can be used for things like short time skips, depending on how the
previous paragraph ended. Since Euterpe, Dinkus has been used mainly for
prose. For separating data, see `Separator (----)`.

## End of Sampling (EOS)

*AI, Generation*

A marker used to tell the AI to stop generating. Generally, it is an
uncommon symbol that would not appear unless the user \'trains\' the AI
to use it regularly. Useful for generating text similar to chat logs and
other unorthodox forms, or simply to stop on sentence ending markers.

## End of Text Token (\<\|endoftext\|\>)

*AI*

A token that was used to designate the end of a text file, so that the
training routine of the AI can proceed to the next file. It can rarely
appear during generation, this is simply an artifact and can be removed.

## Entry (or Lorebook Entry)

*Text Injection*

An entry for an element of your story, as part of its lorebook. It has
text data, insertion settings, and keys that will activate it if
present.

## Ephemeral Context

*Text Injection, Feature*

A form of Text Injection that is only active for a number of actions,
after which it disappears. Has a very specific syntax that no other
feature uses.

## Euterpe (Model)

*AI*

A finetune of the Fairseq GPT-13B model. It is superior in creative
performance to Sigurd, but more expensive to train and run. It is used
by NovelAI during the Beta stage.

## Finetune

*AI*

If you consider the AI as a bunch of knobs and sliders, this is the act
of adjusting them in order to make the AI\'s output more \"fitting\" for
your purposes. This is done on expensive, powerful machines or servers
and not really something you do yourself.

## Flatten

*Feature*

An aggressive form of trimming. Eliminates all branches, which leaves
the entire story as one solid block of text.

## Format (or Lorebook Format)

*Writing*

A way to present the information to the AI. It can range from writing
things as you would in a normal essay, to using formats similar to code,
to many other different types.

## Generation (or AI Generation)

*Generation*

After the AI receives the context window\'s data, it tries to continue
the story from there. The text you receive from the AI is the
Generation.

## Generative Pre-trained Transformer (GPT)

*AI*

A neural network that takes the form of a large amount of [vector-space
equations](https://en.wikipedia.org/wiki/Vector_space). Every number is
a token, which is a text fragment that appeared in the AI\'s training
data. The fragments, and their relationships, are analyzed, and a
network of \"relationships\" between all these fragments are created.
The goal is to create a network which can replicate human language in
order to convincingly generate human-like text.

As it is pre-trained, it does not learn from its input. Only what it has
been trained with. Training is an extremely costly operation that
requires rare, expensive, and difficult to set up hardware, making it a
costly service. These models also require powerful Graphical Processing
Units, especially units equipped with Tensor Cores, which are ideal for
vector space math (like raytracing!) These GPUs are expensive and use a
lot of power, which also makes *running* a GPT model expensive.

## Guidance

*Image Generation*

See [Scale](Glossary#scale).

## Image Resolution

*Image Generation*

The total surface of your image, defined by its Width, multiplied by its
Height. NovelAI can generate images up to ~3 Megapixels in resolution
(1024x1024).

## Image To Image (Img2Img)

*Image Generation*

Using an image as a base for the AI to modify. The prompt still applies,
allowing you to change, add, or remove elements from the original
picture.

## Inline Generation

*Feature, Generation*

An action performed by pressing Ctrl + Shift + Enter or ⌘ + Shift +
Enter, with the text cursor located in the main text box. This will
generate a response where the text cursor is, rather than at the end.
Content after the text cursor is ignored by the AI.

## Instruct

*Generation*

A moduel which lets the AI read instructions between {curly braces} and try to answer the request as best as possible, allowing you to directly tell the AI what to do.

## Inpainting

*Image Generation*

Selecting an area of an image and prompting the Image Generation AI to
redraw only this area, alternatively, providing an image with a missing
chunk on its inside, and telling the Image Generation AI to complete the
missing chunk.

## Lore Generator

*Feature, Generation*

A feature of the Lorebook that uses the current module (and if desired,
the Memory, Author's Note, and other lorebook entries) to generate lore
for concepts, objects, people, factions, and much more.

## Kayra (Model)

*AI*

A in-house model trained by NovelAI. A further development of the proof of concept established by Clio. It has 13B parameters and the same large context size, boasting superior knowledge and creative ability.

## Krake (Model)

*AI*

A finetune of EleutherAI's 20B GPT-NeoX model. It offers similar
geenral metrics to Euterpe but has a different set of strengths, namely
in terms of real world knowledge, and style-matching abilities.

## Lorebook

*Text Injection, User Content*

A database of entries, triggered by keys. If an entry's key is found,
then the text of the entry is injected into the context, based on its
settings. Works identically to other text injections, just with more
fine control over where it ends up.

## Lorebook Keys

*Text Injection*

A text "trigger" which activates a Lorebook entry if found in the
text. Can be anything, from a name, to a symbol.

## Loss (or Training Loss)

*AI*

Loss is a term used in Machine Learning to determine if the AI\'s output
is close to what was expected. When training Modules, lower loss means
that it deviates less from the dataset, whereas high loss usually mean
that the data was improperly cleaned, or it could just mean that the
data is different from what the AI has learned before.

## Loss Graph

*AI*

A graphical representation of the module's loss after every step of the
AI's reading and training. A good 'level' for loss is very
subjective, generally, you want to avoid the curve following a path that
goes too low or too high, as both have their own issues.

## Memory

*Text Injection*

A piece of text that is inserted near the top of the story.
Traditionally used to keep track of broad context elements and current
events to help the AI stay on track. Works the same as Author\'s Note
otherwise.

## Model

*AI*

A code base which constitutes the structure on which the neural network
is built. GPT-NEO and GPT-J are both model codebases. GPT-J **6B**,
however, is a **weight**, which is a pre-trained model that possesses 6
**billion** parameters. Parameters are the number of connections between
existing tokens.

Image generation uses different models, which are finetunes of Stable
Diffusion, produced by Stability.AI.

## Module (or AI Module)

*AI, User Content*

Known as a **soft prompt** in the research community. This is a batch of
vector math that is sent directly to the AI, ignoring tokenization
completely. It takes the same amount of space in the context window as
20 tokens, but is not a token by itself. Think of it as a mini finetune
based on a specific group of texts that does not require re-training the
AI as a whole, but still changes what the AI will produce.

## Module Training

*AI*

Sending text files to NovelAI's model training program in order to
produce a module trained on their content. Works similarly to
fine-tuning a model, but on a smaller scale.

## NAI Diffusion Anime Curated
*Image Generation, Model*

A finetune of Stable Diffusion, trained on Danbooru images, all of which
are tagged as Safe, ensuing no NSFW output. Generally outputs more
consistent images and is better at pre-existing characters, to some
degree.

## NAI Diffusion Anime Full

*Image Generation, Model*

A finetune of Stable Diffusion, trained on Danbooru images, which is
capable of NSFW output, as it uses all types of images. Outputs greater
variety for characters.

## NAI Diffusion Furry

*Image Generation, Model*

A finetune of Stable Diffusion, based on images from various sources with E621 tagging. The main focus is
on anthropomorphic characters, but the model has a broad coverage.

## Noise

*Image Generation* Noise is the base for all Stable Diffusion images
(hence the name of diffusion). The noise pattern is refined into an
image after every step.

As a parameter, Noise *adds* noise to the existing image in order to
allow for greater deviation from the base.

## Nucleus Sampling (Top-P)

*AI, Sampling*

Sampling which selects a set of tokens, based on the percentile chance
of them appearing. Starting from the most likely, it adds up
probabilities until it hits its setting. Sampling then ends.

## Order of Insertion

*Text Injection*

A setting which determines the order that text injections are performed.
Think of it as a stack: The highest number goes first.

## Output

*AI*

Synonymous with AI Response or Generation. Effectively, what the AI
makes based on what you give it.

## Perspective (or POV)

*Writing*

Whether or not the narration is done in first (I/me), second (You), or
third person(he/she/it).

## Phrase Bias

*Feature, Generation*

A feature which influences the AI to increase or reduce the likelihood
of some tokens or phrases appearing. Good for enforcing consistency or
reducing things you don't want without outright bans.

## Placeholder

*Feature*

A text element that must be filled by a scenario\'s user upon import.

## Preamble

*Generation*

The Preamble is a sequence of tokens
inserted in the context window before generation. It tells the AI "this
is the start of something new", which can help reducing the feeling of
"being in the middle of something" and sticking to your prompt a
little more closely. The Preamble used depends on the model.

## Prefix

*Text Injection*

A small piece of text appended to the beginning of a Text Injection when
it is placed in the context window. Helps with separating it from other
entries if you use brackets or newlines.

## Preset (or Generation Preset)

*AI, User Content*

A batch of settings, such as sampling and randomness, that can be saved
and shared to other users.

## Prompt

*Writing*

The first piece of story text that you provide to the AI, before any
generation has been performed.

*Image Generation*

The instructions given to the Diffusion model to direct its output.

## Prose

*Writing*

Writing like you speak. Prose is the opposite of **Verse** which follows
a structure, meter, or both.

*Image Generation*

A prompt written in natural language, as opposed to using tags (although
both can be mixed.)

## Quality Tags

*Image Generation*

Tags that were applied to images used for the training of NovelAI
Diffusion's models. They are based on a percentile score, with the top
scoring images being ranked as "masterpiece", all the way through
"best quality", "high quality", "normal quality", "low quality"
and "worst quality". This is used to discern "good" elements from
"bad" ones.

## Randomness (or Temperature)

*AI*

A setting that adjusts the likelihood of the tokens available to the AI
after sampling, so that rare tokens actually have a chance of appearing.

## Redo Tree

*Feature*

When you have performed one or more Retries or edits for a story step,
this button with a number next to Redo will list all the Retries and
edits you have done, so you can pick the one you prefer.

## Repetition Penalty

*AI*

A setting that decreases a token's chance of appearing if it has
already appeared in the current generation. Helps reduce repetitiveness.

## Reserved Tokens

*Text Injection*

How many tokens' worth of space are saved for the current Text
Injection. Highest priority reserves first.

## Retry

*Feature*

Deleting the previous AI generation and asking the AI to send a new one.
If you made any edits, this is just like clicking Send.

## Sampling

*AI, Sampling*

Selecting a limited pool of tokens by doing some math on their
probabilities. This helps focus the AI and make Randomness more useful
by spreading it over less possible tokens.

*Image Generation* The sampler is an "interpreter" of sorts, which
handles how the prompt is processed. The default, k_euler_ancestral,
offers greater quality at lower steps, and more per-step variability,
ensuing a lot of potential without using a lot of steps per image.

## Scale

*Image Generation*

A setting used by Stable Diffusion to adjust how the image is generated.
Generally, higher scale leads to stronger contrast, and "sharper"
images, whereas low scale is "softer" and more "painterly".

It is a floating point number, and can be fine-tuned down to several
decimal places.

## Scenario

*User Content*

A story that was exported for sharing. It can have placeholders:
elements that must be filled in when imported by the user, such as names
and so on. This allows for easier personalization than a normal prompt.
It can also contain a lorebook and generation settings.

## Search Range

*Feature*

A **lorebook** setting that decides how deep in the story text it will
go looking for keys before it stops. Helpful if you mention a lot of
things but only want to focus on very recent elements.

## Seed

*Image Generation*

A 32-bit integer which serves to define the base noise pattern, which is
then refined into an image. Using the same seed will result in similar
images (to some degree). Exactly identical settings and prompt are
required for an identical output.

## Separator (----)

*Typography*

A set of four hyphens. In the Dataset, this is used to separate the
individual data entries for things like Attributes-style character data.
As such, it should be used instead of Dinkus (\*\*\*) if you want a
module or scenario to output non-prose. Useful for Generators and other
similar uses.

## Sigurd (model)

*AI*

A finetuned version of the GPT-J 6B model. It is superior in creative
performance to Calliope, but more expensive to train and run. It is used
by NovelAI during the Beta stage.

## Stable Diffusion

*Image Generation*

An image generation AI system by StabilityAI. As a diffusion model, it
generates images based on noise patterns, rather than collaging pictures
together. It is open source and can be downloaded and run for free with
a suitable GPU. NovelAI's implementation uses additional proprietary
code extensions and finetunes.

## Step

*Writing*

Every time a generation is performed, the story advances to its next
step. Edits after a generation count as another step as well.

*Image Generation*

One of the de-noising, image-drawing phases performed by Stable
Diffusion. Steps are not linear: You cannot simply "add" another step,
the entire generation has to be planned for the step amount.

## Storage

*Feature*

An encrypted database of your stories. Can be local, or on NovelAI\'s
servers.

## Story

*Writing*

The content in the text box in the middle of your NovelAI window is
"the story text." Every other piece of text fed into the AI is Text
Injection.

## Story Tag

*Feature*

A tag applied to a story so you can search for it easier.

## Stream Responses
*AI, Feature*

Displays tokens as they are generated rather than dumping the entire
response on you all at once, as if you could watch the AI writing it.

## Subcontext

*Text Injection*

A group of Lorebook Entries that are injected as one block with its own
insertion settings.

## Suffix

*Text Injection*

Identical to *Prefix*, but it is added to the end of the entry.

## Tags

*Image Generation*

Refers to Danbooru tags (Curated, Full), or E621 (furry), which are used
for training the AI and make generating specific elements easier.

## Tail-Free Sampling (TFS)

*AI, Sampling*

A "Tail" is basically all the tokens that are **really** not
appropriate, such as random garbage symbols or extreme outliers. Most sampling
methods are very aggressive and only keep the absolute best tokens.
Tail-Free attempts to only cut off the tail so that the pool of possible
tokens is bigger and creative, without keeping the really bad tokens.

## Text Adventure Module 

*AI, Feature*

A module designed to be played with DO and SAY inputs, similar to old
Text Adventure games like Zork. Uses a different interface where inputs
and outputs are clearly delineated.

## Theme

*Feature*

A JSON file with some CSS thrown in it, which tells NovelAI's page how
to look like. Allows for considerable customization of text colors,
backgrounds, and many other things.

## Tier

*Subscription*

Tablet, Scroll and Opus are the three Tiers that you can pay for.
Generally, Opus has access to features early and some extras, while
Tablet has a limited context window.

## Token

*AI*

A fragment of text that is turned into a mathematical vector (basically,
a pair of numbers). The Neural Network of the AI is built on the
relationships between all these tokens, which attempts to mathematically
reproduce Human language.

## Token Budget

*Text Injection*

How many tokens are allowed to be used at all by the entry. Generally
this is always set to the max window size, and priority takes care of
the rest.

## Token ID

*AI*

Remember how every token is a vector? Every vector has a number which
serves as its identifying number. For example, [198] is the "new
lin\" character, so banning it prevents the AI from creating any new
lines of its own.

## Tokenization

*AI*

Turning raw text into tokens. The AI is unable to read pure text data,
and must turn it into tokens first.

## Tokensafe

*Writing, Technique*

A technique to present information to the AI, a "format". It formats
lorebook entries by using headers followed by singular adjectives or
nominal groups separated by slashes.

## Top-A 

*Sampling*

A sampling method which adjusts the number of selected tokens based on
the top token\'s probability. Lower probabilities mean more tokens.

## Top-K

*Sampling*

A basic form of sampling that selects the K-most likely tokens. A top-K
of 10 thus selects the top 10 most likely tokens.

## Top-Kek

*Sampling*

A sampling method developed by Kurumuz. Which is now known as Top-A.

## Top-P 

*Sampling*

Synonym of *Nucleus Sampling.* P stands for Probability.

## Typical Sampling

*Sampling*

An entropy-based approach to sampling, which samples based on deviation
from a base line of entropy rather than probabilities.

## Train (a Model)

*AI*

A GPT model is "pre-trained" on a large corpus of text files in order
to create its token database, and analyze the relationships between the
tokens. This takes a **considerable** amount of processing power and
time, and is usually performed on very large, powerful servers or cloud
servers.

## Trim

*Text Injection, Feature*

**Disambiguation:**

• Trimming Entries: Any Text Injection can be trimmed down to the
Newline, Sentence, or Token, if it is unable to fit in the context
window in full.

• Trim Trailing Spaces: Removes any space left at the very end of the
story text, if it exists. Most tokens begin with a space, so leaving one
can cause strange generations since most tokens aren't able to appear.

• Trim AI responses: A deprecated feature that would cut off the AI
generation at the latest sentence delimiter. Nowadays, this is
"Continue Response to End of Sentence" in the Account Settings.

## Undesired Content

*Image Generation*

Also known as a "Negative Prompt", very similar to negative Phrase
Bias, but for image generation. It heavily weakens a tag, in order to
make it less likely to appear.
