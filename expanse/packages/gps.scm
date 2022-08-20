(define-module (expanse packages gps)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public gnss-share
  (package
    (name "gnss-share")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.com/postmarketOS/gnss-share")
	   (commit version)))
       (sha256
        (base32
         "1nl4rkb700k62l9yjszn0zyxvfwmp90z6gvdz0p405mm944fhzms"))))
    (build-system go-build-system)
    (home-page
     "https://gitlab.com/postmarketOS/gnss-share")
    (synopsis
     "GNSS location data sharing")
    (description
     "")
    (license license:gpl3+)))
