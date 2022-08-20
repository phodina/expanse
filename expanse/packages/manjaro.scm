(define-module (expanse packages manjaro)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mhwd
  (package
    (name "mhwd")
    (version "0.6.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.manjaro.org/applications/mhwd")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "22gmlar9hq47gyhnlhpkfwhbx0y6h2g7rrv7lrslv01mcsih4gzx"))))
    (build-system cmake-build-system)
    (home-page
     "https://gitlab.manjaro.org/applications/mhwd")
    (synopsis
     "Manjaro HardWare Detection")
    (description
     "This package enables the automatic detection and configuration
of computer hardware the system is running on.")
    (license license:gpl3+)))

(define-public oomd
  (package
    (name "oomd")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/facebookincubator/oomd")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "02gmlar9hq47gyhnlhpkfwhbx0y6h2g7rrv7lrslv01mcsih4gzx"))))
    (build-system meson-build-system)
;	(arguments
;	`(#:phases
;	  (modify-phases %standard-phases
;	   (add-before 'configure 'chdir-src
;	   (chdir "neo")))))
    (home-page
     "https://github.com/facebookincubator/oomd")
    (synopsis
     "Userspace out-of-memory killer")
    (description
     "This package provides a command-line utility to optimize
	 performance of binaries.")
    (license license:gpl2+)))
