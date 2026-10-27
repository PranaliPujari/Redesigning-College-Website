import os
import glob
import re

workspace = r"c:\mca 2nd project (web) (2)\mca 2nd project (web)"

html_files = glob.glob(os.path.join(workspace, "frontend", "*.html"))
jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "*.jsp"))
admin_jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "admin", "*.jsp"))

all_files = html_files + jsp_files + admin_jsp_files

pattern = re.compile(r'<img src="(?:../)?images/cbs-logo\.webp" alt="CBS Logo" style="height: \d+px;">', re.IGNORECASE)

for filepath in all_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We replace based on matching the old string and generating the new one with a larger size.
    def replace_size(match):
        text = match.group(0)
        # Replace the height with a larger one, e.g., 90px
        return re.sub(r'height: \d+px;', 'height: 90px; margin-top: 5px;', text)
        
    new_content = pattern.sub(replace_size, content)
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")
