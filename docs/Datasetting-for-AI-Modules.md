## Dataset Cleaning Guidelines

**Preparation of a clean dataset is the most important factor in the
creation of a proper AI Module**. Simply scraping a wiki or throwing
together some PDF conversions is vastly insufficient and will at best
result in suboptimal outputs riddled with leaked symbols, odd spacing,
and circular repetition.

Luckily cleaning your dataset is not difficult, only time-consuming.
Assuming you have the patience and follow these guidelines, you too can
create high quality AI modules.

### General Overview

*Dataset files should be...*
Plain text in UTF-8 encoded `.txt` format with no tags/markdown/html,
instead focusing on standard-formatted English prose.

**One paragraph per newline**. That is, no paragraphs should be split
onto multiple lines. To visualize this, it helps to enable Word Wrapping
on whatever text editor you are using (in Notepad++ this done by
checking View > Word Wrap).

**No empty newlines**. There should be no empty rows left in the data.
For chapter and scene breaks, it is recommend that you instead use `***`
on its own row.

**Check the newline style**. NovelAI is trained on the standard `n`,
but Windows apps tend to default to `rn`. The latter will function
worse than `n`, so it is recommended to fix this if you use Windows for
editing. As the difference is not visually apparent, you can check the
usage by searching for regex /`rn`/.

**Do not leave any leading/trailing space, tabs or other whitespace**.
This includes checking for any spaces after the end of a sentence before
a newline.

**Use regular single and double quotation characters** (`"` and `'`) not
the fancy ones (`❝` and `❜`). The AI is trained using the former and
thus will not use the latter properly.

**Try to focus in on only one specific subject matter** and ensure all
included material is focused on what your module should achieve in terms
of what you expect from its output. This process necessitates nuance,
not stuffing as much as you can into your dataset. Keep in mind this can
be tricky, as for example some Steampunk novels don't actually talk all
that much about the type of content one would relate to the Steampunk
genre and thus in practice it is not very effective using them to train
a "Steampunk" module.

**A little data goes a long way**. 1MB to 5MB still provides excellent
results for an authorial or thematic style assuming you provide it
enough training steps. On this note, feel free to experiment with short
data in general. There is nothing stopping you from turning a short
prompt into a module, and this would also require much fewer training
steps (perhaps within the range of 50-100 for a typical scenario
prompt).

If you want to avoid the same characters appearing constantly or other
forms of overfitting, **try to keep the data balanced with a variety of
names, phrases, and terms** by including stories featuring different
characters or locations.

**Do not expect a module to memorize relational/factual data**. For
instance if you feed it data containing Pokémon descriptions, it'll
recognize the species but will randomly mix up their types, moves,
appearance, and other data.

**The format of the data matters**. If you want the module to generate
prose, train it on prose. Avoid training on wikis or other encyclopedic
data, unless you've set out to create an utility module such as a
random generator. (Example: Training a module on tabletop RPG style
monster data blocks will result in a module that generates random
creatures in that style.)

### Cleaning Headings & Auxiliary Sections

Before anything else, it is important to note that *discretion is key
here*, as you typically want to be as *least* destructive to your data
as possible, considering how easy it is to completely ruin your data
with a single misguided Find and Replace. Unless you want to see them
leaked in the AI's output, **make sure to remove Fore/Afterwords,
Acknowledgements, Author's Notes, About the Authors, and any other
sections that have nothing to do with the story or data**. This also
includes any author commentary or excerpts *unless* it is diagetic to
(takes place within the narrative of) the story.

Chapter titles can be replaced with `***` alone on a newline to signify
breaks between chapters or `⁂` for breaks between individual short
stories as these are conventions of the base training data and the AI is
used to working with them. If the chapter titles seem useful (instead of
just `Chapter #`) you can instead opt to keep them by enclosing them in
square brackets (`[ Title ]`).

`----` is used instead of `***` if the text directly after it consists
of data such as glossaries, timelines, Attributes style, or other
non-prose.

In general it is a good idea to remove, replace, or trim down anything
too repetitive (such as numbered chapters, titles that use the same
prefixes, or stylistic phrases like `<ERROR>` repeated twenty
times in a row) as this will increase the chance of these leaking into
your output. That said, if you find yourself removing too much from a
work it might just be a better idea to exclude it from your dataset
altogether.

### Cleaning Prose

**Keep an eye out for odd symbols**, characters, or other unusual
formatting such as odd card suits or other symbols used as chapter
breaks (`●, ■, ✽, ᚖ, ♣, ◇, ◆, †`) or Japanese quotations (`『` and `』`)
which are often found in visual novels (and can be replaced with regular
quotations). Sometimes even the replacement character () can be found;
this is usually a sign that something's gone badly wrong with the file
conversion.

