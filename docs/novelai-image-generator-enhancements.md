# NovelAI Image Generator Enhancements

NovelAI Image Generator Enhancements is a userscript for [Tampermonkey](https://www.tampermonkey.net/) , [Greasemonkey](https://www.greasespot.net/) or [Violentmonkey](https://violentmonkey.github.io/), which brings quality of life and useability enhancements. Currently it has a small but useful featureset, which is designed to fit in seamlessly with the NovelAI Image Generator's interface like it was supposed to be there all along

## Feature outline

Currently, NovelAI Image Generator Enhancements offers three features: **Prompt Syntax Converter**, **Reference Strength Slider Patch** and the **Smart Weight-Enhancer**

---

### Prompt Syntax Converter
- One-click A1111 → NovelAI prompt conversion.
- Instantly convert Stable Diffusion WebUI (A1111) prompt syntax within the current prompt/negaitve prompt to NovelAI’s format.
- Accessible via a dedicated button next to the prompt settings icon.

#### The button in the interface
![Pasted image 20250516194952](https://github.com/user-attachments/assets/e23f2d4a-40c8-4ea1-ba58-ad1d5b475765)


| example A1111 prompt before conversion | after conversion                     |
| -------------------------------------- | ------------------------------------ |
|  ![Pasted image 20250516194644](https://github.com/user-attachments/assets/52d6098f-5781-4a3e-9662-344933608f3c) | ![Pasted image 20250516194830](https://github.com/user-attachments/assets/2165ee3e-119a-4bd4-8e4b-33c7c2087e27) |

---

### Reference Strength Slider Patch
- Fine-tune the Reference Strength slider:
  - Range: allowed values down to -1
- Allows for more precise control over reference image influence.

#### Example of the expanded slider bounds in use
![Pasted image 20250516195125](https://github.com/user-attachments/assets/9900347a-227b-4d13-837d-4024f1e82568)

---

### Smart Weight-Enhancer
- Intuitive weight editing for prompt tags:
  - Hover any weighted tag (e.g., `1.2::blue hair::`) to see a tooltip with the current weight.
  - Scroll to adjust the weight:
    - Normal: ±0.05
    - Shift: ±0.01 (fine)
    - Ctrl: Snap to whole numbers (1, 2, 3, ...)

#### Example UI while hovering a weight
![Pasted image 20250516195253](https://github.com/user-attachments/assets/a8b76099-e367-4a8f-9671-3590f12aee24)


*note: this feature does not support the "old" {{{tag}}}/\[\[\[tag\]\]\] emphasis format, but will not break it*

---

## Installation

### Choice of userscript extension

first, you will need to have a userscript extension installed, choose one of the following:
* Tampermonkey: https://www.tampermonkey.net/ _supported by Chrome & Firefox_
* Greasemonkey: https://www.greasespot.net/ _Firefox only_
* Violentmonkey: https://violentmonkey.github.io/ _Firefox only_

### Installing the userscript

Second, you will need to install the userscript itself, which you can get from either of the following:
* Github.com: https://github.com/esbe1175/novelai-image-generator-enhancements/raw/refs/heads/main/novelai-image-generator-enhancements.user.js
* Greasyfork: https://greasyfork.org/en/scripts/535979-novelai-image-generator-enhancements

Questions about the extension, bug reports or feature requests should be created as an issue on https://github.com/esbe1175/novelai-image-generator-enhancements
