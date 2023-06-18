This page lists specific tools provided by NovelAI.

# Anlas

All tools that create content, such as images, or modules, require **Anlas**, NovelAI's generative currency. The term comes from the Turkish word for "Understanding".

You get a **renewable stipend** of Anlas per subscription period. This is **not** a fixed amount per month, instead, your amount of "**Free Anlas**" is refilled to 1.000(Tablet, Scroll) or 10.000(Opus) every month. Any **Anlas** not spent is lost, so make sure you use them every month.

**Anlas** that are specifically bought directly never expire and remain forever until used.

# Module Training

**Consult [Datasetting for AI Modules](Datasetting-for-AI-Modules) for more information on how to prepare files for Module training.**

**AI Module training** can be accessed from the *Story Library*, then clicking on the Goose button (**🦆**), then **Module Training**.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/62e5e81f-7189-45dd-bd59-cef3671cb107)


The left part of the interface contains the **dataset**. Files supported are *raw text **only**, encoded in **UTF-8**.*

Upload all the files necessary for your module with the **Select File** button. Give your module a **Name and Description** on the right-hand side.

Choose the model that your module is for. **Modules for Sigurd are not compatible with Euterpe!**

The **Total \# of steps needed to train:** field will display the estimate number of steps for *100% coverage of all text files.* It is not necessary to set the number of training steps to that number. A good soft limit is **~3000 steps.** You may also overfit your module by using more than the estimate. 

This can have problematic or useful effects depending on what you seek to achieve.

Select the number of steps using the slider, then click **Train!** to start the training. It will take several minutes before the module is produced. Once done, you can save it and import it like any other story, scenario or generation set.

***

# Tokenizer

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/e9fab4cc-4a9c-4c51-ad3f-d1de1d4ee9c9)

The *Tokenizer* is a feature that allows you to check how your text is split into tokens before being sent to the AI. It can be accessed by pressing ALT+T or clicking on the Goose button (**🦆**), then then "Tokenizer".

The **Text** tab will highlight each token in sequence, using a different color to make it more visible.

**Token IDs** will display the Token Identification Code that the AI uses. This is very useful for banning specific tokens (without any space addition and case insensitivity) using **Ban Token ID**.

***

# Token Probability Viewer

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/3ed3c18a-65e4-49c0-bd33-e54963f8763f)

**To enable this feature, you must enable it in the AI Settings panel of the Account Settings window. This will create a 🧠 button, which lets you access the Probability Viewer.**

The **Token Probability Viewer** is a powerful diagnosis tool that ,allows you to see what choices the AI considers before committing to a generation. This is hugely useful for fine-tuning generation settings, and checking why the AI keeps outputting the same response.

The left side of the interface displays the response text. You can ,switch between displaying the text proper, or the Token IDs. Cooler ,colors represent tokens with a low likelihood to appear, while hotter ,colors represent tokens highly likely to appear.

If you click a token, the right panel will update to show you tokens that were considered by the AI, before the generation settings, biases, ,bans and modules and after them.

Only the 10 most likely tokens are shown. The remainder is grouped up as a whole entity to save on processing time.