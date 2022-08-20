(define-module (expanse packages rustboot)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rustboot
 (let ((commit "df1a23556c8e44bd3524da7435046755b7992702")
      (revision "1"))
  (package
    (name "rustboot")
    (version "")
    (home-page "https://github.com/nihalpasham/rustBoot")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1qa65dfhc3s0lli70jjcj7bmhnfdsp1q4913myp2pdibd1jmgcz4"))))
    (build-system cargo-build-system)
	(arguments
	`(#:cargo-inputs
      #:cargo-development-inputs
	  ))
    (synopsis
     "Standalone secure bootloader in Rust")
    (description
     "")
    (license license:expat))))

(define-public rustboot-signer
 (let ((commit "df1a23556c8e44bd3524da7435046755b7992702")
      (revision "1"))
  (package
    (name "rustboot-signer")
    (version "")
    (home-page "https://github.com/nihalpasham/rustBoot")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1qa65dfhc3s0lli70jjcj7bmhnfdsp1q4913myp2pdibd1jmgcz4"))))
    (build-system cargo-build-system)
	(arguments
	`(#:cargo-inputs
      #:cargo-development-inputs
	  ))
    (synopsis
     "Standalone secure bootloader in Rust")
    (description
     "")
    (license license:expat))))

(define-public rustboot-xtask
 (let ((commit "df1a23556c8e44bd3524da7435046755b7992702")
      (revision "1"))
  (package
    (name "rustboot-xtask")
    (version "")
    (home-page "https://github.com/nihalpasham/rustBoot")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1qa65dfhc3s0lli70jjcj7bmhnfdsp1q4913myp2pdibd1jmgcz4"))))
    (build-system cargo-build-system)
	(arguments
	`(#:cargo-inputs
      #:cargo-development-inputs
	  ))
    (synopsis
     "Standalone secure bootloader in Rust")
    (description
     "")
    (license license:expat))))
