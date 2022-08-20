(define-module (expanse packages audio)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public easy-effects
  (package
    (name "easy-effects")
    (version "4.8.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/wwmm/easyeffects")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1wrbxyf0j970s68yhq5bipq8jf8bg30yh1y7d8dfh74kqq1xrnwm"))))
    (build-system meson-build-system)
	(native-inputs (list gettext-minimal glibmm `(,glib "bin") itstool
	pkg-config python))
	(inputs (list gtk+ pulseaudio))
    (home-page
     "https://github.com/chipsec/chipsec/blob/main/chipsec-manual.pdf")
    (synopsis
     "Audio effects for PipeWire applications")
    (description
     "")
    (license license:gpl3+)))
