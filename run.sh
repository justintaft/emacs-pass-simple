#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
osascript -e "tell application \"Emacs\" to activate"

emacsclient -a "emacs" -s ~/.emacs-server/server -e '(progn (jt-emacs-pass-simple-show-passwords))'

