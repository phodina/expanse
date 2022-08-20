(define-module (expanse packages sim)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages python)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public libosmocore
  (package
    (name "libosmocore")
    (version "1.6.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
		(url "https://git.osmocom.org/libosmocore")
		(commit version)))
        (sha256
          (base32
		  "7247rv9fbb8pw3xbkbz04q3vnvvva3hcw002gp1clp5psargzgqw"))))
    (build-system gnu-build-system)
    (propagated-inputs (list python-future))
    (home-page "https://osmocom.org/projects/libosmocore/wiki/Libosmocore")
    (synopsis "")
	(native-inputs (list libtool autoconf automake pkg-config))
	(inputs (list libusb python))
    (description
      "")
    (license license:gpl2+)))

; http://shop.sysmocom.de/products/simtrace
(define-public simtrace2
  (package
    (name "simtrace2")
    (version "0.8.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
		(url "https://git.osmocom.org/libosmocore")
		(commit version)))
        (sha256
          (base32 "7247rv9fbb8pw3xbkbz04q3vnvvva3hcw002gp1clp5psargzgqw"))))
    (build-system gnu-build-system)
    (propagated-inputs (list python-future))
    (home-page "https://osmocom.org/projects/libosmocore/wiki/Libosmocore")
    (synopsis "")
	(native-inputs (list libtool autoconf automake pkg-config))
	(inputs (list libusb libosmocore))
    (description
      "")
    (license license:gpl2+)))
