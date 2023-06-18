The **User Settings** can be accessed from the *Story Library*, then clicking on the Settings button (**⚙️**), or the Goose button.

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/1d9054a9-67cd-4f3e-9634-6c7fecbe0f3f)


## AI Settings


- **Stream AI Responses**: If ON, displays the tokens from the AI as they are generated, rather than displaying the entire answer at once.

- **Streamed Response Delay**: Delay between token displays if Stream AI Responses is ON.

- **HypeBot**: A secondary AI model that comments on the story. The model is consistent regardless of the **Avatar** selected.

* * The probability settings sets the chance for comments to be given.

* * **Permanent** allows you to poll HypeBot for a comment whenever you like by clicking their avatar, while **Automatic** comments when their chance is triggered only.

- **Continue Response to End of Sentence**: If ON, the generation will continue for up to 20 tokens more or until it creates a sentence delimiter (. or ;)

- **Preamble**: Adds a small amount of "marker" tokens before the entire context. This improves quality when the context window isn't full by telling the AI "this is a new story". **If the context is empty, a preamble is always added even if this is set to OFF.**

- **Trim Excess Whitespace**: If a loose space or repeated newline is detected at the end of the text, it will be cleaned up. Trailing whitespace can cause generation inconsistency.

- **Max Context Size**: If you have the *Scroll* or *Opus* Subscription plan, you can demo for users with less money to spend by forcing your context window to something smaller.

- **Default Bias**: Some logit biases are applied by default to the Dinkus and Asterism to make their generation less likely. Turn this OFF to remove those biases and apply your own.

- **Enable Token Probabilities**: Activates a diagnosis mode which returns the probabilities of all possible tokens in the AI's response. You can access the interface by clicking the **🧠** button next to Retry under the main text box. *Keep in mind that this can lengthen generation time!*

- **Bidirectional Inline Generation**: Normally, pressing Ctrl + Shift + Enter or ⌘Cmd + Shift + Enter will cause the AI to generate at the cursor position. NovelAI's models are not bidirectional, so it only reads the text before the cursor. If this option is **enabled**, a special model that can process text bidirectionally will be used for cursor position ("inline") generations.

***

## Interface Tab
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/eaa8d27f-445b-4e42-a0c6-2829e0c63b9c)

- **Gesture Controls**: Enables swipe-based controls for the side tabs and the input box on mobile devices and touchscreens.
- **Swap Context Menu Controls**: If on, use the NAI context menu on right click. Browser's default context menu is used if off.
- **Input Box**: Toggles the display of the input box. If off, only the story box is displayed.
- **Output Highlighting**: Toggles the different text colors in the story based on whether or not it was generated or written by the user.
- **Output Spellcheck**: Enables spellcheck in the main story box if your browser supports it efficiently.
- **Context Viewer Colors**: Color codes injected text elements in the context viewer depending on their origin.
- **Text to Speech**: When enabled, generations are read out loud by the TTS service.
- **Show lorebook keys in the output box**: When enabled, text that triggered a lorebook key will be shown in **bold**. This can have a performance impact.
- **Show story title**: Displays the title of the story at the top of the screen if enabled.
- **Show Tips**: Displays tips under the story box if enabled.
- **Use EditorV2 for new Stories**: Turns on the Experimental Story Editor for any story created with this setting on. This allows for text formatting, a more mobile-friendly interface, mouse-only inline generations, and performance improvements. However, not all features are available currently, check the list when turning on this feature for more information.

## Theme

Consult [Theming](Theming) for more information on this feature.

## Account tab
![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/8d63990c-25b8-4e37-968d-635c463658f9)

- **Default Storage Location**: Switches between using *Local Storage* and *Serverside storage* by default.

- **Ignore Remote Story Conflicts**: If you are editing the same story on two different devices at once, you may cause overwrite issues. If conflicts are detected, NovelAI will notify you and tell you of the changes, letting you choose which version you want to keep. Toggling this ON will make your current device always save changes regardless.
- **Download All Stories**: Processes all your story files and exports them in a .ZIP archive. Keep in mind those include all branches and retries, so this can be a lot of data and take quite a bit of time to process!

***

## Text to Speech tab

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/e76cfe5f-2045-4f67-b38d-3ec90f13d6c3)

The **Text to Speech** tab contains accessibility options for visually impaired users.

**You can stop the TTS at any moment by pressing ALT + SHIFT + T or ⌘Cmd + SHIFT + T**.

- **TTS Source**: Selects the *Local* TTS service installed on your device, or NAI's *streamed* TTS service.
- **Speak Outputs**: AI-generated outputs will be read by the TTS service if On.
- **Speak Inputs**: User Input will be read by the TTS service if On.
- **Speak HypeBot Comments**: Comments by HypeBot will be read by the TTS service if On.
- **Voiceset, Volume, Pitch & Speed**: Selects the voice used by the service, the volume at which it will speak, its treble/bass pitch, and the reading speed. Press **Test** to check if your settings are comfortable.

Streamed TTS has a different array of settings, displayed when it is enabled.

- **Model**: Allows you to choose between the original V1 model and the newer V2 model. Be aware that V1 and V2 work differently in terms of seed input.
- **Story Voice**: Which voice is used by the TTS service for story text.
- **HypeBot Voice**: Which voice is used by the TTS service for HypeBot comments.
- **Saved Voices**: Custom voices you have set up for the Streamed TTS service.
- **Name**: Sets a name for the voice you designed.
- **TTS Seed**: Write anything in there to generate a new voice.

Click the **🔊** button to play the test field's text with the voice selected.

Click the **💾** to save a recording of the text in the test field with the voice selected, so you can share it easily.

### Seed Mixing

You can combine different seeds by opening with `seedmix:`. After the colon, you can write the seed, and connect it to another seed with **+** to combine, or **-** to subtract its **Specifics**.

**Specifics** are *Cadence* ("speed of the speech"), *Intonation* ("pitch and dynamics of the speech"), and *Style* ("how the voice sounds").

To manipulate the specific of a seed on its own, preface the seed with the specific. These must be prefaced with a pipe: `|`

Keep in mind that:

- All spaces are removed.
- Stray : are kept.
- If Style is not specified, it will be set to the same value as Intonation.
- If Intonation and Cadence are set, the base seed's settings are ignored.

`seedmix:Aini|cadence:SonicTheHedgehog+Tails`

Here, the cadence will be the result of the combination of SonicTheHedgehog and Tail's cadence.

**If a seed or a specific is specified after a lone seed or identical specific, it will override what comes before it!**

`seedmix:Mario+Luigi|cadence:Toad`

In this example, the cadence of Toad will override the cadence in the
mix of Mario+Luigi.

***

## Defaults tab

![image](https://github.com/TapwaveZodiac/novelaiUKB/assets/35267604/d4b16976-6b3c-42e0-9266-cdc331fc7b06)

The **Defaults** tab allows you to set the default **Model**, **Generation Settings** and **Module** for new stories.

**Legacy Lore Generation** uses an older model with less functionalities for Lore Generation.