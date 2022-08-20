(define-module (expanse packages rufus)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public usbimager
  (package
    (name "usbimager")
    (version "1.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.com/bztsrc/usbimager/")
	   (commit version)))
       (sha256
        (base32
         "1j0g1anmdwc3pap3m4kfzqjfkn7q0vpmqniii2kcz7svs5h3ybga"))))
    (build-system gnu-build-system)
	(arguments
	`(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
	  #:phases
	  (modify-phases %standard-phases
	   (add-after 'unpack 'enter-src
	    (lambda* _
		 (chdir "src")))
	   (delete 'configure))))
	(inputs (list bzip2 libx11 xz zlib zstd))
    (home-page
     "https://gitlab.com/bztsrc/usbimager/")
    (synopsis
     "Write compressed disk images to USB drives")
    (description
     "This package provides a utility that helps format and create bootable
USB flash drives.")
    (license license:expat)))
