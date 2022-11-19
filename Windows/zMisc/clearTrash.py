"""
Chris Grady
Quick and Easy Trash Can Cleaner - Create scheduled task or keyboard shortcut for this to be useful
must install winshell first - if pip already installed use below from elevated cmd (for windows)
pip install winshell
*Confirmed working on python 2.7 but with minor tweaks will probably work on most versions
"""
import winshell
try:
    winshell.recycle_bin().empty(confirm=False, show_progress=False, sound=True)
    print("Recycle bin is emptied Now")
except:
    print("Recycle bin already empty")
