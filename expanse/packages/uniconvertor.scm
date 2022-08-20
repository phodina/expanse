(define-module (expanse packages uniconvertor)
  #:use-module (gnu packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages ghostscript)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-reportlab
  (package
    (name "python-reportlab")
    (version "3.6.9")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "reportlab" version))
        (sha256
          (base32 "117v93jnndq3c4qpqlcyh1yp7avyskkzznzna0qj3ban4ilc632x"))))
    (build-system python-build-system)
	(inputs (list freetype libart-lgpl))
    (propagated-inputs (list python-pillow))
    (home-page "http://www.reportlab.com/")
    (synopsis "The Reportlab Toolkit")
    (description "The Reportlab Toolkit")
    (license license:bsd-3)))

(define-public python-uniconvertor
(let ((commit "973d5b6f8fccce7e7bf9bc88e91bc80f9f9d9472")
      (revision "1"))
  (package
    (name "python-uniconvertor")
    (version (git-version "2.0-pre" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sk1project/uniconvertor")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0047cj4m9wgc9rf59gr9akxyhd34a98mlkbq8155w2yqv1piga1v"))))
    (build-system python-build-system)
	(inputs (list cairo
lcms
;libmagickwand
pango
python-cairosvg
python-pillow))
;python-reportlab))
    (home-page "https://sk1project.net/")
    (synopsis "Universal vector graphics translator")
    (description "This package provides tool to convert between various
	vector graphics formats.")
    (license license:agpl3+))))
