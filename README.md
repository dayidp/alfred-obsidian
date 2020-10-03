# Obsidian Daily Note - An Alfred workflow

An Alfred workflow that opens and appends a breadcrumb and header to Obsidian's Daily Note.

Supports Alfred 4 on macOS 10.7+ on Obsidian 0.8.15 and 0.9.1.

### Features

- Set a hotkey or keyword
- Checks to see if there is already a breadcrumb in the file. If there is not, it will append the breadcrumb and header to the note.
- Opens the Obsidian app.

This workflow does the following:

- Checks to see if you have a breadcrumb, if not;
- Appends a breadcrumb and "h2 date" to the top of the daily note in the follow format: 

>[[YYYY-MM-DD-1day]] | [[YYYY-MM-DD+1day]] > 
>\## h2 Day of week, MM DD YYYY

- opens the Obsidian app.

### Installation

- Goto Obsidian's settings under 'Plugins', enable 'Daily Notes'.
- Download the [Extension](https://github.com/dayidp/alfred-obsidian/blob/main/ObsidianDaily.alfredworkflow).
- Install the extension.
- Navigate to the Workflow area on Alfred and select Obsidian Daily.
- Double click on 'Hotkey' and setup your hotkey if you wish to use hotkeys.
- Double click on 'keyword' to configure your keyword.
- Double click on 'Run Script' to configure the script.
- In the script editor, change Step 1 to your vault name.
  - `vault="change this value to your vault name"`
- In the script editor, change Step 2 to where your vault is located.  (You can find this information by clicking on 'Open another vault' and looking at the left column under your vault name.)
  - If your vault is located in "Users/<yourname>/Documents/<vaultname>" then the default location is below. $HOME represents the home directory, in this case "/Users/<yourname>/"
  - change `"loc=$HOME"/Documents"` to your vault directory. (Don't add a forwardslash at the end)
- Make sure Obsidian's settings > Plugins > Daily note, the date format is default at "YYYY-MM-DD".

- Run Alfred Workflow
