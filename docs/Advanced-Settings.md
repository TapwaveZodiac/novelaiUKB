![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/230c9043-56d6-44a1-8491-bf97dab4e5d8)

## Context

Tools relative to [Context](Context). Explained on the corresponding page.

## Phrase Bias

**Phrase Bias** allows you to tell the AI to **increase** or **decrease** the probability of single or groups of **tokens**. You may have 1024 biases enabled at once. Any extra will cause generation to fail.

Rather than ban tokens outright, this is meant to nudge the model in the right direction, or avoid specific words from showing up too often, without removing them entirely.

**Keep in mind that Phrase Bias is case sensitive.** However, a variation of the first token with a space (as in, "text" and " text") will be considered, even if you do not specify it. (This does not apply if the tokens are ;, :, \<, \>, &, @, \#, %, ^, \n, and the entire range of unicode characters from u3000-u9faf and uff00-uff9f.)

Bias is collected in **Groups** with a certain **Bias Level**, which is applied to all phrases and tokens put in the **Group**.

To create a new **Bias Group**, click the ➕ button. The currently selected group can be deleted by clicking 🗑️.

To enter a new phrase or token in the Group, enter it in the text box and press Enter.

If you wish to insert token IDs (such as \[198\] for newlines), encase their numerical ID in **Square Brackets: \[\]**

If you wish to insert the exact input, as is, case sensitive and with exact spacing, encase in **Curly Braces {}**.

**Bias Level** is a *non-linear Scale* from -2 (less likely) to +2 (more likely). This means the strength of the bias increases faster the higher its value: -2 is **much stronger** than simply "twice less likely than -1". The opposite is true for +1 and +2. A bias of **-0.1 to +0.1**, usually lower, works well for most uses cases.

### **Ensure Completion After Start**

If checked, the AI will make sure **Phrases** are completed if their first token is generated.

For example, if you've given a positive bias to the phrase "blue business suit" with this function turned **off**, the AI might start generating outputs featuring blue lights, blue planets, or people with blue eyes. With Ensure Completion After Start turned **on**, the word "blue" will *always* be followed by the phrase "business suit".

### **Unbias after Generation**

If checked, the AI will disable the bias for the remainder of the generation once it has been applied once. Following the previous example, the first instance of "blue" will output "blue business suit", but all following instances will work as normal.

## Ban Token

Any Tokens added here will **have their probability reduced to zero**. This means they **will not appear in Generations**. As this adjusts the relationships between Tokens, this will have an impact on the phrasing chosen by the AI. Be careful about what you ban, because this can cause some very strange wording to be generated if used incorrectly.

When you add a new token to the banlist, it will also check for any variations in case, and the token with a preceding space as well. (Just like Phrase Bias does.)

To prevent that from happening, and exclusively ban this token, add **curly braces** { } around the token you want to ban before pressing enter. You may have 2048 bans at once, any extra will cause generation to fail.

### Banned Tokens

Relating to the previous setting, this field **shows every Token currently blacklisted** for generation. Clicking one of these tokens will remove it from the list.

If you inserted an exclusive token (using curly braces), it will be displayed with brackets around it.

### Ban Bracket Generation

At times, you may wish to include hints to the AI that are **not to be considered part of the story**. These can be encapsulated in **square brackets** (\[ and \]) to signal it is part of the **Current Context** while not being considered part of the actual *text* of the story.

These "stage directions" are further detailed in the First Story guide. For more information on what to put between square brackets, see **[Keeping Track](Advanced Writing#Keeping Track)**.

## Stop Sequence

If you wish to end your Generations upon reaching a specific Token, simply add it to this field. Doing so will cause the Generation to **end prematurely upon generating the Token**.

If you use periods, this will stop generations at the end of sentences. With something like ">" you can use it to make the AI stop when it's "your turn".

### Min Output Length

This adjusts the **minimum number of Tokens returned by the AI before having a chance to generate the Stop token.** It will never be below this target, but may exceed it.
