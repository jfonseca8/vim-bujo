"Make bujo directory if it doesn't exist"
if empty(glob('~/bujo'))
  call mkdir($HOME . '/bujo', 'p')
endif

autocmd bufnewfile todo.md call append(0, 'Date: ')
autocmd bufnewfile todo.md exe "g/Date: */s/Date: /Date: " .strftime("%a d %b %Y")
autocmd Bufwritepre,filewritepre todo.md execute "normal G"



" Open the bujo todo list file
function s:OpenTodo()
  "30 makes it open at width 30
  exe ":30vs ~/bujo/todo.md" 
endfunction

if !exists(":Todo")
  command Todo :call s:OpenTodo()
endif
