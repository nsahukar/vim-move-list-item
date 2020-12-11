" Move list item to 'nth' position
function! MoveEm(up, position)
	let saved_cursor = getpos(".")
	let previous_blank_line = search('^$', 'bn')
	if a:up
		let l:pos = a:position - 1
	else
		let l:pos = a:position
	endif
	let target_line = previous_blank_line + l:pos
	execute 'move ' . target_line
	call setpos('.', saved_cursor)
endfunction

" mu <pos> - Move up the list to specified position
" md <pos> - Move down the list to specified position
for position in range(1, 9)
	execute 'nnoremap mu' . position . ' :call MoveEm(1, ' . position . ')<cr>'
	execute 'nnoremap md' . position . ' :call MoveEm(0, ' . position . ')<cr>'
endfor
