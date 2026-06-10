# DFI Case Folder Creator

**Professional digital forensics case folder structure creator v2.0**

Automatically creates a clean, court-ready folder structure following best practices (SWGDE / NIST style).

## What's New in v2.0
- **Fully configurable folder structure** via `case_structure.txt`
- Added best-practice folders: `00_Case_Information`, `07_Chain_of_Custody`, `08_Images`, `09_Timeline`
- Improved placeholder file templates with more detailed instructions
- New `Case_Manifest.txt` at the root of every case with summary, structure overview, and recommended next steps
- Better feedback during folder creation

## Features
- One-click professional folder structure
- Automatic default to the folder where the script lives
- Creates standardized numbered subfolders (expandable/customizable)
- Adds helpful placeholder files with rich templates
- Works on any Windows machine (no installation required)
- Fully customizable via simple text config file

## Folder Structure (v2.0 Default)

| Folder                        | Purpose                                      |
|-------------------------------|----------------------------------------------|
| `00_Case_Information`         | Case metadata, intake forms, authorization   |
| `01_Raw_Evidence`             | Original evidence files + acquisition artifacts |
| `01_Raw_Evidence\Acquisition_Logs` | Acquisition documentation and logs        |
| `02_Analysis`                 | Analysis workspace                           |
| `03_Reports`                  | Final reports and deliverables               |
| `04_Exports`                  | Exported / carved data                       |
| `04_Exports\Carved_Images`    | Carved or exported images                    |
| `04_Exports\Carved_Videos`    | Carved or exported videos                    |
| `04_Exports\Documents`        | Exported documents                           |
| `04_Exports\Chat_Exports`     | Chat / messaging exports                     |
| `04_Exports\Media`            | Other media exports                          |
| `05_Notes_Documents`          | Examiner notes and documentation             |
| `05_Notes_Documents\Examiner_Notes` | Detailed examination notes template     |
| `06_Hashes_Verification`      | Hash logs and verification records           |
| `07_Chain_of_Custody`         | Chain of custody forms and transfer logs     |
| `08_Images`                   | Photographs (scene, devices, evidence)       |
| `09_Timeline`                 | Timeline artifacts and temporal analysis     |
| `99_Archive`                  | Final archived case package                  |

## How to Customize the Folder Structure

1. Edit (or create) `case_structure.txt` in the same folder as `DFI-Case-Folder-Creator.bat`
2. Add one folder path per line (use `\` for subfolders)
3. Run the script — it will automatically use your custom structure
4. If `case_structure.txt` is missing, it falls back to the default professional structure above

Example `case_structure.txt`:
```
00_Case_Information
01_Raw_Evidence
01_Raw_Evidence\Acquisition_Logs
...
07_Chain_of_Custody
08_Images
09_Timeline
99_Archive
```

## How to Use

1. Download the latest release or clone the repo
2. Place `DFI-Case-Folder-Creator.bat` (and optionally `case_structure.txt`) in your main cases folder (e.g. `X:\Digital Forensic Working Folder`)
3. Double-click `DFI-Case-Folder-Creator.bat`
4. Enter your case name (example: `2601-0001`) and press Enter
5. Press Enter again to accept the default location (or type a different base path)
6. The script creates the full structure + enhanced placeholder templates
7. A `Case_Manifest.txt` is created at the case root with full details and next steps
8. The case folder opens automatically in Explorer

## Placeholder Files (Enhanced in v2.0)

- **`01_Raw_Evidence\Hashes.txt`** — Structured template for acquisition hashes (MD5, SHA-256, SHA-1) + verification log table
- **`05_Notes_Documents\Examiner_Notes.txt`** — Professional template with sections for intake, examination log, findings, and next steps
- **`Case_Manifest.txt`** (new) — Complete case summary including folder explanations, key files, and recommended workflow steps

## Best Practices
This structure aligns with SWGDE, NIST, and common digital forensics guidelines for maintainable, court-admissible case organization.

## License
See LICENSE file for details.