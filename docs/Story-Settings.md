
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/f87c7c56-2b1e-423e-879e-ca9e272d996b)

This section of the interface controls settings **specific to your currently active Story**. There are three tabs here - **Story** and **Advanced** and **Generation Settings**. This page focuses on the first.

## AI Model

Allows you to choose between the following models:

  - **Kayra**, a fine-tuned NAI-LM 13B model.
  - **Clio**, a fine-tuned NAI-LM 3B model.
  - **Krake**, a fine-tuned GPT-NeoX 20B model. (Only available on Opus.)
  - **Euterpe**, a fine-tuned Fairseq GPT-13B model.
  - **Sigurd**, a fine-tuned GPT-J 6B model.
  - **Calliope**, the original fine-tuned 2.7B GPT-NEO model used in the Alpha.
  - **Snek**, a fine-tuned GPT-J 6B model trained specifically for Python output.
  - **Genji**, a fine-tuned GPT-J 6B model trained for Japanese output based on Japanese Light Novels.

As a reminder, parameter count is **not representative of quality** - Clio has superior performance in spite of its lower parameter count.

### AI Module

**AI Modules** are data modules that are inserted into the AI's memory in order to influence the text it will generate. These modules **reduce the total context space by twenty tokens when in use**, but are not tokens in themselves.

Each module is similar to a "mini-fine-tune", a corpus of text that was used to adjust the AI based on how it is written. Different modules have different effects, which depend on your own writing and the ideas, characters and scenarios you write about.

#### Older Models

For **Krake, Euterpe and Sigurd**, There are three types of modules: **Style**, **Theme** and **Inspiration**.

- Styles are based on multiple works from the same author.
- Themes are based on multiple works, from multiple authors, but from the same genre.
- Inspirations are based on a singular, specific work, from a single author.
- Special are for specific occasions or have different purposes in mind than normal storywriting.

Experiment to find what works best with what you enjoy and want to write about!

Further information on cleaning and preparing a dataset for use in training AI Modules can be found at the [Datasetting for AI
Modules](Datasetting-for-AI-Modules) section.

#### Newer Models

For **Clio and Kayra**, there are only *two* modules you can specifically set, outside of Text Adventure mode:
  - **Instruct** lets you give instructions to the AI directly by encasing your request paragraph between {curly braces}. The AI will signal the end of its performance with **{{}}**.
  - **Prose Enhancer** helps increase the complexity of the AI's output and requires no special priming.

There are two modules that cannot be selected, **Openings**, which replaces the old Preamble and helps start stories, and **Pedia**, which is used for Attributes-like entry generation.
  
These modules are automatically loaded if the following conditions are present:
```
Priority: instruct>pedia>openings

Instruct Module
IF a paragraph that ends within the last 1000 characters starts with { and ends with }

Pedia Module
IF no module selected
AND IF one of the last three lines is "----"
AND IF no line after the "----" is "***"


Openings Module
IF no module selected
AND IF context is less than 200 tokens
UNLESS ( the first line of context is "====="
OR any line of the context contains "Style:" or "Knowledge:"
OR any line of the context contains "Tags:" and "pedia"
OR the first line starts with [ but is not followed by " Author:", " Title:", " Tags:", or " Genre:" )
```

***

### Story's Memory

Injects this text at the top of the context. Helpful to keep the AI on track with important information to keep in mind, as well as the **Author, Title, Tags, Genre** setup. More information on how to use this can be found in the [Injected Text](Context#injected-Text) section.

### Story's Author's Note

Injects this text three newlines from the bottom of the context. Helpful for immediate instructions for the AI, which gives direction to the AI's generations. More information on how to use this can be found in the [Injected Text](Context#injected-text) section.

### Lorebook Quick Access

Enter an entry's name to find it quickly, or click the 📗 icon to open the Lorebook window.

### Story Stats

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/6bdc6e93-1298-4dff-bb1c-dd38bc440f15)

The *Story Stats* menu allows you to consult several metrics such as the number of text characters, your use of retries, the size of your retry branches, etc. You may also prune your story in several ways in order to decrease its filesize.

- **Trim Story**: Deletes all *redo steps*, leaving only the current path. You will not able to navigate the *Redo Tree* anymore, but the filesize of your story will be reduced.
- **Flatten Story**: More aggressive version of *Trimming.* Deletes all **Undo** steps and branches, leaving you with a single block of text.
- **Reset to Prompt**: Reverts your story back to the initial prompt it was started with, deleting everything else.

### Exporting the Story

You may export the story as:

- A **Story file**, which includes all branches and retries, and can be large if you haven't trimmed it first!

- A **Scenario file**, which is flattened and ready to be imported with placeholders, if applicable.

- A **Plaintext file** so it can simply be read on most devices.

- **Copy the entire .story file to the clipboard**, which can cause lag, this is a lot of data!

- A **Screenshot** which can be customized to provide a showcase of NovelAI's abilities.

### Screenshot Designer

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/a8b9b93a-d9db-4902-859e-07e0cd4ab790)

The Screenshot Designer allows you to take a screenshot of the **entire selected story text**, and format it into a neat image that you can share freely.

The toggles do the following:
- Show Title: Shows the title of the story, along with "AN EXCERPT FROM"
- Show Date: Show the date of the screenshot's creation.
- Show Pen Name: Shows "by" followed by the pen name you have chosen in your settings.
- Show NAI Logo: Shows the NovelAI logo and the site URL at the bottom.
- Show Show Color Highlighting: Indicates the source of all tokens in the image according to your theme colors.
- Show AI Model: Shows "Written Alongside" with the name and portrait of the selected model.
- Show Background: Shows some background vector art.
- Show Comment: If comments are present, they are displayed.

You can select the font size, the width of the picture in pixels, as well as if you'd like to use NovelAI's default dark or light theme, or the one currently in use.

***
