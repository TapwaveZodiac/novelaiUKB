Scenarios use **Placeholders** to offer customization opportunities to the end user. Think of them as Choose your own Adventure prompts.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/4749fb25-7ce1-47ff-b198-17fa790de0ef)

## Placeholders
You can add a placeholder anywhere within your story's prompt, memory, author's note and lorebook entries.

Placeholders have to be written in this format:

`${1#placeholder[I'm a default value]Title goes here:Put the description here}`

The placeholder is divided into five parts:

- order: the order in which the placeholders will be displayed. 1 goes first, then 2, etc.
- id: the only mandatory part of the placeholder, it has to be unique. If you have more than one instance of the id, it will use the same value for each of the placeholders.
- default: the default content of the field when importing the value.
- title: The title used in the placeholder import window to tell the user what they need to fill in.
- description: the text displayed above the input field when importing the value. If there is no description set, the text displayed will be the id. You may want to word this like a question for ease.

You cannot put these characters inside the text fields of the placeholder: $ {} [] # : @ ^ |

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/e96701fe-59e0-449b-9a38-4c3b3954a5b1)


### Placeholders in Lorebook entries

For the lorebook entries, you can add placeholders in the **Title** of an entry, its **Description** and its **Keys**. If you want to use [regex](Using-Regex.html) for your keys, you have to prefix the expression with a $.
For example to match with the name of a character, you have to write $/${name}/

### Order of the Placeholders
Placeholders are requested to be completed by the user in the alphabetical order of their ID. This means that if you start their id with a number that increments with each placeholder, they will be requested in the order of that number.

Example: ${1Age} ${2Name} ${4Gender} ${3Job} **Job** will be requested before **Gender**, because its ID comes before it.

You can also define the order by preceding the id with a number, followed by a pound sign (#):

`${1#Maincharacter[Jack]Main Character:Name the main character.}`

If different entries have the same Order number, they will be processed **alphabetically according to their id**.

### Placeholder Table of Contents

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/fb34fc09-c732-4ccf-81b2-395e8d471f87)

You can create a Table of Contents for placeholders where you can insert a large amount of them in advance, allowing you to easily keep track of all the placeholders you have defined.

The syntax is identical to normal placeholders, with these notable differences:

- It must be inserted at the absolute top of the prompt.
- The initiating symbol is a percentage sign (%) rather than a dollar sign.
- Every Placeholder must be on its own new line.