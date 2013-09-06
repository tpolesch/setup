# ---------------------------------------------------------------
# Alias definitions
# ---------------------------------------------------------------

# Workaround for ** (gvim:4925): WARNING **: Unable to create Ubuntu Menu Proxy: Timeout was reached
# function gvim () { (/usr/bin/gvim -f "$@" &) }
alias gvim='UBUNTU_MENUPROXY= gvim'

alias mucurr='mu CurrentWork CurrentWork'
alias mc='make CLEAN'
alias mp='make PROLINT PRODUCT=ANTARES'
alias mpf='make -j 8 LINTFAST PRODUCT=ANTARES'
alias ma='make -j 8 PRODUCT=ANTARES | ccmsgfilter'
alias md='make -j 8 PRODUCT=DELPHI | ccmsgfilter'
alias mau='make UPDATE PRODUCT=ANTARES'
alias mdu='make UPDATE PRODUCT=DELPHI'
alias mdt='/home/tpolesch/MiscFiles.Snapshot/transferDelphi.pl'
alias mcal='make -j 8 PRODUCT=CALIMINI | ccmsgfilter'
alias mmp5='make -j 8 PRODUCT=MP5 | ccmsgfilter'
alias mmsp='make -j 8 PRODUCT=MMSPLUS | ccmsgfilter'
alias mcp='make -j 8 PRODUCT=CARDIAC_PL | ccmsgfilter'

alias cdi='cd /home/tpolesch/INTEGRATIONS; ll'
alias cdc='cd /home/tpolesch/CODE; ll'
alias cdl='cd /home/tpolesch/CODE/EcgLib/Current/tpolesch'
alias cde='cd /home/tpolesch/CODE/ecg_rep/Current/tpolesch'
alias cdf='cd /home/tpolesch/CODE/fe_rec/Current/tpolesch'
alias cdee='cd /home/tpolesch/CODE/ecgresp/Current/tpolesch'
alias cdh='cd /home/tpolesch/CODE/heart/Current/tpolesch'
alias cdhc='cd /home/tpolesch/CODE/heart_client/Current/tpolesch'
alias cdd='cd /home/tpolesch/CODE/dspm/Current/tpolesch'
alias cddbg='cd /home/tpolesch/CODE/dbmsgbufhdl/Current/tpolesch'
alias cdw='cd /home/tpolesch/CODE/wvprov/Current/tpolesch'
alias cdu='cd /home/m5/sw/utility/CurrentWork/include'
alias cdn='cd /home/m5/sw/nls/CurrentWork/include'
alias cds='cd /home/m5/sw/modules/sources'
alias cdp='cd /public/tpolesch; ll'
alias ll='ls -l'
alias hexdiff='dhex'
alias lpoff='sudo /sbin/modprobe -r lp; sudo chmod a+rwx /dev/parport0'
alias konto='gvim /home/tpolesch/DOCUMENTS/PRIVATE/KONTO/statistik.txt'
alias wd='wdiff -Ptkdiff'
alias gd='git difftool --tool=tkdiff --no-prompt'
alias psgrep='ps -e | grep'
alias e5='error_m5'
alias vcp='gvim /public/tpolesch/copy.txt'
alias kd='ls -l /dev/ttyUSB*; kermit -l /dev/ttyUSB3'

