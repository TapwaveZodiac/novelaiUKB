
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/1f5e8530-bd28-4144-9de9-d3b883800660)

## Generation Presets
In order to make selecting the AI's various generation settings easier, NovelAI offers several generation presets.

Settings are divided into three categories:

- **User**: Settings you have defined and saved, or imported.
- **Scenario**: Settings that came included in the scenario you imported.
- **Defaults**: Settings designed by NAI testers.

You can **Import** a .preset file, or export the currently selected custom preset in the same format.

Use the ➕ button to create a new preset based on the current generation settings.

Use the ✍ button to edit the preset's name.

***

## Generation Options

These settings allow you to adjust the generation settings to your liking. These get **really technical** so only explore them if you like messing with the finer things. Otherwise, leave them to their defaults; they're usually good as is.

Most of them deal with the **Pool of possible tokens.** To understand what this means, look at these examples:

`Stepping outside, I looked` could result in `up, down, left, right, across, around, fancy` and so on.

`Stepping outside, I looked up at the sun, which was burning` would result in fewer potential matches, such as `hot, bright, with`.

### Randomness (Temperature)

Imagine the next token for a generation comes out of a bag. You shake the bag and pick one. Generally, it's easier to pick out bigger things from the bag, right? If you increase the randomness, then the tokens's probabilities become more and more averaged out, think of it as all the pieces growing or shrinking to be closer to the same size, making it more random.

