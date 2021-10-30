(define-module (expanse packages wallpapers)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wallpapers-dt
 (let ((commit "e8e0b8e7a9077ddc6a8b94bf7dc118e3fae65772")
       (revision "1"))
 (package
  (name "wallpapers-dt")
  (version (git-version "0.1-pre" revision commit))
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://gitlab.com/dwt1/wallpapers")
                   (commit commit)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0y99ad6prns094cg8b61v1hs339lm6gnrzaqnlxxs4gsmi57cz79"))))
  (build-system copy-build-system)
  (arguments
  `(#:install-plan '(("." "wallpapers" #:exclude ("README.md")))))
  (synopsis "DT's Wallpaper Collection")
  (description "Entire wallpaper directory for those that want/need them")
  (home-page "https://gitlab.com/dwt1/wallpapers")
  (license #f))))
