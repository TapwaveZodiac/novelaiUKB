# Changes from Previous Models to GLM

This page serves as an inventory of major changes from Erato/Kayra to GLM 4.5.
*with contributions from DLTyrus*

# Additions

## Instructions

There are three types of attribution for GLM. <|user|>, <|system|>, and <|assistant|> 

**User** blocks are initiated by writing instructions like you would for Kayra or Erato, by starting a paragraph with an opening curly brace {. You don't need to close it. **Memory** and **Always On Lorebook Entries** are in user block by default.

**System** blocks are used for the system prompt and the author's note, as well as **Conditional Lorebook Entries**.

**Assistant** is everything the model produces.

## gMASK<sop>
[gMASK]<sop> are a pair of reserved markers. You can add them yourself, but in this case you **must build the whole context manully**, including *not including /nothink*.
This means none of the text injection (lorebook, memory, etc) are used *at all*, you must put them in and categorize them yourself.

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
Contextual Lorebooks (including "always True")
<|assistant|>
<think></think>
Prefill #1 paragraph from bottom
Story
***
```

Note: AN will be before Memory if your context window has no story text.

## Lorebook

The default search range for Lorebook keys is now 150,000 characters of story text starting from the bottom.

Most of the lorebook settings, such as positioning and ordering, are now gone. The system is told to understand ---- as a separator in the default system prompt, but you can change that if you want.
