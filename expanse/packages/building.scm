(define-module (expanse packages building)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

;; http://openifcmodel.cs.auckland.ac.nz/Model
(define-public ifcpluplus
  (package
    (name "ifcplusplus")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ifcquery/ifcplusplus")
	   (commit version)))
       (sha256
        (base32
         "1pv2csvmgw0f4yj00px6nhcdrb204gxd68i25syr3ryz4s0sdn9r"))))
    (build-system cmake-build-system)
    (inputs (list openscenegraph qtbase-5))
    (home-page
     "http://www.ifcquery.com/")
    (synopsis
     "Library for IFC files in STEP format")
    (description
     "This package provides a library for IFC files in STEP format.")
    (license license:expat)))

;; https://osarch.org/
(define-public ifcopenshell
  (package
    (name "ifcopenshell")
    (version "220209")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ifcquery/ifcplusplus")
	   (commit (string-append "blenderbim-" version))))
       (sha256
        (base32
         "5k1rifz8x6qcicmx2is9vgxcj0qb2f5pvzrp7zhmvbmci3yack3f"))))
    (build-system cmake-build-system)
    (inputs (list boost opencascade qtbase-5))
    (home-page
     "http://ifcopenshell.org/")
    (synopsis
     "Library for the Industry Foundation Classes file format.")
    (description
     "This package provides a library for IFC files in STEP format.")
    (license license:lgpl3+)))
