(define-module (expanse packages zen)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages bootloaders)
  #:use-module ((guix licenses) #:prefix license:))

(define linux-zen
  (package
   (inherit linux-libre-arm64-generic)
   (name "linux-zen")
   (version "5.18.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	 (url "https://github.com/zen-kernel/zen-kernel")
	 (commit (string-append "v"  version "-zen1"))))
     (sha256
      (base32
       "1mha9s656cn6g5y02ynbs582r49q9gfdj9a6nbp2fdir9wndy8ic"))))))

;linux-zen
