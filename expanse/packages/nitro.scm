(define-module (expanse packages nitro)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nitro-fido2
  (package
    (name "nitro-fido2")
    (version "2.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/Nitrokey/nitrokey-fido2-firmware")
	   (commit (string-append version ".nitrokey"))))
       (sha256
        (base32
         "22pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://www.nitrokey.com/")
    (synopsis
     "FIDO2 USB Token firmware")
    (description
     "")
    (license license:expat)))

(define-public solo
  (package
    (name "solo")
    (version "4.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/solokeys/solo")
	   (commit version)))
       (sha256
        (base32
         "22pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://www.nitrokey.com/")
    (synopsis
     "FIDO2 USB Token firmware")
    (description
     "")
    (license license:expat)))
