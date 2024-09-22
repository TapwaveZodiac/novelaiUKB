Science fiction has us think of [**artificial intelligence**](https://en.wikipedia.org/wiki/Artificial_intelligence) as something for robots and alien spaceships, but the reality is very different. In this context, an artificial intelligence is very different from the *natural intelligence* exhibited by humans.

The phrase that conjures thoughts of robotic assassins and intelligent holographic people is actually [**artificial general intelligence**](https://en.wikipedia.org/wiki/Artificial_general_intelligence), or **AGI**.

The eponymous AI that *NovelAI* uses is a a lot of different technical terms put together: An **Autoregressive Language Model and Generative Pre-trained Transformer**.

### What does GPT mean?

Let us vulgarize this a little. This will be an oversimplification of sorts, if you're really interested, you should go ahead and consult Wikipedia's page on [GPT-3](https://en.wikipedia.org/wiki/GPT-3).

- **Autoregressive** means what the AI gives you is based on what information you fed into it, *and* a random element.
- **Language Models** are AIs designed to replicate human language for various use cases, such as autocorrection, text prediction, composing letters, writing advertisement, etc.
- **Generative Pre-trained** (yes, both at once) mean that the AI is first trained by making it read a lot of text. Then, a sample of the text is shown to the AI, and it is asked what is supposed to appear after it. Its performance is measured on how well it managed to "guess" the follow-up text, although some randomness or "loss" is useful as it gives it creativity.
- [**Transformer**](https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)) means that the AI processes the entire input text at once, and lends different weight to different content, instead of reading things one word at a time. This allows for faster and more efficient training for language models.

***

### What does this imply?

**No, you are not talking to a machine with thoughts and feelings**.

While *NovelAI* is very advanced, it is purely designed as a literature generation service. At times, you may feel like the AI understands you, and it may even seem emotional. This is it performing a very convincing impression of human literature - exactly what it was designed to do.

The AI is only capable of producing text that looks convincingly human, without understanding language on its own.

As such, *NovelAI* has no understanding of morality, or the fundamental rules of grammar, or even prejudices and biases carried by humankind as a whole. Please keep this in mind when experiencing the narratives presented in your Stories, and remember you can always ban certain tokens from appearing.

### Parameters

Think of an AI like a human brain. Inside the brain, you find *neurons*, and those *neurons* are connected by *synapses*.

The number of parameters is the number of *synapses*. It's a measure of the **density** of the neural network's connections. The denser it is, the richer the connections, and the broader the scope of the AI's creativity. (Theoretically. Recent developments have shown that this is a tendency but not a guarantee, hence Clio's potential in spite of its small size.)

The model is, in reality, a [**vector space**](https://en.wikipedia.org/wiki/Vector_space) and each parameter is a set of [**floating point numbers**](https://en.wikipedia.org/wiki/Floating-point_arithmetic) that constitutes a vector. Each Vector is a connection between tokens, and that network of vectors is an attempt to represents human language mathematically.

These parameters are arranged in layers, known as [matrices](https://en.wikipedia.org/wiki/Matrix_(mathematics)). The model is first given completely empty matrices, and they gradually fill with vectors as training happens. Eventually, some layers end up serving specific purposes. It is difficult to tell which is which, as they are not naturally labelled. You can freeze layers and see what changes, helping you keep what is good, remove what is bad, and narrow down on specific layers that do specific things.

A model with more parameters takes **considerably** more Video RAM on the machine's hardware, but is capable of greater creativity and more 'natural' language. The more context memory it has, the more memory it needs. When you combine those together, the cost is *multiplicative*, not linear. Twice the size and twice the memory is more than twice the cost.

Why Video Memory? Simple: CPUs perform operations linearly, and vector math is costly. GPUs are made to calculate in parallel. As it turns out, calculating raytraces for lighting in a 3d environment gets pretty close to what you need to run an AI.

***

## Tokens

The AI interprets text by converting it to [**tokens**](https://en.wikipedia.org/wiki/Lexical_analysis#tokenization). **Tokens** are how the AI sees pieces of text. Much like [morphemes](https://en.wikipedia.org/wiki/Morpheme), tokens are combined to form words or sentences. Because the AI has no judgment of its own, it relies on evaluating the relationships between tokens based on its training data, then determining the most likely token to come next in the sequence.

Think of it as a huge game of probabilities. There is no winner, but there are *more likely* answers, and the AI picks from those.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/c7da11f4-0f02-4a54-97f3-ced9e4a25cf0)

For example, a **raincoat** is composed of two tokens - the token for **rain** and the token for **coat**. When put together, the AI recognizes the pattern as **raincoat**, and evaluates its training material to figure out what tokens are associated with **raincoat**. Not all tokens are whole words - some tokens are as simple as punctuation marks, spaces, and even partial words like **mah**.

Because the AI is quite powerful, it's capable of evaluating patterns with up to thousands of tokens in total. When you hit **Send**, the **Current Context** is fed to the AI as tokens, the AI estimates the most likely next word in the sequence, then repeats the process until the Generation is returned.

*NovelAI* works by identifying links between tokens, thus, **including a token will cause it to have a higher chance of appearing**. This means that writing `John cannot see.`, a *negative*, will cause the AI to still consider `see` as a possibility.

This is similar to [ironic process theory](https://en.wikipedia.org/wiki/Ironic_process_theory). Instead, you should phrase *positively* - `John is blind.` - where possible.

### Tokenizer Tool

*NovelAI* includes a built-in Tokenizer [Tool](Tools) that allows you to see not only the breakdown of tokens used in an input, but also the token IDs, token count, and character count.
This tool is accessed through the main menu, or by clicking on the token count of Memory, Author's Note or Lorebook entries.
