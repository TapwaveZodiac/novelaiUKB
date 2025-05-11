# Automatically Tag NovelAI Images for Hydrus

*by MiyaNya/.yamii.*

This is a script for generating "sidecars" which are files containing tags that Hydrus will import alongside your NovelAI generated images. 

## Prerequisites:
1. Python
2. [Hydrus Network](https://github.com/hydrusnetwork/hydrus)
   
## Using the script:
1. Create a file named "generate_sidecars.py" somewhere on your PC. **DO NOT PUT IT IN THE SAME FOLDER AS HYDRUS.**
2. Add the code below inside it. Save the file.
3. Make a folder called import_images, and put your images there.
4. Run CMD in the folder with the py file. Then, execute `py -m pip install pillow`.
5. Once pillow is installed, `py generate_sidecars.py`
6. Now your import folder will be full of text files containing the tags for the images.

## Importing to Hydrus:
1. file -> import files...
2. Add folder, find the import_images folder.
3. Add tags/urls with the import >>
4. At the top, click the sidecars tab.
5. add -> add -> a .txt sidecar
6. Check "remove file .ext?"
7. apply -> apply -> apply

# Code

```Python
import os
from PIL import Image
import json
import re

def main():
    dirPath = ".\\import_images"   # rename this to your folder of choice
    
    filelist = os.listdir(dirPath)
    
    for root, dirs, files in reversed(list(os.walk(dirPath))):
        for filename in reversed(files):
            # Process files here
    
            if not(filename.endswith(".png")):
                continue
            
            image_path = os.path.join(root, filename)
            sidecar_path = os.path.splitext(image_path)[0] + ".txt"

            if os.path.isfile(sidecar_path):
                continue
                
            im = Image.open(image_path)
            comment = json.loads(im.info['Comment']) if 'Comment' in im.info else ''
            
            tags = ''
            if 'actual_prompts' in comment:
                tags = comment["actual_prompts"]["prompt"]["base_caption"].lower()
                for char_prompt in comment["actual_prompts"]["prompt"]["char_captions"]:
                    tags += ', ' + char_prompt["char_caption"].lower()
            elif 'Description' in im.info:
                tags = im.info['Description'].lower()
                if 'v4_prompt' in comment and 'char_captions' in comment['v4_prompt']['caption']:
                    for char_prompt in comment['v4_prompt']['caption']['char_captions']:
                        tags += ', ' + char_prompt['char_caption'].lower()
            else:
                print(im.info)
                continue
            
            tags = tags.replace("[","")
            tags = tags.replace("]","")
            tags = tags.replace("{","")
            tags = tags.replace("}","")
            tags = re.sub(r'-\d*\.?\d*::.*?::', '', tags) # remove tags with negative emphasis
            tags = re.sub(r'-?\d*\.?\d*::', '', tags)
            #tags = re.sub(r'(?<!\d)\b(girl|boy)\b', '', tags)
            
            tag_array = [x.strip() for x in re.split(r'[.,|]', tags)]
            
            tag_array.append('model:' + im.info["Source"])
            tag_array.append('sampler:' + comment["sampler"])
            
            sidecar_text = '\n'.join(tag_array)
            
            print(sidecar_path)
            
            write_to_file(sidecar_path, sidecar_text)


def write_to_file (output_file, output_string):
    with open(output_file, 'w') as file:
        file.write(output_string)
        
if __name__ == '__main__':
     main()

# by .yamii.```
