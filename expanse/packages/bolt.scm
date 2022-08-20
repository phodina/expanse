(define-module (expanse packages bolt)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public bolt
  (package
    (name "bolt")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/facebookincubator/BOLT")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "02gmlar9hq47gyhnlhpkfwhbx0y6h2g7rrv7lrslv01mcsih4gzx"))))
    (build-system cmake-build-system)
;	(arguments
;	`(#:phases
;	  (modify-phases %standard-phases
;	   (add-before 'configure 'chdir-src
;	   (chdir "neo")))))
    (home-page
     "https://github.com/facebookincubator/BOLT")
    (synopsis
     "Binary Optimization and Layout Tool")
    (description
     "This package provides a command-line utility to optimize
	 performance of binaries.")
    (license #f)))

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
