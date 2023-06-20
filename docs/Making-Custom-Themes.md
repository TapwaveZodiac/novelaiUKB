**This guide was made before CSS could be edited directly
inside the theme menu. This remains as an educational resource, but you
can do all the edits directly into NAI now, outside of using custom
fonts.**

# Custom Themes

This page contains **community-researched** content aiming to provide a
*relatively* easy to use Theme template, as well as a database of IDs
for more indepth modification.

This is an **expert** guide. There will be *quite a bit*
of hand-holding, because CSS is a satanic spawn of devastation.


All these sites will be useful for you as you work on
themes:

-   [W3Schools\' CSS tutorials](https://www.w3schools.com/css/)
-   [Color-Hex](https://www.color-hex.com/)

Utilities that may be useful:

-   [VSCode](https://code.visualstudio.com) - Set with JSON syntax
    highlight for the main theme content, and CSS for Global block.

Things to keep in mind:

-   Ensure that all blocks are properly delineated with the quotes and
    commas. Don\'t forget the semicolons between CSS commands as well.
    Check that pairs of curly braces are present and properly placed.
-   KEEP A BACKUP OF YOUR LATEST \'WORKING\' VERSION.


***

# Template Walkthrough

Before you start, **save the [raw
template](Making-Custom-Themes#raw-template) at the bottom of
this page** and give it a good read.

## Template Explanation

Okay, you\'ve got the file? Open it in notepad or a JSON editor of your
choice, but you\'re still probably confused. Let\'s go down the
template, part by part.

The template begins with a `{`. Leave it alone.

## Name field

`"name":"NAME HERE",`

Simply replace \"NAME HERE\" with the name of your font. Keep the quotes
as is.

You\'ll notice that all major elements use the following structure:

\"elementname\", colon, opening quote, content, closing quote, comma.

Keep this in mind for later, because if syntax breaks, it\'s probably
because a comma is dangling or missing, or a quote isn\'t opened/closed
properly.

***
## Font Block

``` JSON
"fonts":{
"default":"\"DEFAULT FONT\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", sans-serif",
"code":"\"UI FONT\", Menlo, Monaco, Consolas, \"Courier New\", monospace",
"field":"\"Source Sans Pro\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", sans-serif",   
"headings":"\"HEADINGS FONT\"",
"selectedHeadings":"DEFAULT FONT",
"selectedDefault":"HEADINGS FONT"},
```

First of all, we have four font categories.

* "INTERFACE FONT"       Used for everything in the interface that isn\'t a heading or title, or a text field.
* "UI BOXES FONT"        Used for everything in the interface that is a text field: Memory, Author\'s Note, Lorebook, etc.
* "MAIN TEXT BOX FONT"   Used for the central text box.
* "HEADINGS FONT"        Used for headings and titles in general.

Simply *replace* the all-caps text with the name of font of your
choosing. **Don\'t touch the backslashed quotes. Those are required for
fonts that have spaces in their names.**

**Make sure you match the Default font and Headings font for the
SelectedDefault and SelectedHeadings fields.**

What about all the other fonts on the same line? It\'s simple: Those are
fallback fonts. If the first one fails to load, it\'ll load the second,
etc, until the end. You can edit those too. Remember that the **entire**
font definition is contained within quotes, and concluded by a comma:

`"fontcategory": " \"Font Name With Space\", fontnamewithoutspace, anotherfontname ",`

### Adding Formatting to Fonts

You can add additional formatting to all font types by using CSS. In
order to insert them, you must add a semicolon just before the final
font\'s name of the font definition:

All the CSS code must be added after that semicolon. Every CSS element
must be separated by a semicolon. At the end of all the CSS content, you
must have the ending quote, and comma.

`"fontcategory": " \"Font Name With Space\", fontnamewithoutspace, anotherfontname; font-style:bold; text-shadow: 0 1px 2px #000000;",`

### Font Notes

-   Not all fonts are available on all devices. To be sure it\'ll always
    work, only use fonts that are available in the font selector, or
    provide a \"stock fonts\" version of your theme that uses these.


-   You can use heading fonts for the text font, and vice versa. Just
    because they\'re not in the same drop down doesn\'t mean they can\'t
    be used.


-   Make sure you pick fonts that are legible. Your theme should be
    comfortable to use.


-   You\'ll notice something that reads \"Leave Untouched\" It\'s better
    you leave these as is, as Themes break when fonts are changed after
    they\'re set up. Specifically, the header font, as it reapplies all
    default styling elements for some reason.



***
## Colors Block

``` JSON
"colors":{
"bg0":"#RRGGBB",
"bg1":"#RRGGBB",
"bg2":"#RRGGBB",
"bg3":"#RRGGBB",

"textHeadings":"#RRGGBB",
"textMain":"#RRGGBB",
"textHeadingsOptions":["#57B260","#5199AF","#C56565","#8B6BBF"],
"textMainOptions":["#F7F7F7"],
"textDisabled":"#F7F7F7A0",
"textPlaceholder":"#F7F7F777",
"warning":"#FFA5A5",
"textHighlight":"rgba(RRR, GGG, BBB, A.A)",
"textPrompt":"#RRGGBB",
"textUser":"#RRGGBB",
"textEdit":"#RRGGBB",
"textAI":"#RRGGBB"},
```

The colors block specifies all the default **Background Colors**
(bg0-bg3), as well as all the font colors.

All of these except one are specified in Hex.

Text Highlight is defined in RGBA format. This is identical to HEX
except the numbers go from 0 to 255 and are separated by commas. The
Alpha (transparency) channel, however, is an **index**, and goes from
1.0 to 0.0.

I suggest using Hexadecimal because it takes a lot less space, and also,
[ColorHex](https://www.color-hex.com/) exists. Use it. It\'s amazing.

A Hex color can have either **six** or **eight** digits. The digits in
Hexadecimal are 0123456789ABCDEF. The maximum value of FF is thus 256 in
decimal.

Hex is read in pairs, hence the RR GG BB AA nomenclature. They take
values of **00** to **FF**. RR for red, GG for Green, BB for Blue.

Now, what is **AA**? This specifies the level of **transparency.** FF is
fully opaque and 00 is completely transparent and thus invisible.

There are things to keep in mind before setting these:

-   BG colors can take transparency by adding another pair of digits at
    the end. Just like the Red, Green and Blue channel, this one goes
    from 00 to FF.


-   If your BGs colors are transparent, you will need to edit several
    elements in the Global block because they will be difficult to read!
    It\'s better to make the bg colors solid, THEN give transparency to
    specific items.


-   Text colors must mesh well with your BG colors or they will be
    illegible. Always remember the rules of DARK ON BRIGHT or BRIGHT ON
    DARK.


-   Never use pitch black for backgrounds. Very uncomfortable for the
    user\'s eyes, and looks terrible on most monitors.


-   Make your font colors discernible from each other, not shades of
    each other. What I suggest is make pairs of colors: One for
    User/prompt and one for AI/Edited. Choose one color for each. Then,
    select two of the component colors. Raise one and decrease the other
    to complete the pair.

### Color Tables

***Background Colors***

*  bg0   Background of sliders, context text boxes (memory, AN, etc), Search bar, Toggles set to ON, frames of dropdown boxes, background story export/import buttons, fade applied to the background when popups are opened, fade applies on the AI module pictures.
*  bg1   Background of side tabs, headers of popups, background of popup buttons, keys/tags badges background.
*  bg2   Main page and text box background, background of popups, background of dropdown boxes, active tab (on the side tabs) color
*  bg3   New Story & Lorebook button, frame of tabs and main text box, Toggles set to OFF, slider handle color.

***Text Colors***

*  textHeadings          Text used for the title of the selected story, the send button, name of active tab tabs and popups with multiple sub-tabs, background of toggles, selected AI module in the dropdown & the Favorite heart.
*  textMain              Everything else in the interface that isn\'t part of the main text box, and also all the text in the main text box when Highlighting is turned off.
*  textHeadingsOptions   Array that contains all the colors of the color picker for the heading font.
*  textMainOptions       Array that contains all the colors of the color picker for the main text font.
*  textDisabled          Used for elements that are disabled or turned off. e.g the Undo button if no actions have been performed. Has transparency.
*  textPlaceholder       Used for \"Type here and hit enter\", \"Search for Entries\", i.e text in boxes where you write things in the interface.
*  warning               Used to signal problems with NovelAI or non-fatal errors.
*  error                 Used to signal errors that caused something to fail. \"err: timeout\" is the most common.
*  textPrompt            Color used for the prompt. i.e the very first piece of text entered in the story.
*  textUser              Color used for user input. i.e text added at the very end.
*  textEdit              Color used for text edited by the user.
*  textAI                Color used for generated text.


***
## Global Block

The Global block contains all **CSS overrides**. This is used to
directly edit the style sheet of various parts of the interface. This
section won\'t cover everything, you can learn CSS yourself.

What is important, is that **the entire global block is basically the
integrality of your CSS style sheet, contained in a *single line, in a
single quote*.**

``` JSON
"global":"div.ProseMirror {padding: initial;} .userText, .editText, .aiText, .promptText {text-shadow: 0 0 0px #000000, 0 0 0px #000000;} #app{background-image:url(linkhere);}"
```

Every element ID begins with a period. Every CSS override applied to it
must be between curly braces, and every override separated by a
semicolon. It is not necessary to separate them with commas, unless you
want overrides to be applied to two elements at once.

### Prose Mirror

You\'ll have noticed something called **ProseMirror**. This is basically
what formats the text in the main text box, **if you use EditorV1**, if
you want to edit the text box in EditorV2, edit **.conversation** and
its subclasses.

``` css
div.ProseMirror {padding: 0px 0px 0px 0px;}
```

The Padding parameters here will add a bit of space between the text box
frame and the text itself. The order **appears** to be **UP, RIGHT,
DOWN, LEFT.**

``` css
.userText, .editText, .aiText, .promptText {text-shadow: 0 0 10px #000000;}
```

Now you have four identifiers. Each identifier is a type of text, same
as the different colors used in highlighting. The names should be
obvious enough.

If you only want the shadowing to affect certain types, remove all the
ones you want unaffected.

The shadow\'s arguments are vertical and horizontal offsets, shadow blur
distance, and the hex color off the shadow. The second set defines the
secondary shadow that it will fade to.

You can add

``` css
text-decoration: underline
```

between the curly braces as well to make that type of text underlined,
and

``` css
font-style: italic
```

to italicize the text.

If you wish to have different types of formatting, simply separate them
like this:

``` css
.userText, .promptText {text-shadow: 0 0 10px #000000; text-decoration: underline;} .editText, .aiText {font-style: italic;}
```

***
### Setting the page Background

The background of the site is defined under the `#app` label. It works
like any other ID, but doesn\'t take a period.

#### Setting a Color

By default the background is a color. It can be set in different
formats. RGB(A), or Hexadecimal. use \<code:\>background-color:
#RRGGBB;`</code>`{=html}

#### Setting an Image

To set an image as background, use

``` css
background-image: url(BACKGROUND DIRECT LINK HERE);
```

You\'ll notice it is already present for the main site background.
Replace \"BACKGROUND DIRECT LINK HERE\" with the **direct link** (i.e
with the file extension) to your image.

**If your background needs to be stretched to fit**: add

``` css
background-size: cover !important;
```

**If your background needs to EXACTLY fit to a full size window (not
recommended for mobile!)**: add

``` css
background-size: 100% 100% !important;
```

**If your background needs to be tiled**: add

``` css
 repeat scroll 0% 0% !important;
```

#### Blending Background Image & Color Blend

You can apply a background image and apply a [color
blend](https://www.w3schools.com/cssref/pr_background-blend-mode.asp) to
it by using the following properties:

``` CSS
.element
{
background-image:url(imageurl.png);
background-color:#RRGGBBAA;
background-blend-mode:default;
}
```

***
#### Fade-in Fade-out Effect

``` css
.conversation-main {border: none; -webkit-mask-image: -webkit-linear-gradient(top, rgba(255,255,255,0), rgba(255,255,255,1) 2%, rgba(255,255,255,1) 98%, rgba(255,255,255,0)); background: rgb(0 0 0 / 75%);}
```

What it does is create a fade in from the very top of the main text box,
and a fade out at the very bottom.

There\'s only two things that really need to be edited there: the
percentages. The first one indicates how much distance the fade-in
takes. The second indicates where the fade-out begins.

**The *lower* the first value, the *smaller* the fade-in, the *higher*
the first value, the *bigger* the fade-in.**

**The *higher* the second value, the *smaller* the fade-out, the *lower*
the second value, the *bigger* the fade-out.**

***
### Editing the size and placement of the text box

If the text box is too small or too large for you, you can adjust it by
adding the following to the Global block:

`.conversation{max-width: 90%;}`

Edit the percentage to make it wider or thinner. You can also use
`max-height` to edit how tall it is.

For the placement, you\'ll want to add a `margin` property, this will
create empty space around the text box. You can also make margins from
specific directions by specifying it, like `margin-top`.

Remember that all sizes can be specified both in **PX and in % of the
page space.**

***
### Making the Text Box Transparent when Focused

You noticed that making `.conversation` or `.conversation-main` have a
transparent background doesn\'t make the main text box transparent when
it is selected. This is due to a dynamic class being used, and the
override not being applied consistently.

To give the main text box a different color than BG0 when focused (and
apply transparency), use the following:

``` css
.conversation-main { background: transparent !important; } .ProseMirror-focused { background: #RRGGBBAA !important; }
```

Change RRGGBBAA to the color of your choosing.

***
### Defining settings for Mobile Displays only

You can define overrides that are only performed on Mobile devices by
encapsulating them in the following block:

``` css
@media (max-width:800px) {// CSS GOES HERE}
```



***
## Finishing your Theme

You did it? You filled everything? Great! Now you need to do a few
things.

1\. Check if all your blocks are properly opened and
closed. Check pairs of quotes, pairs of curly braces, etc. Make sure the
initial and final curly braces are present. Everything in the global
field must be in a single line, in a single quote.

2\. Make sure everything in the Global field is on a single line and
that all the blocks are properly closed.

3\. Import that new file from the theme menu, and **CLICK SAVE
CHANGES.**

4\. Profit!

If it didn\'t work, check how much *did* work. Usually something broke
somewhere because of a missing semicolon, parenthesis, comma or curly
brace.



## Extra Resources

### Raw Template

``` {.css .numberLines}
{
"name":"NAME HERE",

"fonts":{
"default":"\"DEFAULT FONT\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", sans-serif",
"code":"\"UI FONT\", Menlo, Monaco, Consolas, \"Courier New\", monospace",
"field":"\"Source Sans Pro\", -apple-system, BlinkMacSystemFont, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", sans-serif",   
"headings":"\"HEADINGS FONT\"",
"selectedHeadings":"Leave Untouched",
"selectedDefault":"Source Sans Pro"},

"colors":{
"bg0":"#RRGGBB",
"bg1":"#RRGGBB",
"bg2":"#RRGGBB",
"bg3":"#RRGGBB",

"textHeadings":"#RRGGBB",
"textMain":"#RRGGBB",
"textHeadingsOptions":["#57B260","#5199AF","#C56565","#8B6BBF"],
"textMainOptions":["#F7F7F7"],
"textDisabled":"#F7F7F7A0",
"textPlaceholder":"#F7F7F777",
"warning":"#FFA5A5",
"textHighlight":"rgba(RRR, GGG, BBB, A.A)",
"textPrompt":"#RRGGBB",
"textUser":"#RRGGBB",
"textEdit":"#RRGGBB",
"textAI":"#RRGGBB"},

"global":"div.ProseMirror {padding-right: 2px;} .userText, .editText, .aiText, .promptText {text-shadow: 0 0 0px #000000;} #app{background-image:url(linkhere);}"
}
```

### Editing the HypeBot elements

Edit these classes in the CSS block.

    comment-avatar
    Always present on element. Can be used to set an image that will be used regardless of state

    comment-avatar-speaking
    The element has this class when the text box is visible and not doing the "..." thing

    comment-avatar-speaking-active
    The element has this class when streaming is in progress, and for a variable (based on generated characters) amount of after a generation completes

    comment-avatar-thinking
    The element has this while generating with streaming off, or before the first token when streaming is on. This is where it does the "..."

    comment-avatar-idle
    The element has this class when there is no text box. This only happens when you have it set to permanantly show up.

    comment-name
    Can be used to set the name via the ::after pseudo-class
    e.g
    .comment-name::after {
        content: 'Name' !important;
    }

### List of all Element IDs

Keep in mind that all of these must be preceded by a period when edited
in the **global** field, except #app and div. elements.

``` css

"global":
/* Name space for all the edits that require overrides. EVERYTHING in this MUST be contained in a single line string. */

/*Interface Sliders & Buttons*/


slider 
 thin-slider /* Sliders whose body is thinner than the button */
 thick-slider /* Sliders whose body is as thick as the button. (Randomness, Max Output, Repetition Penalty) */

button /* This is ALL buttons. All buttons from the input box, but also clickables in the side tabs. */

/*Modal Menus (i.e 'popup' menus)*/

modal
 modal-compact /* Subscription details display, patch notes display, ephemeral context menu. */
 modal-regular /* Account settings / Customization settings / Hotkeys menu. Also AI modules menu and Context Viewer */
 modal-large  /* Lorebook container. */
 modal-overlay /* The overlay put on the screen while a modal is active. */
 modal-header /* Tab buttons for popups, like the account settings menu and the context viewer. */
 theme-editor

/*Side Tabs*/

menubar /* Story Library, i.e the tab on the left. */
 new-story-button
 story-list

infobar /* Options, i.e the tab on the right. */

 toggler /* Buttons to open the side tabs. Little icons in the top corners. */
  menubar-toggler /* Story library toggler (the one with a quill) */
  infobar-toggler /* Options toggler (the one with a cog) */

lorebook


/*Input & Main Text Box*/

conversation /* The main text box, it's frame, and all of its dependencies. */
 conversation-input-container /* The element that contains the text boxes and its parent settings. */
 conversation-main /* Main text box's text area. */
 conversation-editor /* Main text box's input layer. */
 div.ProseMirror /* Where the text proper is stored in the text area. */
 div.ProseMirror-focused /* Text area when you click on it. */
 userText
 editText
 aiText
 promptText

conversation-controls-container /* Area that contains the buttons AND the input box. */
 conversation-controls /* Area with the Input Box Buttons */
 conversation-controls-content /* Input Box Buttons proper. */
 conversation-error /* Where "err: timeout" and such is displayed. */
 redo-menu /* Redo tree. */

conversation-content /* text in the main box, probably */

loading-bar /* Shiny thing just under the text box that lights up during generations. */


/* General */
#app /* Background of the site. */
```

THIS IS FOR ARCHIVAL PURPOSE. ALL OF THESE
ARE DEPRECATED. IF AN ID IS NOT PRESENT ABOVE, YOU CAN USE INSPECT
ELEMENT TO FIND THE CONTAINER THAT AFFECTS WHAT YOU WANT TO
CHANGE.

``` css
#General Popups
(Context, Settings, Lorebook)

Big Popup
.sc-eKYRIR

Big Popup Header
.sc-eKYRIR - Old, now used by Big Popup Windows.
.sc-fuISkM - New

Big Popup Body
.sc-fbIWvP - Old
.sc-hmbstg - New

#Subscription/Ephemeral
Small Popup Body
.sc-fXazdy - Old
.sc-bTDOke - New

#Misc
Semi-transparent Overlay
.sc-gGLxEB - Old
.sc-amiJK - New

#Output/Input
Text Box Background
.sc-iTVJFM - Old
.sc-Arkif - New

Text Box Borders
.sc-jXcxbT - Old
.sc-khIgEk - New

Full-Space Button/Input Container
.sc-gkCoMD - Old
.sc-cKRKFl - New

Inner Button/Input Container
.sc-flUlpA - Old
.sc-iIgjPs - New

Text Box/Button Separator
.sc-eWnToP - Old
.sc-cwiweh - New

Shared Button Container
.sc-eXuyPJ - Old
.sc-gstuGz - New

Small Left/Right Button Container
.sc-iGkqmO - Old
.sc-amkrK - New

Input Box
.sc-eIXEph - Old
.sc-kizEQm - New

#Lorebook Only
Lorebook Popup Window
.sc-csTbgd

Lorebook Container
.sc-fkmfBh

Left Container
.sc-enrZtP

Left Container Header
.sc-leehGg

Left Container Search Bar
.sc-iuhXDa

Left Container Separator
.sc-hlXxXZ

Right Parent Container
.sc-bwcZwS

Right Container
.sc-hxyAeK

Right Container Header
.sc-ekA-drt

Right Container Body
.sc-hWZktu

Entry Settings Container
.sc-hUhoqY

Entry Settings Text Box
.sc-cSiAOC

Entry Settings Keys
.sc-ojivU

Entry Advanced Settings Container
.sc-fJxALz

Entry Advanced Settings Button (Modify at your own risk!)
.sc-ezzafa (used by all small buttons, be warned!) 
/and/
.sc-lgWdIC

Entry Advanced Settings Sub-containers
sc-jYKCQm

#Left Tab Only
Left Tab
.sc-kmIPcE - Old
.sc-cGKJhA - New

Left Tab Header
.sc-dkuGKe - Old
.sc-gGGFjW - New

Left Tab Search Bar
.sc-hYRTwp - Old
.sc-iXquSf - New

Left Tab Popup Container
.sc-iXeHaJ - Old
.sc-juXuNZ - New

Left Tab Body
.sc-cGKJhA - Old
.sc-hYIrvc - New

Story Container
.sc-hkoqWR - Old
.sc-cVJgsR - New

Left Tab Pull Tab
.sc-fKgJPi - Old
.sc-JsfZP - New


New Story Button Container
.sc-bShgHC - Old
.sc-kHVIJG - New

New Story Button
.sc-juXuNZ - Old
.sc-ktvWjP - New

#Right Tab Only
Right Tab
.sc-iJCRrE - Old
.sc-jcwpoC - New

Right Tab Button
.sc-ezzafa - Old
.sc-iBzEeX - New

Right Tab Pull Tab
.sc-carFqZ

#Right Tab Story Only
Story Text Box Container
.sc-hndLF - Old
??? - New

Story Text Box Title Container
.sc-geBCVM - Old
??? - New

Story Text Box Title
.sc-clGGWX - Old
??? - New

#AI Module Only
Module Container
.sc-eTTT1e

#Used in Settings and Right Tab
Title Container
.sc-kHHWYL - Old
.sc-GvhzO - New

Window Name
.sc-hOPeYd - Old
.sc-gsWcmt - New

Buttons Header
.sc-giAqhP - Old
.sc-hiKfDv - New

(Formerly Sliders)
Parent Tab Container 
.sc-bYwzuL - Old
.sc-cBoqAE - New

Tab Container
.sc-kLojOw - Old
.sc-ciSkZP - New

Settings Separator
.sc-hBezlf - Old
.sc-cdlubJ - New

Setting Container
.sc-eSoXWK - Old
.sc-gLwjMs - New

Setting Text
.sc-aiooD - Old
.sc-cOohKt - New

Setting Value
.sc-eYKchh - Old
.sc-fDUjSr - New

# Settings Only
Themes Container
.sc-dPzuq - Old
.sc-IMZDC - New
```
