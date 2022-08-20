(define-module (expanse packages curtail)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))


(define-public curtail
  (package
    (name "curtail")
    (version "1.3.1")
    (home-page
     "https://github.com/Huluti/Curtail")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "0pyx14djg6j93ibiyl9dddblav10y8wzjk0nynz5n49mgd2y86zz"))))
    (build-system meson-build-system)
	(arguments
	(list #:glib-or-gtk? #t))
	(native-inputs (list gettext-minimal `(,glib "bin"))) 
	(inputs (list python))
    (synopsis
     "Image compressor")
    (description
     "This package provides simple GUI image compressor for PNG, JPEG and WEBP.
	 It supports both lossless and lossy compression modes with option to keep
	 or discard the metadata.")
    (license license:gpl3+)))
