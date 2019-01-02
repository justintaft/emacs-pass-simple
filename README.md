Autotypes pass enties

![screenshot](screenshot.png)

OSX keybaord can be configured to launch emacs plugin. Create an automator service which runs run.sh, and bind servce to key.


Installation with quelpa: 

```
(use-package emacs-pass-simple :quelpa (emacs-pass-simple :fetcher github :repo "justintaft/emacs-pass-simple" :files ("*.el" "Emacs Pass Simple.app")))
```

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for troubleshooting tips.
