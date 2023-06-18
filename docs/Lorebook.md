
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/1bfa191e-4687-401d-882c-071faf74f52c)

The Lorebook allows you to create entries for **specific elements in your story**. This helps the AI have more information about characters, places, items, concepts and so on.

Click the **📗 button** on the input bar, or in the "Lorebook Quick Access" area of the Story tab on the right, to open the main lorebook window.

You can import a Lorebook file by clicking the 📥 **Import** button at the top left. Once you're done you can export with 📤 **Export**. The 🖼️ icon lets you create a **lorebook embedded in an image**.

Click the **funnel** icon to sort entries alphabetically or by timestamp.

Click the **🔎** icon to perform a search.

#### Basics

Click **➕ Add Entry** to create a new entry. Only the *content* and settings are read by the AI. The entry name is just an identifier.

You will be presented with this window:

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/d282d815-2e83-425b-a2f4-1e5d41b65c6b)

***

#### Entries

A lore entry is composed of two main elements: **Entry Text** and **Keys**.

The **Entry Text** is what will be injected into the context window when a **Key** is triggered. Balancing out the density of this content with the remaining space in your context window is important.

The **Default Settings** will be applied to all new entries, but they can be changed after creation.

You can mass-select entries with the checkbox ☑️ to **delete** 🗑️, **export** 📤, or **export to image** 🖼️ several entries at once.

#### Keys

**Enabled** determines if the entry will be inserted in the context if detected. If it is disabled, it won't trigger regardless of keys. This is useful to reduce context cluttering if you don't need details about specific things.

**Keys** are all the **words that the AI will associate with this entry.** If the AI reads this word, then the connected entry will be inserted in the context. Keys are *case insensitive.*

Type the key and press **Enter** to register it. Keys are **case insensitive by default.**

To make a Key case-sensitive, preface it with `/` and close it by `/`: `/Entry/`.

If it is part of a placeholder, add a **\$** at the very beginning before the first dash.

#### Lore Generation

Click the 💡 **Generate** button to enter the [Lore Generator](Lorebook.html#Lore_Generator).

***

## Categories

Click **➕ Add Category** to create a new category.

Categories allow you to organize Lorebook Entries, but also create a **Subcontext**. You can define default settings for all entries in the category as well.

A subcontext is basically a *block* in the main, complete context. All entries of the category will be inserted, then organized according to their settings, *in this block only*. This helps reduce "spreading out data" by packing similar information together.

The entries' individual placement settings will be applied **relative to other entries in the block only.** i.e If an entry has an placement position of -2 newlines, it will be inserted 2 newlines *before the last line of the last inserted entry in the subcontext block.*

The entire subcontext is then inserted as one block according to its own placement settings.

This is useful if you want to lump a certain type of entries together, or use something like Scaffolding where every type of content has its own settings.

## Placement Tab

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/590c999c-2c04-4276-a5a2-abac1d10c16e)

Accessed by clicking the **Placement** tab. If this tab is active, you can click **Dock Active Tab to the Side** to make it show up at all
times. Click **Undock** to remove it.

- **Search Range:** Determines how many characters of text will be read by the AI when it looks for lorebook keys.
- **Force Activation:** If turned *ON*, the entry will ALWAYS be in the context (if it can fit in there).
- **Key-Relative Insertion:** By default, Lorebook Entries are inserted relative to the top, or the bottom of the text, see **Insertion Position.** When this toggle is *ON*, entries are inserted relative to the **last occurrence of the Key found in the context.**
- **Cascading Activation:** When *ON*, this entry will also look for its keys in **other Lorebook entries, the Memory, and the Author's note.** Search Range will be disregarded if this toggle is *ON*.
- **Prefix & Suffix:** These two are intended to work in tandem to allow for lengthier entries without losing coherence when the entry is
  trimmed. For example, you could add the **[prefix](https://en.wikipedia.org/wiki/Prefix)** `[` and the **[suffix](https://en.wikipedia.org/wiki/Suffix)** `]` to encapsulate the entirety of your entry despite trimming. If your entry read as  `Winston is a good soldier. Works well under pressure. Likes bunnies.`, and the *last* sentence was trimmed, it would still read as `[Winston is a good soldier. Works well under pressure.]` despite the end of the entry being trimmed - your **prefix** and **suffix** still remain.

You may also use a `\n` (a **newline marker**), which helps isolate the entry further by separating it with a full newline.

- **Token Budget:** Keeps this number of tokens in the context window for this entry. *This will overwrite other content if necessary!* It's recommended to set it a litter lower than the entry's full size.
- **Insertion Order:** The higher this number, the earlier the entry is processed. Entries with a low value may be dropped to save space for those with a higher value. If you have three entries, with order *500,0 and -500*, they will be processed from highest (500) to lowest (-500).
- **Insertion Position:** How far *from the top* (if positive) or *the bottom* (if negative) will the entry be inserted in the window. The unit is defined in **Insertion Type**. It can be a number of **tokens**, **sentences**, and **newlines**.

As an example, if you set it to **-3 Newline**, then it will insert the entry's text *as soon as it finds the third newline, reading back from the bottom of the window.* -1 will mean it is always placed at the very bottom of the Context, just as *positive* 1 will always place it at the very top of the Context. 0 will always be the very top.

- **Trim Direction:** If the entry needs to be inserted partially due to lack of room in the context window, should it trim from the beginning towards the end, (top) end towards the beginning, (bottom) or omit the entire entry if it can't fit fully (Do Not Trim)?

**Attention:** If an entry is inserted after a subcontext, then it may insert itself *into that subcontext's text area.*

## Lorebook Phrase Bias

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/1c801ad6-9d4f-4945-8215-a14cb70210ed)

If this tab is active, you can click **Dock Active Tab to the Side** to make it show up at all times. Click **Undock** to remove it.

Explained in [Phrase Bias](Generation-Settings.html#Phrase_Bias), although this has an extra setting: *When Entry Inactive*, which enables the biases **if the entry is not active!** This can help activate things randomly, such as monster encounters.

Phrase biases in entries can otherwise be used to favor nicknames for a person (such as referring to their job, or a shorthand), and terms relative to them.

***

# Lore Generator

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/610c71e1-c780-4aec-8aae-bb6e883168c9)

The **Lore Generator** is a powerful tool that allows you to generate Lore for several types of objects, people, and concepts.

First, **select a type from the dropdown,** choosing one that fits the type of content you want generated. They may appear a little broad, so see which is the closest fit.

If you need the AI to be aware of elements in the **Story**, **Memory**, **Author's Note**, or **Lorebook**, open **Add Context (Advanced)**, and tick their respective boxes or enter **Keys** that will activate **Lorebook Entries** that you want the AI to be aware of when you generate the Lore Entry.

Once you are ready, type into **Input Text**:

- **The Name of the element you want generated (or a short description)**
- **Pointers, in parentheses, separated by commas.**

Here is an example:

```
Type selected: Concept
FTL Travel (Space Folding, Instantaneous)
```

Press ▶ or **Ctrl/Cmd⌘+Enter** to generate. Click 🔃 to retry the last generation. You can freely edit the text, and keep generating, just like in the main text editor!

**Generation History** is similar to the **Redo Tree**, displaying the last generations *for all entries*. The list is purged on refresh.

