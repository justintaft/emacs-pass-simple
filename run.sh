emacsclient  -nce '(progn (jt-emacs-pass-simple-list-passwords))' & 
osascript -e 'tell application "Emacs" to activate'
