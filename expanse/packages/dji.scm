(define-module (expanse packages dji)
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

(define-public dji-firmware-tools
(let ((commit "08ccc8d84b3776f53a27a9d220fcb943734a8284")
      (revision "1"))
  (package
    (name "dji-firmware-tools")
    (version "0")
    (home-page "https://github.com/o-gs/dji-firmware-tools")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	    (url home-page)
		(commit commit)))
       (sha256
        (base32
         "0jgxaxg6z0lxx896jjl9jni2jaqcgvxxkncw469yfhdk74n5y8vr"))))
    (build-system python-build-system)
	(arguments
	(list #:use-setuptools? #f
	      #:tests? #f
		  #:phases #~(modify-phases %standard-phases
		  (replace 'install
		  (lambda* (#:key outputs #:allow-other-keys)
		  (copy-recursively "." (string-append #$output "/bin"))))
		  (delete 'build))))
    (synopsis
     "DJI Firmware Tools")
    (description "This package provides tools for handling firmwares of DJI
	products.") 
    (license license:gpl3+))))
