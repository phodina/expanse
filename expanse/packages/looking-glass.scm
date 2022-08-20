(define-module (expanse packages looking-glass)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages music)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module ((guix licenses) #:prefix license:))

(define-public looking-glass
  (package
    (name "looking-glass")
    (version "B5")
    (home-page "https://github.com/gnif/LookingGlass")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "09adk5zmz1j7vd79lkmlq2sd3qw8b6grdl5pqlph4c4c6vqsy7l7"))))
	(build-system cmake-build-system)
	(arguments
	(list #:phases
	 #~(modify-phases %standard-phases
	    (add-after 'unpack 'cd-client
		 (lambda* _
		  (chdir "client"))))))
    (synopsis
     "Low latency KVMFR implementation for guests with VGA PCI Passthrough")
	(description "")
	(license license:gpl2+)))
