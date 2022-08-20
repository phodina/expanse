(define-module (expanse packages windows)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public libsasl2
  (package
    (name "libsasl2")
    (version "2.1.28")
    (source
     (origin
       (method url-fetch)
       (uri
	   (string-append
	   "https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-"
	   version "/cyrus-sasl-" version ".tar.gz"))
       (sha256
        (base32
         "135kbgyfpa1mwqp5dm223yr6ddzi4vjm7cr414d7rmhys2mwdkvw"))))
    (build-system gnu-build-system)
    (home-page "https://www.cyrusimap.org/sasl/")
    (synopsis
     "")
    (description
     "")
    (license license:bsd-4)))

(define-public sasl-xoauth2
  (package
    (name "sasl-xoauth2")
    (version "0.8")
    (home-page "https://github.com/tarickb/sasl-xoauth2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "release-" version))))
       (sha256
        (base32
         "1jdgxvzh7mbfckapgr0cbhssih73hcllwr670pg6klb03p7bpy81"))))
    (build-system cmake-build-system)
;	(arguments
;	'(#:make-flags '("-DCFLAGS=-Werror=pessimizing-move")))
	(native-inputs (list pkg-config))
	(inputs (list curl jsoncpp libsasl2))
    (synopsis
     "SASL plugin for XOAUTH2")
    (description
     "This package provides SASL plugin that enables client side use of OAuth
	 2.0.  Among other things it enables the use of Gmail or Outlook/Office 365
	 SMTP relays from Postfix.")
    (license license:asl2.0)))

(define-public quibble
  (package
    (name "quibble")
    (version "20210111")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/maharmstone/quibble")
	   (commit version)))
       (sha256
        (base32
         "5rx23gy7ism0qkl4lf86kw8rf9bc79jfrx2zysanxp67yn8z07ia"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/maharmstone/quibble")
    (synopsis
     "Custom Windows bootloader")
    (description
     "This package provides custom Windows bootloader.")
    (license license:lgpl3)))

(define-public ntfs2btrfs
  (package
    (name "ntfs2btrfs")
    (version "20210923")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/maharmstone/ntfs2btrfs")
	   (commit version)))
       (sha256
        (base32
         "11l284v9ykdiwilmqy7yv13r8x6h5k1as47p1r14pwqcr4jp8r8h"))))
    (build-system cmake-build-system)
	;(native-inputs (list extra-cmake-modules))
    (home-page
     "https://github.com/maharmstone/ntfs2btrfs")
    (synopsis
     "Tool to convert in-place NTFS into BTRFS")
    (description
     "")
    (license license:gpl2)))

(define-public cassowary
  (package
    (name "cassowary")
    (version "0.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/casualsnek/cassowary")
	   (commit version)))
       (sha256
        (base32
         "22l284v9ykdiwilmqy7yv13r8x6h5k1as47p1r14pwqcr4jp8r8h"))))
    (build-system cmake-build-system)
; python3 python3-pip freerdp libvirt-python
;pip3 install PyQt5
	;(native-inputs (list extra-cmake-modules))
    (home-page
     "https://github.com/maharmstone/ntfs2btrfs")
    (synopsis
     "Run Windows Applications on Linux as if they are native")
    (description
     "")
    (license license:gpl2)))
