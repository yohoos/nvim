# nvim

## Installation
Clone this repository and copy over the files to the ~/.config/nvim. Create the subdirectory if it does not exist. 

Configurations for my most recent NeoVim setup.

### For splitting termianls upon open

Use :Term{line numbers resize => default is half screen}
Use :VTerm for vertical split

### Completion Selections Keys

TAB to go down a selection and Shift-TAB to go up a selection. Use Enter to selection completion suggestion and ESC to exit.

### Fuzzy Finder

Personal shortcut to use finder is: \<C-space\>

"\<leader\>" defaults to '\\'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

### Commenting

Assuming "\<leader\>" is "\\"

Use <leader>ci to comment/uncomment

Use the above with visual mode to comment blocks

### Vim Navigation

CTRL-^ to edit / goto previous file

### Navigation

\<j\> for up

\<k\> for down

\<h\> for left

\<l\> for right

\<cntrl\> plus the above directions for moving between windows

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

### Startify / Sessions

Read the Startify docs using ":h startify"

Make sure to start creating your session in the project root!
Otherwise, restoring session will restore from different directory.

Has poor compatibility with NERDTree so utilize fuzzy finder more instead.

### Macros

q{a-z} - registers the macro to a slot and begins recording. Press q again to finish recording.

To use playback a macro, use @{a-z}. @@ also replays the most recent macro.
