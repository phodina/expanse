(define-module (expanse packages sunclock)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sunclock-wlr
  (package
    (name "sunclock-wlr")
    (version "1.0.0")
    (home-page
     "https://github.com/sentriz/wlr-sunclock")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "01j24a6czysxihahvdmzcg53z28d5h60k4frqy89nbqxsp0l29jk"))))
    (build-system meson-build-system)
	(native-inputs (list cmake pkg-config))
	(inputs (list gtk-layer-shell gtk+ librsvg wayland))
    (synopsis
     "Desktop widget to show sun's shadows on earth on Wayland")
    (description
     "This package provides desktop widget to show sun's shadows on earth
	 on wayland.")
    (license license:lgpl3+)))
