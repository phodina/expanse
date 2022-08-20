(define-module (expanse packages touch)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-ioctl-sys-0.5
  (package
    (name "rust-ioctl-sys")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "ioctl-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0jjh6fggwd9akklwcgcqyz9ijd79k6yskkx7ijmfm5i46lk4nb2y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/jmesmon/ioctl")
    (synopsis
     "IO Control for POSIX-and-beyond systems (core fn & macros, see `ioctls` for many ioctl definitions)")
    (description
     "IO Control for POSIX-and-beyond systems (core fn & macros, see `ioctls` for many
ioctl definitions)")
    (license (list license:expat license:asl2.0))))

(define-public rust-uinput-sys-0.1
  (package
    (name "rust-uinput-sys")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "uinput-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1iyanb28r2vhqp2sgxpwzasivjvnn9mk9azy19hdvjjc2zcdvaws"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-ioctl-sys" ,rust-ioctl-sys-0.5) ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/meh/rust-uinput-sys")
    (synopsis "Linux uinput definitions.")
    (description "Linux uinput definitions.")
    (license license:wtfpl2)))

(define-public rust-nix-0.10
  (package
    (name "rust-nix")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "nix" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17w38rr50nrnijwhxma4ln4rl9si41glxgfgc9j69nizs60mdzdp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1) ("rust-bytes" ,rust-bytes-0.4)
        ("rust-cfg-if" ,rust-cfg-if-0.1)
        ("rust-gcc" ,rust-gcc-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-void" ,rust-void-1))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-libudev-sys-0.1
  (package
    (name "rust-libudev-sys")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libudev-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09236fdzlx9l0dlrsc6xx21v5x8flpfm3d5rjq9jr5ivlas6k11w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/dcuddeback/libudev-sys")
    (synopsis "FFI bindings to libudev")
    (description "FFI bindings to libudev")
    (license license:expat)))

(define-public rust-libudev-0.2
  (package
    (name "rust-libudev")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libudev" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1znwjh088qrar0sckzm8h26sw34p4q4g9m5wwfpcb8a0vwxnsqpa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-libudev-sys" ,rust-libudev-sys-0.1))))
    (home-page "https://github.com/dcuddeback/libudev-rs")
    (synopsis "Rust wrapper for libudev")
    (description "Rust wrapper for libudev")
    (license license:expat)))

(define-public rust-enum-derive-0.1
  (package
    (name "rust-enum-derive")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "enum_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "05n8mdca3y2c8pvl1isncj52fa80wplvx28lxvwqmpzfr6lc4sj0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/DanielKeep/rust-custom-derive")
    (synopsis
     "This crate provides macros for deriving additional functionality for enums.")
    (description
     "This crate provides macros for deriving additional functionality for enums.")
    (license (list license:expat license:asl2.0))))

(define-public rust-uinput-0.1
  (package
    (name "rust-uinput")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "uinput" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0nv84siqzw89k2lnj4r9wfld1vhc9ja3zzk3l24jmqqbr5als1wb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-custom-derive" ,rust-custom-derive-0.1) ("rust-enum-derive" ,rust-enum-derive-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-libudev" ,rust-libudev-0.2)
                       ("rust-nix" ,rust-nix-0.10)
                       ("rust-uinput-sys" ,rust-uinput-sys-0.1))))
    (home-page "https://github.com/meh/rust-uinput")
    (synopsis "Linux uinput wrapper.")
    (description "Linux uinput wrapper.")
    (license license:wtfpl2)))

