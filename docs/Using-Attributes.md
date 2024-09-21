# The Attributes Method

When trying your hand at constructing a Lorebook, you may have been directed towards the "Attributes Method". We have touched upon it lightly in the Starter guide. This page seeks to explain it in further detail, so that you can feel more confident creating your entries.

## The purpose of Attributes

The idea behind the Attributes method is to simplify the organization of ideas used to describe elements of your story. While it was mostly designed with characters in mind, **Attributes can be used for virtually anything.** By using an Attributes framework, you can use the training of NovelAI's models to your advantage, as it is used in their finetune material.

## Building Attribute entries

An Attributes entry is assembled from three elements:

• **Separators**, usually four dashes (----), **followed by a line break**, are positioned at the beginning and end of the entry to signal that it contains "data" as opposed to story. The final entry generally does not need one, as you'll likely have a dinkus around there instead.

• **Title and short description**, immediately after the starting separator. Start with the name of the character or element, and a very succint description. e.g `Shadowheart, follower of Shar`

• **Attributes**, which are a *header*, followed by a *colon* (:), and one or multiple sentences. A single attribute is a **single paragraph**, with each attribute starting on a new line. Attribute titles can be one word, multiple words, or words with a contained adjective, e.g `Beliefs (hidden):`.

### Ordering Attributes

Attributes can be in any order, as long as you keep it consistent between entries of the same type. However, some entries are notable exceptions.

Positioned at the **beginning** of the entry, immediately after the title, should be:

• `AKA:` which provides alternate names for the element. This is also where alternate Lorebook **keys** should be specified.

• `Type:` which specifies what type of element it is. (e.g person, place, faction; just like in the Lore Generator's categories, but you can improvise.)

• `Setting:` which specifies which setting the element is from, in case you are doing a crossover story, or want to specify the tone of the entry.

Positioned at the **end** of the entry, before the closing separator, should be:

• `Summary:` which provides a short synthetic blurb about the entry.

• `Quote:` which gives example dialogue for elements that speak, multiple can be provided.

• A prose block can be added at the very end of the entry as well, if you feel further detail is needed.

### Writing Attributes

Attributes can be written in any style you like, though it is important to focus on making your entries **stylistically consistent**, as well as **containing clear, easily understood information**. Its purpose is to influence generations, so make sure you convey your ideas in a way that the model can understand.

As a default, write attributes as **a list of individual words** separated by **commas**, with the intent of conjuring the correct "vibe" for that attribute. More verbose entries can lead to more verbose prose in response, but this will impact your token budget.

For convenience, you can set up a blank entry that has no keys and only contains the starting separator and headers you frequently use. **It is not necessary to put in an ending separator**, as it will incidentally be included when multiple entries are present back-to-back. Once done, you can duplicate and fill the entry as you create new elements.
