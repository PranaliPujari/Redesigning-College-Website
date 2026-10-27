import os
import glob
import re

workspace = r"c:\mca 2nd project (web) (2)\mca 2nd project (web)"

html_files = glob.glob(os.path.join(workspace, "frontend", "*.html"))
jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "*.jsp"))
admin_jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "admin", "*.jsp"))

all_files = html_files + jsp_files + admin_jsp_files

pattern = re.compile(
    r'<div class="logo">\s*<h2>(?:<i class="fas fa-graduation-cap"></i>)?\s*CBS</h2>\s*<p>Institute of Management, IT & Research</p>\s*</div>',
    re.IGNORECASE | re.MULTILINE
)

replacement = '''<div class="logo">
            <img src="images/cbs-logo.png" alt="CBS Logo" style="height: 60px;">
        </div>'''

replacement_frontend = '''<div class="logo">
            <img src="../image/cbs-logo.png" alt="CBS Logo" style="height: 60px;">
        </div>'''

for filepath in all_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if "frontend" in filepath:
        new_content = pattern.sub(replacement_frontend, content)
    else:
        new_content = pattern.sub(replacement, content)
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filepath}")
