import os
import glob
import re

workspace = r"c:\mca 2nd project (web) (2)\mca 2nd project (web)"

html_files = glob.glob(os.path.join(workspace, "frontend", "*.html"))
jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "*.jsp"))
admin_jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "admin", "*.jsp"))

all_files = html_files + jsp_files + admin_jsp_files

pattern = re.compile(r'images/cbs-logo\.png', re.IGNORECASE)
replacement = r'images/cbs-logo.webp'

for filepath in all_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    new_content = pattern.sub(replacement, content)
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")
