(define-module (expanse packages emu)
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
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public fex-emu
  (package
    (name "fex-emu")
    (version "2202")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/FEX-Emu/FEX")
	   (commit (string-append "FEX-" version))))
       (sha256
        (base32
         "57pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config))
    (home-page
     "https://fex-emu.org/")
    (synopsis
     "")
    (description
     "")
    (license license:expat)))

(define-public cve-bin-tool
  (package
    (name "cve-bin-tool")
    (version "3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/intel/cve-bin-tool")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "57pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config))
    (home-page
     "https://cve-bin-tool.readthedocs.io/en/latest/")
    (synopsis
     "")
    (description
     "")
    (license license:gpl3+)))