(define-public rust-sorted-vec-0.8
  (package
    (name "rust-sorted-vec")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "sorted-vec" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0rnk120vdyg4lr81mbs28xjqd6b7xxakfbshkp8a8xs1q8vxp3ns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs
       (("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://gitlab.com/spearman/sorted-vec")
    (synopsis "Create and maintain sorted vectors and vector-backed sets")
    (description "Create and maintain sorted vectors and vector-backed sets")
    (license license:asl2.0)))

(define-public rust-ron-0.7
  (package
    (name "rust-ron")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "ron" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0y6n0cpgkv9cnj411ipk86gvwrhxs1hb64m5hrwcjfp4mp51x1hv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-base64" ,rust-base64-0.13) ("rust-bitflags" ,rust-bitflags-1)
                       ("rust-indexmap" ,rust-indexmap-1)
                       ("rust-serde" ,rust-serde-1))
       #:cargo-development-inputs
       (("rust-serde-bytes" ,rust-serde-bytes-0.11) ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/ron-rs/ron")
    (synopsis "Rusty Object Notation")
    (description "Rusty Object Notation")
    (license (list license:expat license:asl2.0))))

(define-public rust-libc-0.2
  (package
    (name "rust-libc")
    (version "0.2.126")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libc" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0diqlpap4pq81284368vffjwvp9jg9hp2x03s7hlk2yj3icmm79l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.
")
    (description "Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nix-0.24
  (package
    (name "rust-nix")
    (version "0.24.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "nix" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1sa16i3916lgmrqxghmv50bxz87j42xrfbp3m1dd1b04g4qdy5wg"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1) ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-memoffset" ,rust-memoffset-0.6))
       #:cargo-development-inputs
       (("rust-assert-impl" ,rust-assert-impl-0.1) ("rust-caps" ,rust-caps-0.5)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-parking-lot" ,rust-parking-lot-0.11)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-semver" ,rust-semver-1)
        ("rust-sysctl" ,rust-sysctl-0.1)
        ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-libudev-sys-0.1
  (package
    (name "rust-libudev-sys")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "libudev-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "09236fdzlx9l0dlrsc6xx21v5x8flpfm3d5rjq9jr5ivlas6k11w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/dcuddeback/libudev-sys")
    (synopsis "FFI bindings to libudev")
    (description "FFI bindings to libudev")
    (license license:expat)))

(define-public rust-udev-0.6
  (package
    (name "rust-udev")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "udev" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1l2x1d9h80flzdwvlz9f3bkryzyk8m3kcv59a7cfw5p8yxj0g5hw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-libudev-sys" ,rust-libudev-sys-0.1)
        ("rust-mio" ,rust-mio-0.8)
        ("rust-mio" ,rust-mio-0.7)
        ("rust-mio" ,rust-mio-0.6)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/Smithay/udev-rs")
    (synopsis "libudev bindings for Rust")
    (description "libudev bindings for Rust")
    (license license:expat)))

(define-public rust-input-sys-1
  (package
    (name "rust-input-sys")
    (version "1.16.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "input-sys" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0cqrar5zid2vdb0rb40ybycpfc0rwpd6q3v03h4mvfsym6fq97g0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.57) ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/Drakulix/input.rs/tree/master/input-sys")
    (synopsis "Bindgen generated unsafe libinput wrapper")
    (description "Bindgen generated unsafe libinput wrapper")
    (license license:expat)))

(define-public rust-input-0.7
  (package
    (name "rust-input")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "input" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0pw17g2kj7z7j21w38j346mkrkl8gb361mzvy4zb5jfs4zpl0mpr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitflags" ,rust-bitflags-1) ("rust-input-sys" ,rust-input-sys-1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-udev" ,rust-udev-0.6))
       #:cargo-development-inputs
       (("rust-nix" ,rust-nix-0.20))))
    (home-page "https://github.com/Drakulix/input.rs")
    (synopsis "libinput bindings for rust")
    (description "libinput bindings for rust")
    (license license:expat)))

(define-public rust-strum-macros-0.24
  (package
    (name "rust-strum-macros")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "strum_macros" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1vyh8m1skr8h4f2lnhnq1r7v3mah545bp4k1p8z4svj42ydhfy38"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.4) ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-rustversion" ,rust-rustversion-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description "Helpful macros for working with enums and strings")
    (license license:expat)))

(define-public rust-strum-0.24
  (package
    (name "rust-strum")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "strum" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1y77vshrhm1grlgcfmnm0nxpsv0pb5zcb97zy6rbh106nz0wysp9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-strum-macros" ,rust-strum-macros-0.24))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description "Helpful macros for working with enums and strings")
    (license license:expat)))

(define-public rust-bpaf-derive-0.1
  (package
    (name "rust-bpaf-derive")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bpaf_derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "17n1dcq6qpr2ym0v71mpzcx8jzldcb60ybybfwphjkks0ic0zdjc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1) ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/pacak/bpaf")
    (synopsis "Derive macros for bpaf Command Line Argument Parser")
    (description "Derive macros for bpaf Command Line Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-bpaf-0.4
  (package
    (name "rust-bpaf")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bpaf" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "044i6ps96dhwf0jbi5ib45v6z00ki1b4grrmjaq0d6hf7wjq0nhw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bpaf-derive" ,rust-bpaf-derive-0.1))
       #:cargo-development-inputs
       (("rust-strum" ,rust-strum-0.24))))
    (home-page "https://github.com/pacak/bpaf")
    (synopsis "A simple Command Line Argument Parser with parser combinators")
    (description
     "This package provides a simple Command Line Argument Parser with parser
combinators")
    (license (list license:expat license:asl2.0))))

(define-public wzmach
  (package
    (name "wzmach")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/d86leader/wzmach")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1cg269nqlqdnkg9pd6fgvsfx833ldbmza9l5a8pzxj2kwf5c5mx3"))))
    (build-system cargo-build-system)
	(arguments
      `(#:cargo-inputs
	  (("rust-bpaf" ,rust-bpaf-0.4)
("rust-env-logger" ,rust-env-logger-0.9)
("rust-input" ,rust-input-0.7)
("rust-libc" ,rust-libc-0.2)
("rust-log" ,rust-log-0.4)
("rust-nix" ,rust-nix-0.24)
("rust-phf" ,rust-phf-0.10)
("rust-ron" ,rust-ron-0.7)
("rust-serde" ,rust-serde-1)
("rust-sorted-vec" ,rust-sorted-vec-0.8)
("rust-thiserror" ,rust-thiserror-1)
("rust-uinput" ,rust-uinput-0.1))))
	(native-inputs (list pkg-config))
	(inputs (list eudev libinput))
    (home-page
     "https://github.com/d86leader/wzmach")
    (synopsis
     "Gesture engine for wayland")
    (description
     "")
    (license license:gpl3+)))
