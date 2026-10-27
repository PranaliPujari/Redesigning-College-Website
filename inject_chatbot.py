import os
import glob
import re

workspace = r"c:\mca 2nd project (web) (2)\mca 2nd project (web)"

html_files = glob.glob(os.path.join(workspace, "frontend", "*.html"))
jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "*.jsp"))
admin_jsp_files = glob.glob(os.path.join(workspace, "src", "main", "webapp", "admin", "*.jsp"))

all_files = html_files + jsp_files + admin_jsp_files

pattern_body_end = re.compile(r'</body>', re.IGNORECASE)

for filepath in all_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Determine paths based on directory depth
    if "admin" in filepath.replace('\\', '/'):
        css_path = "../css/chatbot.css"
        js_path = "../js/chatbot.js"
    elif "frontend" in filepath.replace('\\', '/'):
        css_path = "css/chatbot.css"
        js_path = "js/chatbot.js"
    else:
        css_path = "css/chatbot.css"
        js_path = "js/chatbot.js"

    injection = f'\n    <link rel="stylesheet" href="{css_path}">\n    <script src="{js_path}"></script>\n</body>'
    
    if "chatbot.js" not in content:
        new_content = pattern_body_end.sub(injection, content)
        if new_content != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Injected into {filepath}")
