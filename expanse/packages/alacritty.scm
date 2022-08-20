(define-module (expanse packages alacritty)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))


(define-public gelacritty
(let ((commit "8859639bbf0385192d67992019ed58cb594864f6")
      (revision "1"))
  (package
    (name "gelacritty")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/zim0369/gelacritty" )
	   (commit commit)))
       (sha256
        (base32
         "2cvzhswaf0wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/zim0369/gelacritty")
    (synopsis
     "Alacritty ligt/dark themes and fonts setter")
    (description
     "")
    (license #f))))
