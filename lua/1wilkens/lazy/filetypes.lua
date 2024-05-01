return {
  -- csv
  { 'chrisbra/csv.vim', ft = {'csv'} },
  -- dart/flutter: reactivate if these are really needed
  { 'dart-lang/dart-vim-plugin', ft = {'dart'}, enabled = false },
  { 'thosakwe/vim-flutter', ft = {'dart'}, enabled = false },
  -- markdown: reactivate if the default is not good enough
  { 'preservim/vim-markdown', ft = {'markdown'}, enabled = false },
  -- systemd: not lazyloaded to detect all systemd-related filetypes
  -- FIXME: reactivate when needed
  { 'https://codeberg.org/Dokana/vim-systemd-syntax', lazy = false, enabled = false },
  -- tex
  { 'lervag/vimtex', ft = {'tex'}, enabled = false },
}
