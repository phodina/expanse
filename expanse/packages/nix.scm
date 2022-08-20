(define-module (expanse packages nix)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages qt)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-treelib
  (package
    (name "python-treelib")
    (version "1.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "treelib" version))
        (sha256
          (base32 "1247rv9fbb8pw3xbkbz04q3vnvvva3hcw002gp1clp5psargzgqw"))))
    (build-system python-build-system)
    (propagated-inputs (list python-future))
    (home-page "https://github.com/caesar0301/treelib")
    (synopsis "A Python 2/3 implementation of tree structure.")
    (description
      "This package provides a Python 2/3 implementation of tree structure.")
    (license license:asl2.0)))

(define-public nix-gui
(let ((commit "9a469796e213a01a863fd1652d430b62990f9757")
      (revision "1"))
  (package
    (name "nix-gui")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/nix-gui/nix-gui")
	   (commit commit)))
       (sha256
        (base32
         "1wgyghxy6giv5zmipks8rdjsp3f21mfw13fv3ga31nv8wgl51is1"))))
    (build-system python-build-system)
	(arguments
	`(#:tests? #f
	  #:phases
	  (modify-phases %standard-phases
	  (delete 'sanity-check))))
	(inputs (list nix python-pypandoc python-treelib python-pyqt))
    (home-page
     "https://github.com/nix-gui/nix-gui")
    (synopsis
     "Using NixOS without coding")
    (description
  "")
    (license license:expat))))
