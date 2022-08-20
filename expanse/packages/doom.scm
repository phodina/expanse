(define-module (expanse packages doom)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rbdoom-3-bfg
  (package
    (name "rbdoom-3-bfg")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/RobertBeckebans/RBDOOM-3-BFG")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "02gmlar9hq47gyhnlhpkfwhbx0y6h2g7rrv7lrslv01mcsih4gzx"))))
    (build-system cmake-build-system)
	(arguments
	`(#:phases
	  (modify-phases %standard-phases
	   (add-before 'configure 'chdir-src
	   (chdir "neo")))))
    (home-page
     "https://github.com/RobertBeckebans/RBDOOM-3-BFG")
    (synopsis
     "Domm 3 port")
    (description
     "")
    (license license:gpl3+)))
