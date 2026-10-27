import os
import glob
import re

workspace = r"c:\mca 2nd project (web) (2)\mca 2nd project (web)"

html_files = glob.glob(os.path.join(workspace, "frontend", "*.html"))

pattern = re.compile(
    r'<img src="\.\./image/cbs-logo\.png" alt="CBS Logo" style="height: 60px;">',
    re.IGNORECASE | re.MULTILINE
)

replacement_frontend = '''<img src="images/cbs-logo.png" alt="CBS Logo" style="height: 60px;">'''

for filepath in html_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    new_content = pattern.sub(replacement_frontend, content)
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")
