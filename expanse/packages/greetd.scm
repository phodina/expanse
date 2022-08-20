(define-module (expanse packages greetd)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages web)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public greetd
  (package
    (name "greetd")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.sr.ht/~kennylevinsen/greetd")
	   (commit version)))
       (sha256
        (base32
         "0x5c3jkw09kvj2grcxm899y2n6ws8p990cyp9cs0fy6lm4fzlh6v"))))
    (build-system cargo-build-system)
    (home-page
     "https://git.sr.ht/~kennylevinsen/greetd")
    (synopsis
     "Minimal and flexible login manager daemon")
    (description
     "")
    (license license:gpl3+)))

(define-public gtklock
  (package
    (name "gtklock")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/jovanlanik/gtklock")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "6x5c3jkw09kvj2grcxm899y2n6ws8p990cyp9cs0fy6lm4fzlh6v"))))
    (build-system gnu-build-system)
	(arguments
	(list #:phases
	 #~(modify-phases %standard-phases
	    (add-after 'unpack 'fix-makefile
		(lambda* _
		(invoke "mv" "makefile" "Makefile")))
	    (delete 'configure))))
    (home-page
     "https://github.com/jovanlanik/gtklock")
    (synopsis "GTK Lockscreen for Wayland")
    (description
     "")
    (license license:gpl3+)))

(define-public gtkgreet
  (package
    (name "gtkgreet")
    (version "0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.sr.ht/~kennylevinsen/gtkgreet")
	   (commit version)))
       (sha256
        (base32
         "0nny83jz4acxnm7ddys7xqgzk5bjp0dicw9kjxkdkk3kvcavdkws"))))
    (build-system meson-build-system)
	(native-inputs (list pkg-config))
	(inputs (list gtk+ json-c))
    (home-page
     "https://git.sr.ht/~kennylevinsen/gtkgreet")
    (synopsis "GTK based greeter for greetd")
    (description "")
    (license license:gpl3+)))
