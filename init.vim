" init.vim

" leader
let mapleader = ','
let maplocalleader = ','

" disable unused providers
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0

" load main lua config
lua require('1wilkens')

runtime macros/matchit.vim

" -- Setup lspconfig.
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"
"   --Enable completion triggered by <c-x><c-o>
"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"   -- Mappings.
"   local opts = { noremap=true, silent=true }
"
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
"   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"
"   -- Get signatures (and _only_ signatures) when in argument lists.
"   require "lsp_signature".on_attach({
"     doc_lines = 0,
"     handler_opts = {
"       border = "none"
"     },
"   })
" end
"
" local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
" lspconfig.rust_analyzer.setup {
"   on_attach = on_attach,
"   flags = {
"     debounce_text_changes = 150,
"   },
"   settings = {
"     ["rust-analyzer"] = {
"       cargo = {
"         allFeatures = true,
"       },
"       completion = {
"     postfix = {
"       enable = false,
"     },
"       },
"     },
"   },
"   capabilities = capabilities,
" }
"
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"   vim.lsp.diagnostic.on_publish_diagnostics, {
"     virtual_text = true,
"     signs = true,
"     update_in_insert = true,
"   }
" )
" END

" Search with ripgrep if available
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" colors
let base16colorspace=256
"colorscheme base16-atelier-dune
"set termguicolors

" diffs

" ======================
" # LANGUAGE SETTINGS
" ======================

" rust
"let g:rustfmt_autosave = 1
"let g:rustfmt_emit_files = 1
"let g:rustfmt_fail_silently = 0
"let g:rust_clip_command = 'wl-copy'
"
"if executable('rustc')
"    let $RUST_SRC_PATH = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'
"end

" Latex
"
" latexmk build dir to find labels for completion
"let g:vimtex_compiler_latexmk = {
"    \ 'build_dir' : './build',
"    \}
"
"let g:vimtex_toc_config = {
"    \ 'layers' : [ 'content', 'todo', 'include' ],
"    \ 'split_width' : 45,
"    \ 'tocdepth' : 1,
"    \}
"
"let g:tex_flavor = "latex"

" ======================
" # PLUGIN SETTINGS
" ======================

" securemodelines
"let g:secure_modelines_allowed_items = [
"                \ "textwidth",   "tw",
"                \ "softtabstop", "sts",
"                \ "tabstop",     "ts",
"                \ "shiftwidth",  "sw",
"                \ "expandtab",   "et",   "noexpandtab", "noet",
"                \ "filetype",    "ft",
"                \ "foldmethod",  "fdm",
"                \ "readonly",    "ro",   "noreadonly", "noro",
"                \ "rightleft",   "rl",   "norightleft", "norl",
"                \ "colorcolumn"
"                \ ]

" goyo
let g:goyo_width = '30%'
let g:goyo_height = '90%'

" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
