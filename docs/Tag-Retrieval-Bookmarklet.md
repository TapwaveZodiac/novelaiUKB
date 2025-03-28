# How to Make a Bookmarklet to Auto Copy Tags

Bookmarklet by *Oathgate & ght901 & JustAnotherGuy*

Tutorial by *Oathgate*

A **bookmarklet** is a small JavaScript snippet saved as a bookmark. This guide will show you how to create one for **Safari, Chrome, and Firefox** to copy tags automatically.

You will find the code at the end of this article.

---

## Step 1: Create a New Bookmark

### **Safari (iOS & macOS)**  
1. Open **Safari**.  
2. Navigate to any webpage (e.g., `example.com`).  
3. Tap the **Share** button (square with an arrow pointing up).  
4. Select **Add Bookmark** from the menu.  
5. Give the bookmark a name (e.g., "Copy Tags").  
6. Save it to **Favorites** or any preferred folder.  

### **Google Chrome (Desktop & Android)**  
1. Open **Chrome**.  
2. Navigate to any webpage.  
3. Click or tap the **star icon** in the address bar.  
4. Edit the name to something recognizable (e.g., "Copy Tags").  
5. Save it to the **Bookmarks Bar** or any folder.  

### **Mozilla Firefox (Desktop & Android)**  
1. Open **Firefox**.  
2. Navigate to any webpage.  
3. Click the **star icon** in the address bar to bookmark the page.  
4. Click **Edit** and rename it (e.g., "Copy Tags").  
5. Save it to your preferred location.  

---

## Step 2: Edit the Bookmark URL  

### **Safari (iOS & macOS)**  
1. Open **Bookmarks**:  
   - Tap the **Bookmarks** icon (open book).  
   - Find the bookmark you just created.  
2. Tap and hold the bookmark, then select **Edit**.  
3. Delete the existing URL and paste the **bookmarklet code** you copied earlier.  
4. Tap **Done** to save.  

### **Google Chrome (Desktop & Android)**  
1. Open the **Bookmarks Manager**:  
   - On **desktop**, press `Ctrl + Shift + O` (`Cmd + Option + B` on macOS).  
   - On **mobile**, go to **Menu > Bookmarks**.  
2. Find the bookmark, then click or tap **Edit**.  
3. Replace the URL with the **bookmarklet code**.  
4. Save the changes.  

### **Mozilla Firefox (Desktop & Android)**  
1. Open **Bookmarks** (`Ctrl + Shift + B` on desktop).  
2. Find the bookmark and select **Edit**.  
3. Replace the existing URL with the **bookmarklet code**.  
4. Save the changes.  

---

## Step 3: Use the Bookmarklet  

1. Open a webpage where you want to run the bookmarklet.  
2. Open **Bookmarks**.  
3. Select your bookmarklet (e.g., "Copy Tags").  
4. The bookmarklet will run, copying the tags to your clipboard for easy pasting.  

---

### Notes:  
- Some browsers (especially **Chrome** on iOS) may **block JavaScript execution** from bookmarks. If this happens, try using **Safari** or **Firefox** instead.  
- If the bookmarklet doesn't work immediately, ensure that **JavaScript is enabled** in your browser settings.

# Bookmarklet code
### Anime:
```javascript
javascript: (function () {
  function copyTags() {
    const replacements = {
      v: "peace sign",
      "double v": "double peace",
      "|_|": "bar eyes",
      "\\||/": "opem \\m/",
      ":|": "neutral face",
      ";|": "neutral face",
      "eyepatch bikini": "square bikini",
      "tachi-e": "character image",
    };
    const blockedTags = ["original"];
    const regex = /(\d(boy|girl|other)s?)/i;
    const tags = [
      ...document.querySelectorAll("ul.artist-tag-list li"),
      ...document.querySelectorAll("ul.character-tag-list li"),
      ...document.querySelectorAll("ul.copyright-tag-list li"),
      ...document.querySelectorAll("ul.general-tag-list li"),
    ]
      .map((li) => li.getAttribute("data-tag-name"))
      .filter((tag) => tag && tag.length > 0 && !blockedTags.includes(tag))
      .map((tag) => (tag.length <= 3 ? tag : tag.replace(/_/g, " ")))
      .map((tag) => replacements[tag] || tag)
      .sort((a, b) => {
        if (regex.test(a)) {
          return -1;
        }
        if (regex.test(b)) {
          return 1;
        }
        return 0;
      })
      .join(", ");

    if (!tags) {
      alert("No tags found!");
      return;
    }

    if (navigator.clipboard) {
      navigator.clipboard
        .writeText(tags)
        .then(() => {
          alert("Tags copied to clipboard!");
        })
        .catch((err) => {
          console.warn("Clipboard copy failed.", err);
          prompt("Copy to clipboard: Ctrl+C, Enter", tags);
        });
    } else {
      let textarea = document.createElement("textarea");
      textarea.value = tags;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand("copy");
      document.body.removeChild(textarea);
      alert("Tags copied!");
    }
  }
  copyTags();
})();
```

### Furry:
```javascript
javascript: (function () {
  function copyTags() {
    const replacements = {
      v: "peace sign",
      "double v": "double peace",
      "|_|": "bar eyes",
      "\\||/": "opem \\m/",
      ":|": "neutral face",
      ";|": "neutral face",
      "eyepatch bikini": "square bikini",
      "tachi-e": "character image",
    };
    const blockedTags = ["original"];
    const regex = /\b(male|female|ambigious gender)\b/i;
    const tags = [
      ...document.querySelectorAll("ul.species-tag-list li"),
      ...document.querySelectorAll("ul.artist-tag-list li"),
      ...document.querySelectorAll("ul.copyright-tag-list li"),
      ...document.querySelectorAll("ul.character-tag-list li"),
      ...document.querySelectorAll("ul.general-tag-list li"),
    ]
      .map((li) => li.getAttribute("data-name"))
      .filter((tag) => tag && tag.length > 0 && !blockedTags.includes(tag))
      .map((tag) => (tag.length <= 3 ? tag : tag.replace(/_/g, " ")))
      .map((tag) => replacements[tag] || tag)
      .sort((a, b) => {
        if (regex.test(a)) {
          return -1;
        }
        if (regex.test(b)) {
          return 1;
        }
        return 0;
      })
      .join(", ");

    if (!tags) {
      alert("No tags found!");
      return;
    }

    if (navigator.clipboard) {
      navigator.clipboard
        .writeText(decodeURIComponent("fur dataset, " + tags))
        .then(() => {
          alert("Tags copied to clipboard!");
        })
        .catch((err) => {
          console.warn("Clipboard copy failed.", err);
          prompt("Copy to clipboard: Ctrl+C, Enter", decodeURIComponent("fur dataset, " + tags));
        });
    } else {
      let textarea = document.createElement("textarea");
      textarea.value = tags;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand("copy");
      document.body.removeChild(textarea);
      alert("Tags copied!");
    }
  }
  copyTags();
})();
```
