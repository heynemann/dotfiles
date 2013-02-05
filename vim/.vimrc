set t_vb= 

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
  elseif has("gui_photon")
    set guifont=Inconsolata:s18
  elseif has("gui_kde")
    set guifont=Inconsolata/18/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-inconsolata-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Inconsolata:h18
  endif
endif

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
