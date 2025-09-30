# Changes from Previous Models to GLM

This page serves as an inventory of major changes from Erato/Kayra to GLM 4.5.

*with contributions from DLTyrus and MousAI*

# Additions

## Instructions

GLM must have an instruction active at all times. To decide the default behavior, first the story text is split into user and assistant messages.

* If there are no messages, add a user message with the text "Write a story, or perhaps a poem."
* If the first message isn't a user message, add one with the text "Write."
* If the context size is sufficiently long, an user message containing "Continue." is also added (see below, in the Context Building section).

You can change this instruction by having the **very first paragraph of your story** contain an {-initiated instruction, which will overwrite the default instruction. Keep in mind that once it exits context, it stops applying. Use Author's Note instead at this point.

## Attribution blocks

There are three types of attribution for GLM. <|user|>, <|system|>, and <|assistant|>.
Blocks are declared and are concluded whenever another one is declared. Every block declaration **must be followed by a new line**. You can declare the next block at the end of a paragraph, i.e
```
foobar<|user|>
do as I say my peon<|assistant|>
yes my mamster
```

**User** blocks are initiated by writing instructions like you would for Kayra or Erato, by starting a paragraph with an opening curly brace {. You don't need to close it. **Memory** and **Always On Lorebook Entries** are in user block by default.

**System** blocks are used for the system prompt and the author's note, as well as **Conditional Lorebook Entries**.

**Assistant** is everything the model produces.

## gMASK & sop
[gMASK]`<sop>` are a pair of reserved markers which must be kept together.

You can add them yourself, but in this case you **must build the whole context manully**, including *not including /nothink*. This means none of the text injection (lorebook, memory, etc) are used *at all*, you must put them in and categorize them yourself. This can be used to create a 100% predictable and fixed context where everything is manually positioned.

## /nothink and the Think block

GLM has thinking capabilities (this is similar to what Gemini does, for instance). However they are disabled in NAI's output by the inclusion of **/nothink** before *every Assistant block*. You can force-enable them by manually building context using the method above.

# Changes

## Formatting
All paragraphs are now separed by double linebreaks. All single linebreaks are automatically converted to doubles. This is intentional.

## Sampling
Most sampling parameters are gone, leaving only randomness, topk and nucleus. You cannot reorder them.

## Context
### Window
The model can see the initial 36K tokens of context. Once this amount is reached, the "rolling" begins.

First, the topmost 8K tokens are removed, the context window's boundaries are now  8K to 44K. (Even if you haven't reached 44K yet.) Once you reach that 44K tokens, the 8K topmost tokens are once again removed. The window is once again moved by 8K, so 16K to 52K.

Each time you reach a 8K boundary, the window shift. It doesn't shift with every addition to the context, only in these 8K steps. This facilitates caching since the context gets pretty big after a while.
### Ordering
The context window is now ordered this way:
```
[gMASK]<sop><|system|>
System Prompt
<|user|>
Memory #under "Relevant persistent information:"
Always-On Lorebooks
***
Write. + /nothink #This is a default instruction. If you provide one it'll be replaced by yours.
<|system|>
Author's note #3 paragraphs from bottom
<|assistant|>
Story
<|system|>
Author's note #4 newlines from bottom
Contextual Lorebooks (including "always True") #inserted aligned to a newline at ~8000? characters from the bottom
<|assistant|>
Prefill #1 paragraph from bottom
Story
***
```

Note: Order will be different if your context window has too little story text.
Contextual lorebooks may be present before or after the Author's Note depending on the size of your paragraphs.

The rules followed by the model, in more detail, are as such:
```
If we've been given lorebook entries to add, for any nonpermanent lore, add them as a system message at 8,000 assistant message characters from the bottom, aligned to a newline, snapping to a nearby message boundary if close to one.
If we've been given an author's note, add it as a system message 4 lines or 800 assistant message characters from the bottom, whichever is higher, aligned to a newline, snapping to a nearby message boundary if close to one.
If the last message is an assistant message and > 8,000 characters long, insert a user message reading "Continue." 2000 characters up, aligned to a newline.
If the last message is an assistant message, prepend the prefill text to it.
If the last message is not an assistant message, add an assistant message with the prefill.
If we've been given memory or any permanent lore entries, prepend them to the first user message.
```

## Lorebook

The default search range for Lorebook keys is now 150,000 characters of story text starting from the bottom, for normal entries. 4K for special conditional keys, but this can be increased.

Entries are likely ordered by **creation date**, so if ordering is important, just duplicate them in the order you want them to appear.

The system is told to understand ---- as a separator in the default system prompt, but you can change that if you want.

### Lorebook Settings
Most of the lorebook settings, such as positioning and ordering, are now gone. Instead you have **conditional entries**, which use any combination of these conditions:
* True: Always returns TRUE.
* Keyword Match: Looks for keys like in the good old days, returns TRUE if key is found in the search range.
* Lorebook Entry Active: Checks if the specified lorebook entry has been activated and returns TRUE if it is.
* AND group: Checks if all contained conditions are true, then returns TRUE if they are.
* OR group: Checks if any contained conditions are true, then returns TRUE if they are.
* NOT: Returns TRUE but if the contained conditions are true, returns FALSE.

The model checks if *any* of the top-level conditions are TRUE in order to activate the entry. If you have a TRUE as a top level condition, it's effectively always on, just positioned differently.
