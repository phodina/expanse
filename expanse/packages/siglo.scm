(define-module (expanse packages siglo)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (guix build-system python)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-gatt
  (package
    (name "python-gatt")
    (version "0.2.7")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "gatt" version))
        (sha256
          (base32 "0fjf066jixk30fr8xwfalwfnhqpr56yv0cccyypnx2qp9bi9svb2"))))
    (build-system python-build-system)
	(native-inputs (list python-dbus python-pygobject))
    (home-page "https://github.com/getsenic/gatt-python")
    (synopsis "Bluetooth GATT SDK for Python")
    (description "Bluetooth GATT SDK for Python")
    (license license:expat)))

;; Fix PYTHONPATH as it is built with meson
(define-public siglo
  (package
    (name "siglo")
    (version "0.9.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference 
	   (url "https://github.com/alexr4535/siglo")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1q241465l0kjirycvhgrm5ylqll6ywqfyg2arad224v47fz7lb8g"))))
    (build-system meson-build-system)
	(arguments
	`(#:glib-or-gtk? #t
	  #:phases
	(modify-phases %standard-phases
	(add-after 'unpack 'fix-etc-install-path
	(lambda* (#:key outputs #:allow-other-keys)
	 (substitute* "build-aux/meson/postinstall.py"
	 ((".*gtk-update-icon-cache.*") ""))
	 (substitute* "data/meson.build"
	  (("etc/") (string-append (assoc-ref outputs "out") "/etc/"))))))))
	(native-inputs (list desktop-file-utils gettext-minimal glib `(,glib "bin")))
    (inputs (list python python-gatt python-requests python-pyxdg python-dbus))
    (home-page
     "https://github.com/alexr4535/siglo")
    (synopsis
     "Sync InitiTime watch")
    (description
     "")
    (license license:mpl2.0)))
