(define-module (expanse packages oreboot)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public oreboot
(let ((commit "20e1b823df9654ddc11cc37013bff0f40ce9a3d9")
      (revision "1"))
  (package
    (name "oreboot")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/oreboot/oreboot")
	   (commit commit)))
       (sha256
        (base32
         "1zsam590ps3rc4pq814lbk40nq5bm9qm4abgbf4j1pvz975fr0g6"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/oreboot/oreboot")
    (synopsis
     "Fore of coreboot written in Rust")
    (description
     "")
    (license license:gpl2+))))
