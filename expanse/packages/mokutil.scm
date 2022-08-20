(define-module (expanse packages mokutil)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mokutil
  (package
    (name "mokutil")
    (version "0.5.0")
    (home-page
     "https://github.com/lcp/mokutil")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "16qqkdlnyzskim5rpw5pq8d20ymzsv13g3bzyj24jips5963bpkn"))))
    (build-system gnu-build-system)
	(native-inputs (list autoconf automake pkg-config which))
	(inputs (list efivar keyutils openssl))
    (synopsis
     "Utility to manipulate machine owner keys")
    (description
     "")
    (license license:gpl3+)))
