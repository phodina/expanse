(define-module (expanse packages openct)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages security-token)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public pcsc-tools
  (package
    (name "pcsc-tools")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/LudovicRousseau/pcsc-tools")
	   (commit version)))
       (sha256
        (base32
         "0931gb6ds9fm51ajnmp37pac3hdvijx4jikpz4a52al6gg3ynkby"))))
    (build-system gnu-build-system)
;	(arguments
;	(list 
;	 #:configure-flags #~(list "--localstatedir=/var")
;	 #:phases
;	 #~(modify-phases %standard-phases
;	    (add-before 'install 'create-etc-dir
;	     (lambda* _
;	      (mkdir-p (string-append #$output "/etc")))))))
	(native-inputs (list autoconf automake pkg-config))
	(inputs (list pcsc-lite perl))
    (home-page
     "http://ludovic.rousseau.free.fr/softwares/pcsc-tools/")
    (synopsis
     "Tools to be used with smart cards and PC/SC ")
    (description
     "")
    (license license:gpl2+)))
