(define-module (expanse packages darling)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module ((guix licenses) #:prefix license:))

(define-public darling
 (package
  (name "darling")
  (version "0.1.20210224")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/darlinghq/darling")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0sxgwvzm8z6chhv57pkmvfvq73f48xh102y9921vj4qqwi4jjy85"))))
  (build-system cmake-build-system)
  (native-inputs (list bison flex pkg-config))
  (inputs (list libcap zlib bzip2 libxml2 libxslt openssl nghttp2 openldap
  mit-krb5 curl xz pcre sqlite linux-pam ffmpeg pulseaudio))
  ;; https://docs.darlinghq.org/build-instructions.html
  ;; https://aur.archlinux.org/packages/darling/
  (synopsis "Darwin/macOS emulation layer for Linux")
  (description "")
  (home-page "https://darlinghq.org")
  (license license:gpl3+)))
