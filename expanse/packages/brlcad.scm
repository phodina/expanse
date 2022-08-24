(define-module (expanse packages brlcad)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages code)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages image)
  #:use-module (gnu packages netpbm)
  #:use-module (gnu packages re2c)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public brlcad
  (package
    (name "brlcad")
    (version "7.32.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/BRL-CAD/brlcad")
	   (commit "rel-7-32-6")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c78m8bdysy7sh01vyziqmczqpyc6pwz4h5wqf735i70k2f58whg"))))
    (build-system cmake-build-system)
    (native-inputs (list astyle doxygen re2c swig))
	(inputs (list gdal libpng libxcb netpbm tcl))
    (home-page "http://brlcad.org/")
    (synopsis "Combinatorial solid modeling system")
    (description "combinatorial
solid modeling system that includes an interactive 3D solid geometry
editor, a network-distributed symmetric multiprocessing (SMP)
high-performance ray-tracer with support for rendering and geometric
analysis, image and signal-processing tools, a system performance
analysis benchmark suite, a flexible geometry scripting interface, 
and a high-performance geometric representation and analysis library")
    (license license:gpl3+)))
