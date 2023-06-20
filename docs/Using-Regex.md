# Regular Expressions
This guide explains what a regular expression is and how they can be
utilized inside *NovelAI* to create powerful conditionals for your lore
or even outside of NovelAI for editing your stories or documents,
datasetting, and other beneficial ends.

***For specialists: NovelAI uses the
ECMAScript format of Regular Expressions, but only I, M, U and S are
considered valid flags, and Lookbehinds are not
supported.***

***

## What is a regular expression or regex?

A regular expression (often shortened as regex or regexp) is simply a
sequence of characters that specifies a *search pattern*. This concept
is often used in computer science or information processing.

A powerful regex syntax has been a feature of JavaScript since
ECMAScript6 and is implemented in NovelAI for use inside lorebook keys.

Search patterns can be used to create **a myriad of condition types**
for checking when a *key* is *matched*, allowing the user finer control
over how their lore entries are inserted into the context.

## A Quick Start

Seeing regex for the first time can be daunting. Many are first exposed
to the syntax and scared off by seeing an expression like
`/$${[^}]*}$$/` which looks like gibberish to most people.

However by reading the standard we can decipher this example and see how
easy, logical and powerful the matching can be:

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/ff188113-c38b-4a8a-b06a-ba4eef6c262f)


-   The set of / to / limit the expression in this case.
-    is used to escape certain symbols (the square brackets and curly
    braces in this example).
-   [ ] Is a block that contains a condition.
-   ^ is the NOT operator.
-   ^} thus means "NOT closing curly brace"
-   * means match everything until the next character, which is a
    closing curly brace.

Piecing all this information together, we figure out this expression
will match any word inside **[{}]** brackets.

It isn't recommended to start learning the syntax alone as many
powerful sources and tools exist to help the journey.

Among the most popular is **[regex101](https://regex101.com)**, a
website that offers a search menu with examples for many simple and
popular expressions, alongside an interpreter to test your expressions
in multiple regex implementations.

Another useful website for dipping your feet in deeper is
**[regular-expressions.info](https://www.regular-expressions.info/tools.html)**.
It teaches you everything you need and then some.

Your learning journey can also be gamified with interactive lessons like
**[regexone](https://regexone.com)** or games like
**[regexcrossword](https://regexcrossword.com)**.

***
## Regex Flags

A **Flag** is a letter 'appended to the end' of your regular
expression. It helps the parser understand how far it should check for
things. Flags apply to the entire expression. You can stack any
combination of flags at the end of your expression.

**All flags can be disabled by appending a minus before the letter.**

| Flag Letter        | Flag Name       | Effect                                               |
|--------------------|-----------------|--------------------------------------------------------|
| m        | **M**ulti-line                 | **Enabled by default.** Checks past the first newline, to the end of text.             |
| i        | Case **I**nsensitive                | Ignores case, matches even if capital letters are not exactly matched.            |
| u        | **U**nicode                | Checks for exact unicode characters. Generally not useful unless you're doing black magic.                |
| s        | **S**ingle line                 | If a period is found ( **.** ) then it is considered to be the same as a newline character ( n )     |

***
## Useful Key Conditions

In this segment we share and explain many expressions that are useful in
lorebook keys. Remember to think of regex as **conditions** for the text
you want to be associated to your lorebook keys! Most of these are easy
to copy into your lorebook with little editing.

### Positive and Negative Lookahead

First we will introduce two useful conditions that may look strange
initially. Positive lookahead is used to *limit* matches only to terms
which contain specific proceeding keywords.

**?** is the *look ahead* symbol in this case, the other two are similar
to those in mathematics: *=* is equal to, and *!* is different from.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/061dfe72-4e6c-4c57-994d-92356b9a96f1)


Negative lookahead is used to *deny* any matches containing those
keywords.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/aa0b5a3f-cc86-430a-99c3-0291177bc94f)


In our examples using regex101, a positive match is highlighted blue and
the right sidebar gives you detailed information on the expression.
Handy!

NOTE: *Lookbehind* conditions **are not supported by NovelAI due to a
limitation present in most browsers. As a result, do not use them.**

### Capture Groups

A capture group allows you to put apply a specific condition, but only
to this group. Creating this one is simple, just encapsulate it between
parentheses (like this).

This in turn leads us to:

#### Zero Or One Group

You define a ZOO by putting a ? after the character or capture group.
When you define a ZOO, it becomes an **optional match**. This is useful
for nicknames or titles that you often shorten down. Here is an example:
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/5630fd84-2c21-44ff-8c42-b44deb3f6d63)

However, if you use a ZOO at the end, say, your character is named
Elissa, but you want characters to be able to call her Eli, you can use
this as a Lorebook key:

`/Eli(ssa)?/`

But the issue will be that "Eli" will match, but so will
"Elisandra".

How to fix this? Simple, just append `b`:

`/Eli(ssa)?b/`

#### A or B or C {#a_or_b_or_c}

... or D, etc etc, as far as you'd like. The OR operand in Regex is a
Pipe: **|**

Here is a statement where "Test " can be followed by any of three
options, some of which include spaces.

`/Test (a banana|bear|cadmi um)/`

**A**=`a banana`

**B**=`bear`

**C**=`cadmi um`

The group helps you cleanly delineate the options.

`Test a banana` would be A if we did not have a capture group.

Here is a practical example for a character that has multiple nicknames
with the same starting letters.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/f374e4dd-c212-4f79-bb63-4a83fab1f3f3)
