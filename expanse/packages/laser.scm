(define-module (expanse packages laser)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))


(define-public balor
(let ((commit "6894b05b209e59df20348ad21b6c8d7c2d565ee1")
      (revision "1"))
  (package
    (name "balor")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.com/bryce15/balor")
	   (commit commit)))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system gnu-build-system)
    (home-page
     "https://gitlab.com/bryce15/balor")
    (synopsis
     "control the BJJCZ galvo lasers")
    (description
     "")
    (license #f))))
