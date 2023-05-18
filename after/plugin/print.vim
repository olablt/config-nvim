" " ąęčėj
" " set encoding=utf-8
" " set fileencoding=cp1250
" set printencoding=cp1250
" " set printencoding=utf-8
" set printdevice=CUPS_PDF 
" " set printfont=consolas:h9:cDEFAULT
" set printfont=courier:h10:cDEFAULT
" " set printfont=Courier_New:h9:cEASTEUROPE
" " for onw page on side
" set printoptions=number:y,paper:A4,left:5mm,right:5mm,top:5mm,bottom:5mm,portrait:y
" " for two pages on one side
" " set printoptions=number:y,paper:A4,left:0mm,right:0mm,top:0mm,bottom:0mm,portrait:y



command! -nargs=* P call DoMyPrint('<args>')
function DoMyPrint(args)
    " let g:html_use_css = 0
    let g:html_font = "Consolas"
    exec 'TSBufDisable highlight'
	let colorsave=g:colors_name
	exec 'color print'
	exec 'TOhtml '.a:args

    " restore old settings
    exec 'TSBufEnable highlight'
	exec 'color '.colorsave
	" exec 'MarkdownPreview '

    " " restore old css setting
    " let g:html_use_css = old_css
endfunction

" command Print :Hardcopy > %:t.pdf
" " command P :Hardcopy > %:t.pdf
" " command P :Hardcopy > %:t.ps
" set printfont=Courier:h8
" set printfont=Consolas:h8
" set gfn=Consolas\ 9
" command PP :Hardcopy > %:t.ps | !ps2pdf %:t.ps && rm %:t.ps 
" command PP :call Hardcopy > %:t.ps | !ps2pdf %:t.ps && rm %:t.ps 
" command PP call DoPDF('<args>')
command PP call Hardcopy()
function Hardcopy()
	let colorsave=g:colors_name
	color print
	" colorscheme print
	hardcopy > %:t.ps | !ps2pdf %:t.ps && rm %:t.ps
	" exec 'colorscheme '.colorsave
	exec 'color '.colorsave
endfunction
" function DoPDF()
" 	let colorsave=g:colors_name
" 	" let file_name = expand('%:t:r')
" 	let file_name = expand('%:t.ps')
" 	color print
" 	exec 'hardcopy > '.file_name
" 	" exec 'hardcopy > '.%:t.ps
" 	exec 'color '.colorsave
" endfunction



" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



" https://askubuntu.com/a/1177135

" nnoremap <F2> <ESC> :TOhtml <bar> w <bar> !open -a Safari % <CR> <bar> ZQ <CR> <bar> execute '!rm %:p.html' <CR>
" command Print :TOhtml > %:t.html
" vim -c "let g:html_no_progress=1" -c "syntax on" -c "set ft=c" -c "let html_use_css=1" -c "colorscheme print" -c "runtime syntax/2html.vim" -cwqa markdown.css
" command P :Hardcopy > %:t.pdf
" command P :Hardcopy > %:t.ps
" command P :Hardcopy > %:t.ps | !ps2pdf %:t.ps && rm %:t.ps 

" :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps

