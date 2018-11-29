function! MkdirfNew(cmd)
  try
    let folder = system("echo $(find . -type d | fzy -l 3) | tr -d '\n'")
    redraw
    let the_file =  input(folder . "/")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(folder) && !empty(the_file)
    let target = folder . "/" . the_file
    silent exec "!mkdir -p `dirname " . target . "`"
    if a:cmd == "v"
      exec "vsp | e " . target
    elseif a:cmd == "s"
      exec "sp | e " . target
    else
      exec "e " . target
    end
  endif
  redraw!
endfunction

command! -nargs=* Emkdirf :call MkdirfNew("e")
command! -nargs=* Smkdirf :call MkdirfNew("s")
command! -nargs=* Vmkdirf :call MkdirfNew("v")

nnoremap <leader>ne :call MkdirfNew("e")<cr>
nnoremap <leader>ns :call MkdirfNew("s")<cr>
nnoremap <leader>nv :call MkdirfNew("v")<cr>
