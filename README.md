# nvim

Configurations for my most recent NeoVim setup.

### For splitting termianls upon open

Use :Term{line numbers resize => default is half screen}
Use :VTerm for vertical split

### Completion Selections Keys

TAB to go down a selection and Shift-TAB to go up a selection. Use Enter to selection completion suggestion and ESC to exit.

### Fuzzy Finder

<cntrl-space> to open fuzzy file finder, analogous to Intellij's global search bar

Once in the fzy finder:

      <Esc>     close fzy pane
      <Enter>   open selected file with default open command
      <Ctrl-S>  open selected file in new horizontal split
      <Ctrl-V>  open selected file in new vertical split
      <Ctrl-T>  open selected file in new tab
      <Ctrl-N>  next entry
      <Ctrl-P>  previous entry

### Commenting

Assuming <leader> is \
Use <leader>ci to comment/uncomment
Use the above with visual mode to comment blocks

### sbt-metals

<space>tb to get the different build options (compile, package, clean)

:CocCommand

- compile-cascade
- compile-clean
- analyze-stacktrace
- "Enter without args and search for optimize imports"
  - Change config in `.scalafix.conf` to "groupedImports = Merge"

(Shift) K to preview docs
(Shift) J to jump to definition
(Shift) H to jump to references
(Shift) L to jump to implementations
(Shift) {JJ, HH, LL} to jump via new vertical split

#### vim navigation

CTRL-^ to edit / goto previous file

### Navigation

<j> for up
<k> for down
<h> for left
<l> for right

<cntrl> plus the above directions for moving between windows

<CTRL-{du,u}> to move up and down in blocks
<CTRL-{i,o}> to move to next/prev line in cycle

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

Use Shift-{j,k} to move lines up or down one

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
