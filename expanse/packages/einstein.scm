(define-module (expanse packages einstein)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

; Fix downloading googletest
(define-public einstein
  (package
    (name "einstein")
    (version "2022.4.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
			  (url "https://github.com/pguyot/Einstein")
			  (commit (string-append "v" version))))
              (sha256
               (base32
                "0n1nyb5fgfva11l9ivnf0lqyqwhwhicv1x7rz2z7fp8g38jdm1nc"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config googletest))
    (home-page "https://github.com/pguyot/Einstein")
    (synopsis "NewtonOS Emulator")
    (description "")
    (license license:gpl2+)))
