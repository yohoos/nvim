# nvim

## Installation
Clone this repository and copy over the files to the ~/.config/nvim. Create the subdirectory if it does not exist. 

Configurations for my most recent NeoVim setup.

### For splitting termianls upon open

Use :Term{line numbers resize => default is half screen}
Use :VTerm for vertical split

To exit terminal mode, use \<C-\>\<C-n\> or \<C-w\>N

### Completion Selections Keys

C-j to go down a selection and C-k to go up a selection. Use TAB to selection completion suggestion and C-e to close completion menu or double click ESC.

Use K to show definition for current selection.

Use \<C-]\> to jump to definition.

Use \<C-e\> to exit completion popup.

### Fuzzy Finder

Personal shortcut to use finder is: \<C-space\>

Personal shortcut for live grep is: \<C-g\>

"\<leader\>" defaults to '\\'
### Commenting

NORMAL mode
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

VISUAL mode
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment

### Tabs (Not used much)

:tab <command> to create new tabp
:{count}tabp - previous tab
:{count}tabn - next tab
gt - next tab
{num}gt - go to tab numbered {num}

### Navigation

\<j\> for up

\<k\> for down

\<h\> for left

\<l\> for right

\<CTRL-\> plus the above directions for moving between windows

\<CTRL-\> plus the above directions in INSERT mode allows navigation during insert mode

<CTRL-{d,u}> to move up and down in blocks

<CTRL-{i,o}> to move to next/prev file in history cycle

Shift-3 to find next occurence of word

Shift-Enter to enter newline in next line
Cntrl-Enter to enter newline in above line

### Cut, Copy, Paste

Standard Copy/Cut/Paste is available when in insertion mode.

Use visual mode to highlight and make selections.
<y> to yank or copy
<d> to cut

<p> to paste after cursor
<P> to paste at cursor

### Move lines

dd - cuts line
{j,k} to move cursor up or down
P - paste above cursor
p - paste below cursor

### NERDTree

<C-{HJLK}> to change windows
Enter or "o" to open a directory
Shift-O to recursively open a directory
"m" to open menu options where you can create a "child node" to create new files/directories
"t" to open file in new tab

### Startify / Sessions

Read the Startify docs using ":h startify"

Make sure to start creating your session in the project root!
Otherwise, restoring session will restore from different directory.

Has poor compatibility with NERDTree so utilize fuzzy finder more instead.

### Macros

q{a-z} - registers the macro to a slot and begins recording. Press q again to finish recording.

To use playback a macro, use @{a-z}. @@ also replays the most recent macro.

### Gitsigns

Use commands via :Gitsigns \<command\>

### Markdown

Use ":MarkdownPreview" to toggle markdown preview in browser.

### LSP Command Shortcuts

K to show hover definition

Cntrl-] to jump to definition

Cntrl-R to rename
