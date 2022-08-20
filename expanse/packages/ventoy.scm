(define-module (expanse packages ventoy)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))


(define-public ventoy
  (package
    (name "ventoy")
    (version "1.0.70")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ventoy/Ventoy")
	   (commit version)))
       (sha256
        (base32
         "0cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/ventoy/Ventoy")
    (synopsis
     "")
    (description
     "")
    (license #f)))
