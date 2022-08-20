(define-module (expanse packages lxi-tools)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages onc-rpc)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lxi-tools
  (package
    (name "lxi-tools")
    (version "2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/lxi-tools/lxi-tools")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "17l70b8whwp0a7j23vsrav1abjzhw78k7rg77q78q07rdqn9fwnd"))))
    (build-system meson-build-system)
	(native-inputs (list cmake pkg-config readline))
	(inputs (list liblxi lua))
    (home-page
     "https://lxi-tools.github.io/")
    (synopsis
     "LAN eXtensions for Instrumentation tools")
    (description
     "This package provides tools for LAN eXtensions for Instrumentation
based on the LXI Consortium standard which defines the communication
protocols for modern instrumentation and data acquision systems using
Ethernet.")
    (license license:bsd-3)))

(define-public liblxi
  (package
    (name "liblxi")
    (version "1.16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/lxi-tools/liblxi")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0dfhqslfx78qx5md4va5fpjmxwbxhb6mbx8bzlf31i6nhsj2rzcx"))))
    (build-system meson-build-system)
	(native-inputs (list cmake pkg-config))
	(inputs (list avahi libtirpc libxml2))
    (home-page
     "https://lxi-tools.github.io/")
    (synopsis
     "LAN eXtensions for Instrumentation library")
    (description
     "This package provides library for LAN eXtensions for Instrumentation
based on the LXI Consortium standard which defines the communication
protocols for modern instrumentation and data acquision systems using
Ethernet.")
    (license license:bsd-3)))
