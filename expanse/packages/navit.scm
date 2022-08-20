(define-module (expanse packages navit)
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

(define-public navit
  (package
    (name "navit")
    (version "0.5.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/navit-gps/navit")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "57pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config))
    (home-page
     "http://www.navit-project.org/")
    (synopsis
     "Turn-by-turn navigation software")
    (description
     "")
    (license (list license:gpl2 license:lgpl2.0))))

(define-public dmrconfig
  (package
    (name "dmrconfig")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/OpenRTX/dmrconfig")
	   (commit version)))
       (sha256
        (base32
         "07pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
	(native-inputs (list pkg-config))
	(inputs (list python qtbase-5))
    (home-page
     "https://github.com/OpenRTX/dmrconfig")
    (synopsis
     "Configuration utility for DMR radios")
    (description
     "")
    (license license:bsd-3)))

(define-public opnrtx
  (package
    (name "opnrtx")
    (version "0.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/OpenRTX/OpenRTX")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "07pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://openrtx.org/")
    (synopsis
     "Modular Open Source Radio Firmware")
    (description
     "")
    (license license:gpl3+)))

(define-public radio-tool
  (package
    (name "radio-tool")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/v0l/radio_tool")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "07pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/v0l/radio_tool")
    (synopsis
     "TYT/BaoFeng Firmware tool")
    (description
     "")
    (license license:gpl3+)))
