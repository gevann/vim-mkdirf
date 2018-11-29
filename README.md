# mkdirf.vim

This goal aims to allow the smooth opening of new and existing files in vim.
It does this by making use of the fuzzy-finder [fzy](https://github.com/jhawthorn/fzy)
to determine where to start looking for a file. Once a root folder has been selected
in this way, the user can enter the name of the file they want to open for editing,
including any parent directories. If the file already exists it will be open in
the specified buffer, otherwise it will be created - including any necessary
folders - and then opened for editing in the specified buffer.


## Installation

I recommend using [Vundle](https://github.com/VundleVim/Vundle.vim).

## Dependencies

Depends on [fzy](https://github.com/jhawthorn/fzy)
