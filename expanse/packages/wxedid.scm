(define-module (expanse packages wxedid)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages wxwidgets)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wxedid
  (package
    (name "wxedid")
    (version "0.0.27")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://downloads.sourceforge.net/" name "/" name
	   "-" version ".tar.gz"))
       (sha256
        (base32
         "1yhmkn51adap9rmm8z8ky8acy4zlc832b91zng249qq97fphc4i8"))))
    (build-system gnu-build-system)
	(arguments
	(list #:tests? #f))
	(inputs (list wxwidgets))
    (home-page
     "https://sourceforge.net/projects/wxedid/")
    (synopsis
     "Extended Display Identification Data editor")
    (description "This package provides wxWidgets-based EDID (Extended Display
Identification Data) editor.")
    (license license:gpl3+)))

(define-public edid-rw
  (package
    (name "edid-rw")
    (version "2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/bulletmark/edid-rw")
	   (commit version)))
       (sha256
        (base32
         "0xfgdj4i7hr3ldb0xwd5qwlfk4m348n56941kqsx4jfvl7sgy9ac"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
          #:use-setuptools? #f
#:phases
		  #~(modify-phases %standard-phases
		  (delete 'build)
		  (replace 'install
		  (lambda* _
		  (mkdir "bin")
		  (install-file "edid-rw" "bin/edid-rw"))))))
	(native-inputs (list perl))
	(inputs (list edid-decode python-smbus i2c-tools))
    (home-page
     "https://sourceforge.net/projects/wxedid/")
    (synopsis
     "Extended Display Identification Data editor")
    (description "This package provides wxWidgets-based EDID (Extended Display
Identification Data) editor.")
    (license license:gpl3+)))

(define-public python-smbus
  (package
    (name "python-smbus")
    (version "1.1.post2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "smbus" version))
        (sha256
          (base32 "1ijm13lpf5xp55vcxjm5dxjizfipvkqk8xliljl5605119g38vgr"))))
    (build-system python-build-system)
	(inputs (list i2c-tools))
    (home-page "https://i2c.wiki.kernel.org/index.php/I2C_Tools")
    (synopsis "Python bindings for Linux SMBus access through i2c-dev")
    (description "Python bindings for Linux SMBus access through i2c-dev")
    (license #f)))
