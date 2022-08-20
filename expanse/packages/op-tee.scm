(define-module (expanse packages op-tee)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public op-tee
  (package
    (name "op-tee")
    (version "3.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/OP-TEE/optee_client")
	   (commit version)))
       (sha256
        (base32
         "10mhzfbwn61xan958kqvz6jzwf3273c2xli2i3j4hvqkl6vjvdrp"))))
    (build-system cmake-build-system)
	(arguments
	`(#:tests? #f)) ; no test suite
    (home-page
     "https://github.com/msm8916-mainline/lk2nd")
    (synopsis
     "Normal World Client side of the TEE")
    (description
     "This package provides normal World Client side of the TEE.")
    (license license:bsd-2)))
