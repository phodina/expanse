(define-module (expanse packages emacs)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (guix download)
  #:use-module (guix build-system emacs)
  #:use-module (guix git-download)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages bootloaders)
  #:use-module ((guix licenses) #:prefix license:))

(define-public emacs-org-auto-tangle
  (package
   (name "emacs-org-auto-tangle")
   (version "0.4.1")
   (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yilkalargaw/org-auto-tangle")
             (commit version)))
       (sha256
        (base32 "1zb7vcmhmjiqpbbhqrqci689rnpn10p985cs5jk9sgg66xsbrgs3"))
       (file-name (git-file-name name version))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-async))
   (home-page "https://github.com/yilkalargaw/org-auto-tangle")
   (synopsis "Allow org file tangling upon save")
   (description
"This package allows you to automatically tangle org files on save.  This is
done by adding the option @code{#+auto_tangle: t} in your org file.")
   (license license:bsd-2)))