On this note, often times scanning a book to a digital copy certain
formatting will produce errors or won't scan correctly. You can see
examples of this occasionally with underscores such as from OCR software
reading `...` as `___` or for things like *telepathic dialogue
communication, which is typically italicized*, but since raw text has no
characters for italics, they will appear as __dialogue encapsulated by
underscores like this__ which need to be replaced with quotations or
angled brackets (`<` and `>`) as the AI knows to associate them with
non-verbal dialogue.

**Another common scanning issue is having chapters start in all
uppercase capital letters** (ie.
`TUESDAY MARKED THE beginning of the end`) or with the first letter of
the first word separated from the rest of the word (ie.
`T uesday marked the beginning of the end`).

**Extra spacing** is yet another common issue such as with possessive
indicators (ie. `It was Mark 's dog`) or at the end of sentences before
a newline. On that note extra newlines aren't good either as the AI
tends to associate them with chapter breaks or a passage of time.

**Also be on the lookout for vertical bars** ( `|` ) which can be
replaced with colons ( `:` ). Lastly, if there any square brackets (`[`
and `]`) in an unedited file, you might want to remove them unless they
are encapsulating something such as an indication of time, location,
point-of-view or some other note you intend to use to nudge the AI in
your story.

### Miscellaneous Tips

-   Don't worry about and don't include the well-known `<|endoftext|>`
    token. It is not needed for training AI modules as the training
    process handles that already. You don't need a `<|startoftext|>`
    token either as *contrary to popular belief, this is not an actual
    token used by GPT language models*.
-   Don't worry about your clean-up or tokens being perfect. AI Modules
    are not as powerful as the actual underlying fine-tuned model and
    thus don't have as strong an effect as the existing model's
    training. If your resulting module produces at least fun or
    interesting results, that's still very much a success.
-   Make use of good feature-rich text editors such as Notepad++
    (Windows) or Sublime Text (Mac), or at least something that supports
    regular expressions which greatly cut down on editing time. If you
    do a lot of editing, the Notepad++ macros are a massive time-saver.
-   Avoid PDFs. Converting those to usable format is a time-consuming
    process even for pros, and often requires OCR software such as ABBYY
    Finereader. Exception: Some modern PDFs contain a pre-edited text
    layer which can be converted easily. This is especially common for
    digitally published magazines.
-   When converting into **.txt** from other formats, **.mobi** and
    **.azw** are usually the best ones, as those tend to be digital
    releases that have already been cleaned by the publisher. Calibre
    and other similar apps can convert those with minimal additional
    work needed. **.epub** are less reliable, as they can be anything
    from officially digitized works to bad scans. Other data formats
    such as **.lit**, **.doc** etc are not recommended due to common
    encoding and line wrap problems.

### Recommended Dataset Tools

