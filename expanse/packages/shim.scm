(define-module (expanse packages shim)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages efi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages vim)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public shim
  (package
    (name "shim")
    (version "15.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/rhboot/shim")
	   (recursive? #t)
	   (commit version)))
       (sha256
        (base32
         ;"134icjfx0j0gy8n30x5b8sn4bv6bi5qdk4amcx4drjrj0l44kqlc"))))
         "0h8kxw1jb1bqvnbbqyvp2f8glgyzcscfmvgyh43bjlw3ap0j09zi"))))
    (build-system gnu-build-system)
	(arguments
	(list #:test-target "test"
	      #:phases
	      #~(modify-phases %standard-phases
;		     (add-before 'build 'fix-efi-path
;			 (lambda*  (#:key inputs #:allow-other-keys)
;			 (substitute* "Make.defaults"
;			 (("\\$\\(TOPDIR\\)/gnu-efi/inc") (string-append  #$gnu-efi
;			 "/include/efi")))
;			 ))
		     (delete 'configure))))
	(native-inputs (list xxd efivar))
	(inputs (list gnu-efi))
    (home-page
     "https://github.com/rhboot/shim")
    (synopsis
     "First-stage UEFI bootloader")
    (description
     "This package provides first-stage UEFI bootloader")
    (license license:expat)))
