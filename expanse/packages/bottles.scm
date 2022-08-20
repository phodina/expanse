(define-module (expanse packages bottles)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages python)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public bottles
  (package
    (name "bottles")
    (version "2022.2.28")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/bottlesdevs/Bottles")
	   (commit (string-append version "-trento-3"))))
       (sha256
        (base32
         "1yr8q3iy48fkwpbvpnasvzcri0jyjc2dip7b05f5dlj679s7z0y8"))))
    (build-system meson-build-system)
	(arguments
	`(#:glib-or-gtk? #t))
	(native-inputs (list desktop-file-utils gettext-minimal `(,glib "bin") `(,gtk+ "bin") pkg-config))
	(inputs (list python))
	(propagated-inputs (list python-pygobject))
    (home-page
     "https://usebottles.com/")
    (synopsis
     "Visually appealing ASCII table output format for Python")
    (description
     "VeryPrettyTable is a Python library for displaying tabular data in a
visually appealing ASCII or HTML table.  Output is highly configurable,
including text alignment, padding, borders, sort order, and more.  Data can be
inserted directly, read from a CSV file, or imported using a Python DB-API
database cursor such as @code{sqlite3}.")
    (license license:gpl3+)))
