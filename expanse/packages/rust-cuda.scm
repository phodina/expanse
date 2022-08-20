(define-module (expanse packages rust-cuda)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-cuda
  (package
    (name "rust-cuda")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/Rust-GPU/Rust-CUDA")
	   (commit version)))
       (sha256
        (base32
         "10jmiabr3kvfb89hyzasgr36czdgg6piwpcznb1ndfv8kabzfqan"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/Rust-GPU/Rust-CUDA")
    (synopsis
     "Libraries and tools for fast GPU code in Rust")
    (description
     "")
    (license license:asl2.0)))
