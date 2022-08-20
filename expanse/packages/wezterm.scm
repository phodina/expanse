(define-module (expanse packages wezterm)
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

(define-public rust-k9-0.11
  (package
    (name "rust-k9")
    (version "0.11.5")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "k9" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09x6ayz806i8m7px10saipyikiwd7lqwra5xi8jbhmy4g8z4wh6n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1) ("rust-colored" ,rust-colored-1)
        ("rust-diff" ,rust-diff-0.1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-syn" ,rust-syn-1)
        ("rust-term-size" ,rust-term-size-0.3))))
    (home-page "https://github.com/aaronabramov/k9")
    (synopsis "rust testing library")
    (description "rust testing library")
    (license license:expat)))

(define-public rust-wezterm-bidi-0.1
  (package
    (name "rust-wezterm-bidi")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "wezterm-bidi" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0wyn8ip8s7v7mhp8m0lwjqb1frkafa65m758q98d8vdjc3wb4xbx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-log" ,rust-log-0.4) ("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs
       (("rust-k9" ,rust-k9-0.11) ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4))))
    (home-page "https://github.com/wez/wezterm")
    (synopsis "The Unicode Bidi Algorithm (UBA)")
    (description "The Unicode Bidi Algorithm (UBA)")
    (license license:expat)))
