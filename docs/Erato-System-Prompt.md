*Guide written by Belverk also known as Valahraban*

## Definition

System prompt: System prompts are a set of instructions, guidelines, and contextual information provided to AI models before they engage with user queries.

Erato is an Anlatan finetune of the Meta Llama 3.0 70B model using the llama3-tokenizer. It uses the base open weights of Llama 3. Anlatan used traditional completion-style training for Erato and therefore the model should not be mistaken for what are colloquially called **Instruct-models**. The concept of system prompts however can be applied to any kind of text transformer.

It is likely that the base Llama 3 used some form of system prompting in base training, and it is known that Google's Gemini 1.0 and Gemmam models do something like it without a distinct system role.

NovelAI uses a form of system prompting. This is known as the [ATTG](https://docs.novelai.net/text/specialsymbols.html#-spaced-bracketing-) (Author, Title, Tags, Genre). Ever since at least Clio and Kayra, effort has been put in to make sure in training ATTG is trained first before the text that follows it. For Erato this is ATTG plus the newly added **S** value. All of this should be a lorebook entry, placed at the very beginning of context. An example Erato system prompt (ATTG) would look something like `[ Author: Jacqueline Carey; Title: Amazing Story; Tags: adventure, modern day; Genre: contemporary fiction, prose ][ S: 4 ]`

Illustrated with pictures inside NAI UI: [ref12]

By making guesses about how base L3 interacts with Anlatan's training and experimenting, we can build an even more powerful system prompting system. This is what this guide is about. Results may vary, readers will have to take Belverk's and his few testers word for it resulting in "great tier output, where the narrator closely follows rules provided by the writer". The goal is setting up a system that uses few tokens, while giving the user an easy way to come up with rules that direct the "narrator" of the outputted content, the narrator here being synonymous with the model.

## Extended Erato System Prompt

It is recommended that everything explained here is set up inside lorebooks and categories. For users who already have their own lorebooks or category system, these are easy to add without getting in the way. Correct insertion order is the one important thing for what we are trying to achieve. We want the ATTG lorebook to be the first thing the model ever sees, immediately followed by the Lore of Lorebooks, then Rules (optional) and finally the rest of your LBs. ATTG does not use a prefix. LoL, the Rules and most other LBs will use `----\n` as the prefix.

I recommend to set up ATTG at Insertion Order 1 and Insertion Position 0 (shown in previous pictures). The example provided in this article could be used as the entry. Recommended values for S range from 2-4 as per datasetter Zaltys' recommendation, due to how much data Erato was trained on.

Set up a category called something like `INSTRUCTIONS`, ordering your categories however you prefer. Turn on default entry settings. Only add `----\n` to prefix, increase reserved tokens to 1000, insertion order 2, insertion position 0. Now you can add lorebooks inside this category and they will have the correct settings.

Here I provide what I call the `Lore of Lorebooks` or `LoL` for short. You can name the entry whatever you want. I gave it this name, because inside it we define *what a Lore is*. Under this system, every LB you provide is Lore, while the story text is called `the narrative` and whoever is writing is called `the narrator`. MAKE SURE THAT THE ATTG AND THIS LB IS ALWAYS ON.
```
Lore
Type: information, knowledge, instructions
Description: Lore is any information pertinent to the story. Lore entries are separated by ---- . Any noteworthy or relevant concept can be detailed with Lore, including character sheets or instructions for the narrator. Lore can be a list of attributes, or a paragraph. It is important to respect and accurately portray any details included in Lore, and use the knowledge within to enrich the story and the interaction between characters. This entry is an example of a Lore entry in the pedia style.
```
[ref3]

Using the [Attributes](https://tapwavezodiac.github.io/novelaiUKB/Using-Attributes.html) format present in Anlatan's dataset, we define what Lore is, what Lore contains and what the ideal separator is. We do not need to define dinkus, the model already understands these and other concepts. We make a reference to the pedia style, because inside dataset Tags, some data that is written similar to this is referred to as pedia. Belverk can confirm this because he used to contribute pedia-style data. Attributes and pedia can be treated synonymously for our purposes.

The above lorebook is not very useful on its own. But it becomes very powerful if we give the narrator rules to follow and use one or more world building related LBs. Inside the category we set up previously, let's add another LB. We can call it `Rules`. In order to ensure that Rules goes immediately below `Lore`, we have to manually increment Insertion Order to 3. The Rules can be anything we want. Personally, I use it to enforce the person and the tense the story is written in. It could also be used to enforce text adventure. With this system, we could write all our other LBs in present tense Attributes and/or prose without ever confusing Erato. I haven't gotten a single tense error in multiple 200,000 character stories with this setup.
```
Narrative rules
Type: narrative, rules, instructions
This Lore describes rules that the narrative storytelling will abide by. Regardless of how Lore is structured, the story is written in third person, past tense.
1. The story takes place in mythical times. Electricity is unheard of and does not feature in the narrative.
```
[ref4]

Numbered list works best in my experience, you could also do a bullet list with `- `. The structure is a combination of markdown and finetuned elements, both of which Erato is great at. I only included one common rule, because users have to set their own rules depending on what they want out of each story. From my experiments, I know that using rules you can completely ban dating, turn a main character completely mute, re-create text adventure in storyteller mode, set any level of desired technology, as well as stop the narrator from mentioning LB knowledge directly. It is powerful with diverse uses. This is why I call this structure the Erato System Prompt. You can set up however many Rule LBs you want, even with keys to turn them on or off. In regular use, I only have an ATTG + Score + LoL + Rules, always turned on. Note that the extended system prompt replaces the short summary/synopsis of the story.
