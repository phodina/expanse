(define-module (expanse packages idasen)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public idasen
  (package
    (name "idasen")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "idasen" version))
       (sha256
        (base32
         "1a7f60z3arykliwjx1fj5ymrfp2hkc5s5cbxli2znfkc5dbk0yqr"))))
    (build-system python-build-system)
;    (propagated-inputs
;     `(("python-colorama" ,python-colorama)
;       ("python-termcolor" ,python-termcolor)))
    (native-inputs (list python-click python-coverage python-pytest))
	(inputs (list python-alabaster python-atomicwrites python-attrs python-babel
	python-black python-bleak python-certifi python-charset-normalizer
    python-colorama python	python-dbus-next))
    (home-page
     "https://github.com/newAM/idasen")
    (synopsis
     "Python API and CLI for the IKEA IDÅSEN desk")
    (description
     "This package provides Python API and CLI for the IDÅSEN an electric
sitting standing desk with a Linak controller sold by IKEA.")
    (license license:expat)))

(define-public python-bleak-winrt
  (package
    (name "python-bleak-winrt")
    (version "1.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "bleak-winrt" version))
        (sha256
          (base32 "1w3dw9jgdf77dlcffi1i1zaflkcr65wijfxxjnfj5dbiipwnaxry"))))
    (build-system python-build-system)
    (home-page "https://github.com/dlech/bleak-winrt")
    (synopsis "Python WinRT bindings for Bleak")
    (description "Python WinRT bindings for Bleak")
    (license license:expat)))

(define-public python-pyobjc-framework-libdispatch
  (package
    (name "python-pyobjc-framework-libdispatch")
    (version "8.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyobjc-framework-libdispatch" version))
        (sha256
          (base32 "07rpprcx6f6hrk10r2xmw6vj9gxrlzj63k2q86xkk79wmjy0kc7x"))))
    (build-system python-build-system)
    (propagated-inputs (list python-pyobjc-core))
    (home-page "https://github.com/ronaldoussoren/pyobjc")
    (synopsis "Wrappers for libdispatch on macOS")
    (description "Wrappers for libdispatch on macOS")
    (license license:expat)))

(define-public python-pyobjc-framework-cocoa
  (package
    (name "python-pyobjc-framework-cocoa")
    (version "8.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyobjc-framework-Cocoa" version))
        (sha256
          (base32 "0163v2dw1qq20028hgkbslxwk7znhfq152hzdppib17iwac1k47h"))))
    (build-system python-build-system)
    (propagated-inputs (list python-pyobjc-core))
    (home-page "https://github.com/ronaldoussoren/pyobjc")
    (synopsis "Wrappers for the Cocoa frameworks on macOS")
    (description "Wrappers for the Cocoa frameworks on macOS")
    (license license:expat)))

(define-public python-pyobjc-framework-corebluetooth
  (package
    (name "python-pyobjc-framework-corebluetooth")
    (version "8.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyobjc-framework-CoreBluetooth" version))
        (sha256
          (base32 "191lhps17868syz47la8bb49b7cy91cgvy2754bhsy6hkh064dj7"))))
    (build-system python-build-system)
    (propagated-inputs (list python-pyobjc-core python-pyobjc-framework-cocoa))
    (home-page "https://github.com/ronaldoussoren/pyobjc")
    (synopsis "Wrappers for the framework CoreBluetooth on macOS")
    (description "Wrappers for the framework CoreBluetooth on macOS")
    (license license:expat)))

(define-public python-pyobjc-core
  (package
    (name "python-pyobjc-core")
    (version "8.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyobjc-core" version))
        (sha256
          (base32 "16y8c59pwknhc8253m734xdh9kj37g56x44rmzxcniq6vphqxyva"))))
    (build-system python-build-system)
    (home-page "https://github.com/ronaldoussoren/pyobjc")
    (synopsis "Python<->ObjC Interoperability Module")
    (description "Python<->ObjC Interoperability Module")
    (license license:expat)))

(define-public python-bleak
  (package
    (name "python-bleak")
    (version "0.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "bleak" version))
        (sha256
          (base32 "1fkq8q54s9apqiamdd8vgrhk5p02w5w281q93dfnrd37xv7ysk6h"))))
    (build-system python-build-system)
    (propagated-inputs
      (list python-bleak-winrt
            python-dbus-next
            python-pyobjc-core
            python-pyobjc-framework-corebluetooth
            python-pyobjc-framework-libdispatch))
    (home-page "https://github.com/hbldh/bleak")
    (synopsis "Bluetooth Low Energy platform Agnostic Klient")
    (description "Bluetooth Low Energy platform Agnostic Klient")
    (license license:expat)))

(define-public python-idasen
  (package
    (name "python-idasen")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "idasen" version))
        (sha256
          (base32 "1a7f60z3arykliwjx1fj5ymrfp2hkc5s5cbxli2znfkc5dbk0yqr"))))
    (build-system python-build-system)
    (propagated-inputs (list python-bleak python-pyyaml python-voluptuous))
    (home-page "https://github.com/newAM/idasen")
    (synopsis "ikea IDÅSEN desk API and CLI.")
    (description "ikea IDÅSEN desk API and CLI.")
    (license license:expat)))
