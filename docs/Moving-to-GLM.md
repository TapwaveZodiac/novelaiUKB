# Changes from Previous Models to GLM

This page serves as an inventory of major changes from Erato/Kayra to GLM 4.5.
*with contributions from DLTyrus*

# Additions

## Instructions

GLM must have an instruction active at all times. If your context is empty, the default is `Write a story, or perhaps a poem.`. If it has any content, this becomes `Write.` This is always in effect in System space (see Attribution Blocks below).

You can change this instruction by having the **very first paragraph of your story** contain an {-initiated instruction, which will overwrite the default instruction.

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

You can add them yourself, but in this case you **must build the whole context manully**, including *not including /nothink*. This means none of the text injection (lorebook, memory, etc) are used *at all*, you must put them in and categorize them yourself.

# Changes

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
Author's note #3 paragraphs from bottom
Contextual Lorebooks (including "always True") #inserted aligned to a newline at ~8000? characters from the bottom
<|assistant|>
Prefill #1 paragraph from bottom
Story
***
```

Note: Order will be different if your context window has too little story text.
Contextual lorebooks may be present before or after the Author's Note depending on the size of your paragraphs.

## Lorebook

The default search range for Lorebook keys is now 4000 characters of story text starting from the bottom.

Entries are likely ordered by **creation date**, so if ordering is important, just duplicate them in the order you want them to appear.

The system is told to understand ---- as a separator in the default system prompt, but you can change that if you want.

Most of the lorebook settings, such as positioning and ordering, are now gone. Instead you have **conditional entries**, which use any combination of these conditions:
• True: Always returns TRUE.
• Keyword Match: Looks for keys like in the good old days, returns TRUE if key is found in the search range.
• Lorebook Entry Active: Checks if the specified lorebook entry has been activated and returns TRUE if it is.
• AND group: Checks if all contained conditions are true, then returns TRUE if they are.
• OR group: Checks if any contained conditions are true, then returns TRUE if they are.
• NOT: Returns TRUE but if the contained conditions are true, returns FALSE.

The model checks if *any* of the top-level conditions are TRUE in order to activate the entry. If you have a TRUE as a top level condition, it's effectively always on, just positioned differently.