True to its name, the Randomness setting (or "Temperature") increases the **likelihood of less-expected tokens during text generation**. This works by dividing [**logits**](https://en.wikipedia.org/wiki/Logit) by the Temperature before sampling. In plain English, this means the next part of the sentence will be more unexpected, as elements that have less of a chance of appearing are granted a greater likelihood of being used.

### Output Length

This setting will adjust the **approximate number of characters returned at once by the AI** in each Generation. It shows the amount of tokens that will be returned multiplied by four to show the average amount of characters. The amount of tokens will not always be exact, but will never fall under this number. Up to 20 additional tokens will be generated to attempt to reach the end of a sentence before the generation ends.

As a note, Output length is part of the Context memory. The longer your output length, the less memory you have.

### Repetition Penalty

Going back to the bag metaphor, Repetition Penalty checks for tokens that appear too often and makes them less likely.

Because text generation is based on patterns, repetition is a constant concern. The Repetition Penalty introduces an artificial dampener to the probability of a token depending on the frequency of its appearance in the current context.

As such, increasing this value makes a word **less likely to appear for each time it shows up in the text**. Do take note that this can get really awkward with words that are recurrent in the current context, such as names, or objects being discussed. With high Repetition Penalty, the AI may find itself unable to use a word repeatedly, and will need to substitute it with another which may be inappropriate.*
***

## Sampling

Again with the bag metaphor, Sampling decides what tokens are in the bag to begin with.

### Top-K Sampling

This setting affects the **pool of tokens the AI will pick from** by only selecting the **most likely tokens**, then redistributing the [**probability**] (https://en.wikipedia.org/wiki/Probability) for those that remain. The pool will only contain the *K* most likely tokens. If the setting is set to 10, then your pool will contain the 10 most likely tokens. (Top-10 Sampling), then redistribute 100% of probability across those tokens, based on their relative probabilities.

In plain English, lowering this setting causes more consistent generations at the cost of creativity, by giving the AI less things to pick from.

### Nucleus Sampling

Relating to the previous setting, this adds up the probability of each potential Token, from most likely to least likely until it reaches the value specified. Lowering this value creates a smaller subset of probable Tokens, because the maximum sum will be smaller, so you can add less tokens to the pool before it's full.

In plain English, lowering this setting causes more consistent generations at the cost of creativity.

As an example, if the most likely token has 30% chance, the second 25, the third 20, the fourth 10, the fifth 5, and the sixth 3, and your setting is at 0.9 (90%), then you would do: 30+25+20+10+5 = 90. The sixth most likely token and onwards will be removed from the pool.

### Tail-Free Sampling

A [**tail**](https://en.wikipedia.org/wiki/Probability_distribution) in this context is the least-likely subset of Tokens to be chosen in a Generation. This alternative sampling method works by trimming **the least-likely tokens by searching for the estimated tail's probability**, removing that tail to the best of its ability, then re-[**normalizing**](https://en.wikipedia.org/wiki/Normalization_(statistics)) the remaining sample.

This method may have a smaller impact on creativity while maintaining consistency. However, take note that it tends to behave strangely if your context does not contain a lot of data.

Consider the setting as "how much you want to keep". High settings lead to larger token pools.

### Top-A Sampling

Top-A considers the **probability** of **the most likely Token**, and sets a *limit* based on its percentage. After this, remaining tokens are compared to this limit. If their probability is too low, they are removed from the pool.

The calculation is as follows: `limit = max(token_probs)^2 * A.`

Increasing A results in a stricter limit. Lowering A results in a looser limit.

This means that if the top token has a moderate likelihood of appearing, the pool of possibilities will be large. On the other hand, if the top token has a very high likelihood of appearing, then the pool will be 1-3 tokens at most. This ensures that structure remains solid, and focuses creative output in areas where it is actually wanted.

### Top-G Sampling

This specifically applies tp **Kayra**, as this model "groups" tokens in tiers of probabilities, rather than spreading them smoothly like. Top-G is similar to Top-K, but instead of limiting the pool to K tokens, it limits the pool to G groups of tokens. Effectively it's telling the model that your staircase has *G* steps.

### Typical Sampling

Typical Sampling is complicated to explain, as it uses an advanced concept known as [conditional entropy](https://en.wikipedia.org/wiki/Conditional_entropy). It calculates an entropy average, shifts the probabilities of tokens, and then checks which values shifted the most. Those are removed from the pool.

Typical is atypical compared to other sampling methods, as it cuts *both likely and unlikely tokens*, based on their deviation from the expected base line of entropy. Extremes are considered by the math behind the sampling to be too "random" or "noisy", and thus carrying less "information".

Lowering the value makes the thresholds for cutting off tokens harsher. Increasing it loosens the thresholds, allowing for more tokens.

### CFG Scale

**Classifier Free Guidance** is a type of [guidance](https://arxiv.org/abs/2306.17806) which relies on a "negative prompt". You may have noticed something similar in the image generation part of NovelAI with "Unwanted Content". The implementation is comparable but not identical, for text. Using CFG at all will double generation time. You do not need to provide a negative prompt, but if you do, write something that is completely in the wrong style and uses words you don't want to see. Effectively, your negative prompt should be the antithesis of your actual writing. The stronger the **Scale** parameter, the stronger the guidance.

### Mirostat

Mirostat is an advanced sampler which has a very strong effect on its own. It is strongly recommended you keep other samplers to a minimum to make its effect more appreciable.

Rather than simply limit the pool of tokens, Mirostat attempts to direct that pool to be representative of the text's expected complexity. 

**Tau** represents that level. High Tau will aim for higher complexity, while low Tau will aim for simpler output. 

**Learning Rate** is the influence of your context. The higher it is set, the more gradual the changes will be. 1 is instantaneous.

### Change Settings Order

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/9f968541-c864-4266-9e63-7737f7e94ba8)


Allows you to enable or disable sampling types, as well as select the order in which they are processed.

***

## Repetition Penalty

Repetition Penalty is applied to the probability of tokens when they appear in context. This is to avoid generation loops, or overuse of single terms. On the flipside, penalizing important words too heavily when they are important and expected to show up regularly can have odd side effects.

### Repetition Whitelist

A default whitelist is offered, which ignores most grammatical terms, modal verbs, possessive contractions, etc. This can help prevent grammatical collapse if repetition penalty is strong.

As of 2023/07/10, the tokens in the whitelist are:
"'", '"', ',', ':', '\n', 've', 's', 't', 'n', 'd', 'll', 're', 'm', '-', '*', ')', ' the', ' a', ' an', ' and', ' or', ' not', ' no', ' is', ' was', ' were', ' did', ' does', ' isn', ' wasn', ' weren', ' didn', ' doesn', ' him', ' her', ' his', ' hers', ' their', ' its', ' could', ' couldn', ' should', ' shouldn', ' would', ' wouldn', ' have', ' haven', ' had', ' hadn', ' has', ' hasn', ' can', ' cannot', ' are', ' aren', ' will', ' won', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '."', ',"', '====', and ' '. 
The list may change in the future.

### Repetition Penalty Range

Defines the number of tokens that will be checked for repetitions, starting from the last token generated. The larger the range, the more
tokens are checked.

#### Dynamic Penalty Range

When **Enabled**, the Repetition Penalty is **only applied to the story.** All text injections (Lorebook, Author's Note, Memory, Ephemeral Context) will be *ignored* for the purposes of repetition penalty.

### Repetition Penalty Slope

The penalty to repeated tokens is applied differently based on distance from the final token. The distribution of that penalty follows a S-shaped curve. If the sloping is set to 0, that curve will be completely flat. All tokens will be penalized equally. If it is set to a very high value, it'll act more like two steps: Early tokens will receive little to no penalty, but later ones will be considerably penalized.

## Phrase Repetition Penalty

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/b8a714b9-21fb-4317-997b-e93033aba0de)

Phrase Repetition Penalty, or **PRP** is a system similar to Repetition Penalty, but it penalizes **sequences of tokens** as opposed to single tokens. This helps prevent repetition at the scale of the clause or sentence, or even paragraph, preventing large-scale loops from happening without causing unwanted divergence at the smaller scale. By default, this is set to Very Light, but if your preset has **no** Repetition Penalty, you should set this to a high value, as it is fairly weak on its own.

**You can combine both Phrase and normal Repetition Penalty.**

## Alternative Repetition Penalty

*Note: ARP has an extremely strong effect and can make your output strange if not set to relatively low values.*

Alternate Repetition Penalty uses two parameters: *Presence* and *Frequency*. 

The math is as follows: 
``` (Number of times the token appears in the range * Frequency) + Presence = Penalty Intensity ```

*Frequency* penalizes recurring tokens with an increasing intensity for each occurence.
*Presence* penalizes all tokens that are present even once with the same intensity.

You can mix this with PRP and normal repetition penalty, but this is not recommended, as ARP is very strong on its own.
