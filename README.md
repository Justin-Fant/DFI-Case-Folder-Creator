# DFI Case Folder Creator

**Professional digital forensics case folder structure creator.**

Automatically creates a clean, court-ready folder structure following best practices (SWGDE / NIST style).

### Features
- One-click professional folder structure
- Automatic default to the folder where the script lives
- Creates 11 numbered subfolders (`01_Raw_Evidence` through `99_Archive`)
- Adds helpful placeholder files (`Hashes.txt`, `Examiner_Notes.txt`, etc.)
- Works on any Windows machine (no installation required)

### How to Use
1. Download the latest release or clone the repo
2. Place `DFI-Case-Folder-Creator.bat` in your main cases folder (e.g. `X:\Digital Forensic Working Folder`)
3. Double-click `DFI-Case-Folder-Creator.bat`
4. Enter your case name (example: `2601-0001`) and press Enter
5. Press Enter again to accept the default location

### Folder Structure Created
CaseName/
├── 01_Raw_Evidence/
├── 02_Analysis/
├── 03_Reports/
├── 04_Exports/
│   ├── Carved_Images/
│   ├── Carved_Videos/
│   ├── Documents/
│   ├── Chat_Exports/
│   └── Media/
├── 05_Notes_Documents/
├── 06_Hashes_Verification/
└── 99_Archive/