[Notepad++](https://notepad-plus-plus.org/downloads/)
A free and highly-extendable text editor that features custom macros and
(somewhat limited) [Regex](Using-Regex)
Find and Replace.

[Zaltys' Notepad++ Macros](https://cdn.discordapp.com/attachments/870449695657443349/1009881560406831204/shortcuts.xml)
A set of keyboard macros for use with Notepad++ courtesy of Zaltys. The
main functions are keyed to Ctrl+1-4 for various problems that may need
manual fixing and Ctrl+F1-F5 for other scripts. Keep in mind Ctrl+1-4
can find some issues that do not need to be fixed but may need to be
manually looked over, so it is recommended against blind usage. More
details
[here](https://discord.com/channels/836774308772446268/870449695657443349/1009881560532656181).

[Regex101](https://regex101.com/)
A website focused on the quick creation, testing, and learning of
[Regular Expressions](Using-Regex). If
you make an account you can also save and share your regex with others.

[Chris' Wordstat](https://github.com/Systemcluster/wordstat)
A tool for counting word frequency in files. Useful for balancing
modules and avoiding overtraining of names.

[Belverk's Cleaning Python
Script](https://github.com/valahraban/python-scripts/blob/main/globtext.py)
One of the scripts used by the datasetting team. This is a "set it and
forget it" [Python](https://www.python.org/downloads) script for
automatically cleaning *many* common issues in data files. Note that
while there is no graphical user interface or indication of progress
while running, it is incredibly thorough while being minimally
destructive. It is recommend users manually check through each file
afterwards as it does not catch everything.

[Gnurro's
ReFormatter](https://github.com/Gnurro/FinetuneReFormatter/releases)
A powerful set of tools for data cleaning with an accessible graphical
user interface. Requires [Python](https://www.python.org/downloads) to
run. Detailed operation information can be found on its own [Wiki
page](https://github.com/Gnurro/FinetuneReFormatter/wiki) along with a
handy [guide on how to structure your data for a text adventure type
module](https://github.com/Gnurro/FinetuneReFormatter/wiki/HowTo:-Textadventure-Reformatting-from-Source).

[Zermelane's Dumb Reformatter](https://ermela.net/dumb-reformatter/)
A stupidly simple but quite convenient tool for reformatting text for
module training in your browser. No downloads, Python, or script running
necessary. This tool has some functionality overlap with some of the
above scripts, but is more destructive than Belverk's. Use with
caution, and note that your data will still require manual tweaking
(such as removing Afterwords and Author's Notes) afterwards.

[ScrapeFandom](https://github.com/JOHW85/ScrapeFandom)
A [Python](https://www.python.org/downloads) script which scrapes
English Fandom sites for updated Wiki dumps. Using Wiki data is not
recommended unless heavily cleaning is done and/or the resulting module
is intended for utility use such as with content generators.

[What Unicode?](https://www.babelstone.co.uk/Unicode/whatisit.html)
A website for identifying unicode characters. Handy when you need to
differentiate between various types of spaces, dashes, or just need to
identify some symbol you don't recognize.

### Useful Regular Expressions

A [**regular expression**, or
**regex**](Using-Regex), is a sequence
of characters that can be used to quickly **find and replace** more
complex patterns of text. The following are some useful regular
expressions for cleaning datasets. **Keep in mind these are potentially
highly destructive** and one should exercise much care when using these.
**Batch replacement (ie. "Replace All") with these is**
**''not**'' **recommended**.

/`^([^.!?'":]|[0-9].?)+r?n`/
Selects headers, titles, and anything else that does not end in
punctuation before a new line.

/`^(["'. ]*b[^a-z])([^a-z]{3,}b)+`/
Selects sequences of text in all uppercase capital letters. You can
optionally replace the selected text with normal lower case (preserving
the first uppercase letter) using this in the Replace field /`$1L$2E`/
though keep in mind character names and other proper nouns may lose
their first uppercase letter this way.

/`( '?[dis?!] |[“”"][“”"]|[A-z][“”"][“”"]?[A-z]|^"?.")`/
Detects various quotation and spacing problems.

/`^[". ]*b[^IA] w`/
Selects cases where the first letter of a word is separated by a space
(common OCR error).

/`[«»©^■◇◆●•★†‡�✽☙《》【】※|─_ ]`/
Locates common OCR artifacts and other characters that should normally
(with rare exceptions) not be present.

/`(opyright|ISBN|http|html|o be continued|^.?THE END.?$|endoftext|bout the author|able of Contents|nterlude|^[Gg]lossary|(ro|pi)logue|hapter|xcerpt|[Rr]eader|^Afterword)`/
Catches many of the auxiliary sections of a work.

### Common Text Containers and Affixes

-   [ text ]: Metadata. Should include the spaces. Used for chapter
    titles, locations, time, and other data that the AI should read but
    not repeat. Should always be contained on a single row.

***
-   `<text>`: Nonverbal dialogue such as telepathy, signing,
    kinesics, etc. Used without space padding.
    `<You’re welcome,> Basilard signed.`

***
-   *text*: Sound effects and onomatopoeia. `*BANG!*`

***
-   ─ text: LitRPG data blocks. Not to be confused with Em-Dash, this is
    `U+2500: ─ BOX DRAWINGS LIGHT HORIZONTAL`. This can include things
    like character or equipment stats, charged spells, item names, item
    rarity, etc. `─ Status: Bleeding`

***
-   > text: Used for computer output, texting, etc. Typically anything
    that is read from a screen. Currently overlaps with the text
    adventure mode and may be replaced by different character in the
    future. `> C U Ltr`

***
-    text: Text preceded by `U+2002: EN SPACE` is used for letters and
    quotations. ` Dear John,...`

***
-    text: Text preceded by `U+2003: EM SPACE` is used for poetry and
    song lyrics. ` Never gonna give you up`

### Final Thoughts {#final_thoughts}

Dataset cleaning may seem intimidating at first, but once you
familiarize yourself with the tools and resources it's quite easy to
get into the groove of things and prep a dataset in an afternoon. **Take
your time finding good source material**, too, as no matter how well you
clean something, **if its inherent quality is already subpar, then it
won't make much difference**.

Lastly, if you have any follow up questions feel free to reach out to
NAI's datasetting team including Zaltys (via the main NAI Discord),
[Belverk](https://github.com/valahraban/), and
[Lion](https://github.com/l-io-n/) (who wrote this guide). Special
thanks to all of them!


------------------------------------------------------------------------

### Setting a Module Image {#setting_a_module_image}

To add a preview image to your module modules, use a site such as
[<https://onlinejpgtools.com/convert-jpg-to-base64%5Dto> convert a
(small!) jpg to base64, then, open your module file in a text editor,
find:

`"mode":0`

Near the bottom, and add the following after it:

`,"image":"`[`data:image/jpeg;base64,codehere`](data:image/jpeg;base64,codehere)`"`

Replace "codehere" in the string with the base64generated by the site.

