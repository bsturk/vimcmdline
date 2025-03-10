function! HySourceLines(lines)
    call writefile(a:lines, g:cmdline_tmp_dir . "/lines.lsp")
    call cmdline#SendCmd('(load "' . g:cmdline_tmp_dir . '/lines.lsp")')
endfunction

let b:cmdline_nl = "\n"
let b:cmdline_app = "hy"
let b:cmdline_quit_cmd = "(quit)"
let b:cmdline_source_fun = function("HySourceLines")
let b:cmdline_send_empty = 0
let b:cmdline_filetype = "hy"

if !exists("g:cmdline_map_start")
    let g:cmdline_map_start = "<LocalLeader>s"
endif
exe 'nmap <buffer><silent> ' . g:cmdline_map_start . ' :call cmdline#StartApp()<CR>'
