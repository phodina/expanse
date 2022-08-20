(define-module (expanse packages czkawka)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-slice-deque-0.3
  (package
    (name "rust-slice-deque")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "slice-deque" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "098gvqjw52qw4gac567c9hx3y6hw9al7hjqb5mnvmvydh3i6xvri"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-mach" ,rust-mach-0.3)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gnzlbg/slice_deque")
    (synopsis "A double-ended queue that Deref's into a slice.")
    (description
      "This package provides a double-ended queue that Deref's into a slice.")
    (license (list license:expat license:asl2.0))))

(define-public rust-minimp3-sys-0.3
  (package
    (name "rust-minimp3-sys")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "minimp3-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "144vmf3s89kad0smjprzigcp2c9r5dm95n4ydilrbp399irp6772"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/germangb/minimp3-rs.git")
    (synopsis "Rust bindings for the minimp3 library.")
    (description "Rust bindings for the minimp3 library.")
    (license license:expat)))

(define-public rust-minimp3-0.5
  (package
    (name "rust-minimp3")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "minimp3" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0wj3nzj1swnvwsk3a4a3hkfj1d21jsi7babi40wlrxzbbzvkhm4q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-minimp3-sys" ,rust-minimp3-sys-0.3)
         ("rust-slice-deque" ,rust-slice-deque-0.3)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/germangb/minimp3-rs.git")
    (synopsis "Rust bindings for the minimp3 library.")
    (description "Rust bindings for the minimp3 library.")
    (license license:expat)))

(define-public rust-ogg-0.8
  (package
    (name "rust-ogg")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ogg" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0vjxmqcv9252aj8byy70iy2krqfjknfcxg11lcyikj11pzlb8lb9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1)
         ("rust-bytes" ,rust-bytes-0.4)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/RustAudio/ogg")
    (synopsis "Ogg container decoder and encoder written in pure Rust")
    (description "Ogg container decoder and encoder written in pure Rust")
    (license license:bsd-3)))

(define-public rust-lewton-0.10
  (package
    (name "rust-lewton")
    (version "0.10.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lewton" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0c60fn004awg5c3cvx82d6na2pirf0qdz9w3b93mbcdakbglhyvp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-ogg" ,rust-ogg-0.8)
         ("rust-tinyvec" ,rust-tinyvec-1)
         ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/RustAudio/lewton")
    (synopsis "Pure Rust vorbis decoder")
    (description "Pure Rust vorbis decoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-hound-3
  (package
    (name "rust-hound")
    (version "3.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hound" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0jbm25p2nc8758dnfjan1yk7hz2i85y89nrbai14zzxfrsr4n5la"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/ruuda/hound")
    (synopsis "A wav encoding and decoding library")
    (description "This package provides a wav encoding and decoding library")
    (license license:asl2.0)))

(define-public rust-stdweb-0.1
  (package
    (name "rust-stdweb")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stdweb" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gjk7ch31a3kgdc39kj4zqinf10yqaf717wanh9kwwbbwg430m7g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-clippy" ,rust-clippy-0.0.302)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/koute/stdweb")
    (synopsis "A standard library for the client-side Web")
    (description
      "This package provides a standard library for the client-side Web")
    (license (list license:expat license:asl2.0))))

(define-public rust-webpki-roots-0.22
  (package
    (name "rust-webpki-roots")
    (version "0.22.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "webpki-roots" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0jbll0ys9jakrvv3l1i216bbgj7jbxr7ad2dihw28xcm7s8fnb2m"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-webpki" ,rust-webpki-0.22))))
    (home-page "https://github.com/rustls/webpki-roots")
    (synopsis "Mozilla's CA root certificates for use with webpki")
    (description "Mozilla's CA root certificates for use with webpki")
    (license license:mpl2.0)))

(define-public rust-rustls-pemfile-0.2
  (package
    (name "rust-rustls-pemfile")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustls-pemfile" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1jfi97lqnnnnxhmfy6ygrsp0x70m8wsdpaw45svvz1qc6vmymssy"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-base64" ,rust-base64-0.13))))
    (home-page "https://github.com/rustls/pemfile")
    (synopsis "Basic .pem file parser for keys and certificates")
    (description "Basic .pem file parser for keys and certificates")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-rustls-native-certs-0.6
  (package
    (name "rust-rustls-native-certs")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustls-native-certs" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hq9h3kri19kv00gvbq61h21rarqadxh6y98wj0c2gvxlbgypaaw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-openssl-probe" ,rust-openssl-probe-0.1)
         ("rust-rustls-pemfile" ,rust-rustls-pemfile-0.2)
         ("rust-schannel" ,rust-schannel-0.1)
         ("rust-security-framework" ,rust-security-framework-2))))
    (home-page "https://github.com/ctz/rustls-native-certs")
    (synopsis
      "rustls-native-certs allows rustls to use the platform native certificate store")
    (description
      "rustls-native-certs allows rustls to use the platform native certificate store")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-webpki-0.22
  (package
    (name "rust-webpki")
    (version "0.22.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "webpki" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1gd1gxip5kgdwmrvhj5gjxij2mgg2mavq1ych4q1h272ja0xg5gh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-ring" ,rust-ring-0.16)
         ("rust-untrusted" ,rust-untrusted-0.7))))
    (home-page "https://github.com/briansmith/webpki")
    (synopsis "Web PKI X.509 Certificate Verification.")
    (description "Web PKI X.509 Certificate Verification.")
    (license #f)))

(define-public rust-sct-0.7
  (package
    (name "rust-sct")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sct" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "193w3dg2pcn7138ab4c586pl76nkryn4h6wqlwvqj5gqr6vwsgfm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-ring" ,rust-ring-0.16)
         ("rust-untrusted" ,rust-untrusted-0.7))))
    (home-page "https://github.com/ctz/sct.rs")
    (synopsis "Certificate transparency SCT verification library")
    (description "Certificate transparency SCT verification library")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-rustls-0.20
  (package
    (name "rust-rustls")
    (version "0.20.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustls" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "111z24faq1i1z3gbznfgl7qp3in2fx1y1adijjsl1q7kj0i5wznk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-ring" ,rust-ring-0.16)
         ("rust-sct" ,rust-sct-0.7)
         ("rust-webpki" ,rust-webpki-0.22))))
    (home-page "https://github.com/rustls/rustls")
    (synopsis "Rustls is a modern TLS library written in Rust.")
    (description "Rustls is a modern TLS library written in Rust.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-cc-1
  (package
    (name "rust-cc")
    (version "1.0.72")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1vl50h2qh0nh0iddzj6gd1pnxnxpvwmbfxc30578c1pajmxi7a92"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-jobserver" ,rust-jobserver-0.1))))
    (home-page "https://github.com/alexcrichton/cc-rs")
    (synopsis
      "A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
")
    (description
      "This package provides a build-time dependency for Cargo build scripts to assist
in invoking the native C compiler to compile native C code into a static archive
to be linked into Rust code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cloudflare-zlib-sys-0.3
  (package
    (name "rust-cloudflare-zlib-sys")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cloudflare-zlib-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0vyd0l0vprvh9hc1ikllybrk8xc0lz9f509d2xgxgrpyxp8vch10"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/cloudflare/zlib")
    (synopsis "Cloudflare fork of zlib with massive performance improvements")
    (description
      "Cloudflare fork of zlib with massive performance improvements")
    (license (list license:expat license:zlib license:asl2.0 license:zlib))))

(define-public rust-flate2-1
  (package
    (name "rust-flate2")
    (version "1.0.22")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "flate2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gy5iwfqylb2f0dd9n7r8w2xwbzlrqlsairvyj2w9jf1jzl8hs8y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-cloudflare-zlib-sys" ,rust-cloudflare-zlib-sys-0.3)
         ("rust-crc32fast" ,rust-crc32fast-1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libz-sys" ,rust-libz-sys-1)
         ("rust-miniz-sys" ,rust-miniz-sys-0.1)
         ("rust-miniz-oxide" ,rust-miniz-oxide-0.4)
         ("rust-tokio-io" ,rust-tokio-io-0.1))))
    (home-page "https://github.com/rust-lang/flate2-rs")
    (synopsis
      "DEFLATE compression and decompression exposed as Read/BufRead/Write streams.
Supports miniz_oxide, miniz.c, and multiple zlib implementations. Supports
zlib, gzip, and raw deflate streams.
")
    (description
      "DEFLATE compression and decompression exposed as Read/BufRead/Write streams.
Supports miniz_oxide, miniz.c, and multiple zlib implementations.  Supports
zlib, gzip, and raw deflate streams.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-macros-0.1
  (package
    (name "rust-time-macros")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "time-macros" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1wg24yxpxcfmim6dgblrf8p321m7cyxpdivzvp8bcb7i4rp9qzlm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
         ("rust-time-macros-impl" ,rust-time-macros-impl-0.1))))
    (home-page "https://github.com/time-rs/time")
    (synopsis "Procedural macros for the time crate.")
    (description "Procedural macros for the time crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-standback-0.2
  (package
    (name "rust-standback")
    (version "0.2.17")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "standback" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1zr8zy3kzryaggz3k0j4135m3zbd31pyqmja8cyj8yp07mpzn4z1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/jhpratt/standback")
    (synopsis "New standard library, old compiler.")
    (description "New standard library, old compiler.")
    (license (list license:expat license:asl2.0))))

(define-public rust-time-0.2
  (package
    (name "rust-time")
    (version "0.2.27")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "time" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hm209d078jfgxzjhi5xqim64q31rlj1h70zz57qbmpbirzsjlj7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-const-fn" ,rust-const-fn-0.4)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-serde" ,rust-serde-1)
         ("rust-standback" ,rust-standback-0.2)
         ("rust-stdweb" ,rust-stdweb-0.4)
         ("rust-time-macros" ,rust-time-macros-0.1)
         ("rust-version-check" ,rust-version-check-0.9)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://time-rs.github.io")
    (synopsis
      "Date and time library. Fully interoperable with the standard library. Mostly compatible with #![no_std].")
    (description
      "Date and time library.  Fully interoperable with the standard library.  Mostly
compatible with #![no_std].")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-normalization-0.1
  (package
    (name "rust-unicode-normalization")
    (version "0.1.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicode-normalization" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1yabhmg8zlcksda3ajly9hpbzqgbhknxwch8dwkfkaa1569r0ifm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-tinyvec" ,rust-tinyvec-1))))
    (home-page "https://github.com/unicode-rs/unicode-normalization")
    (synopsis
      "This crate provides functions for normalization of
Unicode strings, including Canonical and Compatible
Decomposition and Recomposition, as described in
Unicode Standard Annex #15.
")
    (description
      "This crate provides functions for normalization of Unicode strings, including
Canonical and Compatible Decomposition and Recomposition, as described in
Unicode Standard Annex #15.")
    (license (list license:expat license:asl2.0))))

(define-public rust-idna-0.2
  (package
    (name "rust-idna")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "idna" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1y7ca2w5qp9msgl57n03zqp78gq1bk2crqzg6kv7a542mdphm2j1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-matches" ,rust-matches-0.1)
         ("rust-unicode-bidi" ,rust-unicode-bidi-0.3)
         ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/servo/rust-url/")
    (synopsis
      "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (description
      "IDNA (Internationalizing Domain Names in Applications) and Punycode.")
    (license (list license:expat license:asl2.0))))

(define-public rust-cookie-store-0.15
  (package
    (name "rust-cookie-store")
    (version "0.15.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cookie_store" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0z0navy9k0ivrdvz492q8c4nhd3iv5l77hwfppskdp1j15607xxk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cookie" ,rust-cookie-0.15)
         ("rust-idna" ,rust-idna-0.2)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-publicsuffix" ,rust-publicsuffix-2)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-time" ,rust-time-0.2)
         ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/pfernie/cookie_store")
    (synopsis "Implementation of Cookie storage and retrieval")
    (description "Implementation of Cookie storage and retrieval")
    (license (list license:expat license:asl2.0))))

(define-public rust-hkdf-0.10
  (package
    (name "rust-hkdf")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hkdf" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0kwn3scjvv2x8zc6nz3wrnzxp9shpsdxnjqiyv2r65r3kiijzasi"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-digest" ,rust-digest-0.9) ("rust-hmac" ,rust-hmac-0.10))))
    (home-page "https://github.com/RustCrypto/KDFs/")
    (synopsis "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
    (description
      "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
    (license (list license:expat license:asl2.0))))

(define-public rust-aes-gcm-0.8
  (package
    (name "rust-aes-gcm")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "aes-gcm" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1nl8iwlh209y1vj9n2lm1a70i69clvg2z6x69bi4dgdrpgxbay2j"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-aead" ,rust-aead-0.3)
         ("rust-aes" ,rust-aes-0.6)
         ("rust-cipher" ,rust-cipher-0.2)
         ("rust-ctr" ,rust-ctr-0.6)
         ("rust-ghash" ,rust-ghash-0.3)
         ("rust-subtle" ,rust-subtle-2)
         ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/RustCrypto/AEADs")
    (synopsis
      "Pure Rust implementation of the AES-GCM (Galois/Counter Mode)
Authenticated Encryption with Associated Data (AEAD) Cipher
with optional architecture-specific hardware acceleration
")
    (description
      "Pure Rust implementation of the AES-GCM (Galois/Counter Mode) Authenticated
Encryption with Associated Data (AEAD) Cipher with optional
architecture-specific hardware acceleration")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cookie-0.15
  (package
    (name "rust-cookie")
    (version "0.15.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cookie" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "03gql9c2l0wg3hpfp67wg2ns21wysk0xsjxwdbjrf0s6grrcgwfm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-aes-gcm" ,rust-aes-gcm-0.8)
         ("rust-base64" ,rust-base64-0.13)
         ("rust-hkdf" ,rust-hkdf-0.10)
         ("rust-hmac" ,rust-hmac-0.10)
         ("rust-percent-encoding" ,rust-percent-encoding-2)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-sha2" ,rust-sha2-0.9)
         ("rust-subtle" ,rust-subtle-2)
         ("rust-time" ,rust-time-0.2)
         ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/SergioBenitez/cookie-rs")
    (synopsis
      "HTTP cookie parsing and cookie jar management. Supports signed and private
(encrypted, authenticated) jars.
")
    (description
      "HTTP cookie parsing and cookie jar management.  Supports signed and private
(encrypted, authenticated) jars.")
    (license (list license:expat license:asl2.0))))

(define-public rust-brotli-decompressor-2
  (package
    (name "rust-brotli-decompressor")
    (version "2.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "brotli-decompressor" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "102v89h9z0p45j5fsjna97761nxx9nxz9ccpwxma6p5zad32vbar"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
         ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2))))
    (home-page "https://github.com/dropbox/rust-brotli-decompressor")
    (synopsis
      "A brotli decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. Alternatively, --features=unsafe turns off array bounds checks and memory initialization but provides a safe interface for the caller.  Without adding the --features=unsafe argument, all included code is safe. For compression in addition to this library, download https://github.com/dropbox/rust-brotli ")
    (description
      "This package provides a brotli decompressor that with an interface avoiding the
rust stdlib.  This makes it suitable for embedded devices and kernels.  It is
designed with a pluggable allocator so that the standard lib's allocator may be
employed.  The default build also includes a stdlib allocator and stream
interface.  Disable this with --features=no-stdlib.  Alternatively,
--features=unsafe turns off array bounds checks and memory initialization but
provides a safe interface for the caller.  Without adding the --features=unsafe
argument, all included code is safe.  For compression in addition to this
library, download https://github.com/dropbox/rust-brotli ")
    (license (list license:bsd-3 license:expat))))

(define-public rust-ureq-2
  (package
    (name "rust-ureq")
    (version "2.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ureq" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1m8nzx683iph4zfpfg2xmkkbwmgf1i403lnbhxqk4gbsj8pzm6ck"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-base64" ,rust-base64-0.13)
         ("rust-brotli-decompressor" ,rust-brotli-decompressor-2)
         ("rust-chunked-transfer" ,rust-chunked-transfer-1)
         ("rust-cookie" ,rust-cookie-0.15)
         ("rust-cookie-store" ,rust-cookie-store-0.15)
         ("rust-encoding-rs" ,rust-encoding-rs-0.8)
         ("rust-flate2" ,rust-flate2-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-native-tls" ,rust-native-tls-0.2)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-rustls" ,rust-rustls-0.20)
         ("rust-rustls-native-certs" ,rust-rustls-native-certs-0.6)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-socks" ,rust-socks-0.3)
         ("rust-url" ,rust-url-2)
         ("rust-webpki" ,rust-webpki-0.22)
         ("rust-webpki-roots" ,rust-webpki-roots-0.22))))
    (home-page "https://github.com/algesten/ureq")
    (synopsis "Simple, safe HTTP client")
    (description "Simple, safe HTTP client")
    (license (list license:expat license:asl2.0))))

(define-public rust-fetch-unroll-0.3
  (package
    (name "rust-fetch-unroll")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fetch_unroll" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1l3cf8fhcrw354hdmjf03f5v4bxgn2wkjna8n0fn8bgplh8b3666"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libflate" ,rust-libflate-1)
         ("rust-tar" ,rust-tar-0.4)
         ("rust-ureq" ,rust-ureq-2))))
    (home-page "https://github.com/katyo/fetch_unroll")
    (synopsis "Simple utilities for fetching and unrolling .tar.gz archives")
    (description
      "Simple utilities for fetching and unrolling .tar.gz archives")
    (license license:asl2.0)))

(define-public rust-oboe-sys-0.4
  (package
    (name "rust-oboe-sys")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "oboe-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1gcl494yy880h2gfgsbdd32g2h0s1n94v58j5hil9mrf6yvsnw1k"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bindgen" ,rust-bindgen-0.59)
         ("rust-cc" ,rust-cc-1)
         ("rust-fetch-unroll" ,rust-fetch-unroll-0.3))))
    (home-page "https://github.com/katyo/oboe-rs")
    (synopsis
      "Unsafe bindings for oboe an android library for low latency audio IO")
    (description
      "Unsafe bindings for oboe an android library for low latency audio IO")
    (license license:asl2.0)))

(define-public rust-darling-macro-0.13
  (package
    (name "rust-darling-macro")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "darling_macro" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0jzljnd0y7idi5lb7lhvymh3nkhaf32ksx0d38hv7zjjfcxipi3j"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-darling-core" ,rust-darling-core-0.13)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
      "Internal support for a proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.
")
    (description
      "Internal support for a proc-macro library for reading attributes into structs
when implementing custom derives.  Use https://crates.io/crates/darling in your
code.")
    (license license:expat)))

(define-public rust-fnv-1
  (package
    (name "rust-fnv")
    (version "1.0.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fnv" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/servo/rust-fnv")
    (synopsis "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (description "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (license (list license:asl2.0 license:expat))))

(define-public rust-darling-core-0.13
  (package
    (name "rust-darling-core")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "darling_core" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0933k2avb6xk9j4ryr0bvp3pww5j8i0nrqvsnkgd3vic3lj0yd3s"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-fnv" ,rust-fnv-1)
         ("rust-ident-case" ,rust-ident-case-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-strsim" ,rust-strsim-0.10)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
      "Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives. Use https://crates.io/crates/darling in your code.
")
    (description
      "Helper crate for proc-macro library for reading attributes into structs when
implementing custom derives.  Use https://crates.io/crates/darling in your code.")
    (license license:expat)))

(define-public rust-darling-0.13
  (package
    (name "rust-darling")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "darling" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1x7pgzjswg28798zd5gk5g6nifhcaqq0apqmclydi39zd2w21myh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-darling-core" ,rust-darling-core-0.13)
         ("rust-darling-macro" ,rust-darling-macro-0.13))))
    (home-page "https://github.com/TedDriggs/darling")
    (synopsis
      "A proc-macro library for reading attributes into structs when
implementing custom derives.
")
    (description
      "This package provides a proc-macro library for reading attributes into structs
when implementing custom derives.")
    (license license:expat)))

(define-public rust-ndk-macro-0.3
  (package
    (name "rust-ndk-macro")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk-macro" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0v3sxc11kq3d5vdwfml62l7y5dr0flsf6kp5xid9sbv7qh0arxqd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-darling" ,rust-darling-0.13)
         ("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "Helper macros for android ndk")
    (description "Helper macros for android ndk")
    (license (list license:expat license:asl2.0))))

(define-public rust-android-logger-0.10
  (package
    (name "rust-android-logger")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "android_logger" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0rigzgkaik2y7pvsilpjdy19mdq1kkamw2rdf9fjkvb5hfqhkvfr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-android-log-sys" ,rust-android-log-sys-0.2)
         ("rust-env-logger" ,rust-env-logger-0.8)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/Nercury/android_logger-rs")
    (synopsis
      "A logging implementation for `log` which hooks to android log output.
")
    (description
      "This package provides a logging implementation for `log` which hooks to android
log output.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ndk-glue-0.6
  (package
    (name "rust-ndk-glue")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk-glue" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0yaxwp953c0b5fpn8zalwjkrvw8rkf00physlmi9kssq115x3h04"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-android-logger" ,rust-android-logger-0.10)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-ndk" ,rust-ndk-0.6)
         ("rust-ndk-macro" ,rust-ndk-macro-0.3)
         ("rust-ndk-sys" ,rust-ndk-sys-0.3))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "Startup code for android binaries")
    (description "Startup code for android binaries")
    (license (list license:expat license:asl2.0))))

(define-public rust-ndk-sys-0.3
  (package
    (name "rust-ndk-sys")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "15zsq4p6k5asf4mc0rknd8cz9wxrwvi50qdspgf87qcfgkknlnkf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-jni-sys" ,rust-jni-sys-0.3))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "FFI bindings for the Android NDK")
    (description "FFI bindings for the Android NDK")
    (license (list license:expat license:asl2.0))))

(define-public rust-ndk-0.6
  (package
    (name "rust-ndk")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1m1dfjw35qpys1hr4qib6mm3zacd01k439l7cx5f7phd0dzcfci0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-jni" ,rust-jni-0.18)
         ("rust-jni-glue" ,rust-jni-glue-0.0.10)
         ("rust-jni-sys" ,rust-jni-sys-0.3)
         ("rust-ndk-sys" ,rust-ndk-sys-0.3)
         ("rust-num-enum" ,rust-num-enum-0.5)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "Safe Rust bindings to the Android NDK")
    (description "Safe Rust bindings to the Android NDK")
    (license (list license:expat license:asl2.0))))

(define-public rust-oboe-0.4
  (package
    (name "rust-oboe")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "oboe" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1lh20l8b4lx5h9a7lpf9n66z47sh2508w7x2203hsklvw7rchqr4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-jni" ,rust-jni-0.19)
         ("rust-ndk" ,rust-ndk-0.6)
         ("rust-ndk-glue" ,rust-ndk-glue-0.6)
         ("rust-num-derive" ,rust-num-derive-0.3)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-oboe-sys" ,rust-oboe-sys-0.4))))
    (home-page "https://github.com/katyo/oboe-rs")
    (synopsis
      "Safe interface for oboe an android library for low latency audio IO")
    (description
      "Safe interface for oboe an android library for low latency audio IO")
    (license license:asl2.0)))

(define-public rust-android-log-sys-0.2
  (package
    (name "rust-android-log-sys")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "android_log-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0bhhs1cgzp9vzjvkn2q31ppc7w4am5s273hkvl5iac5475kmp5l5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/nercury/android_log-sys-rs")
    (synopsis "FFI bindings to Android log Library.
")
    (description "FFI bindings to Android log Library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-android-logger-0.9
  (package
    (name "rust-android-logger")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "android_logger" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0wspwzkn3fakpyz3ka0lh6h4pa66zk9kkvic2q9n70jx30y37hif"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-android-log-sys" ,rust-android-log-sys-0.2)
         ("rust-env-logger" ,rust-env-logger-0.7)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/Nercury/android_logger-rs")
    (synopsis
      "A logging implementation for `log` which hooks to android log output.
")
    (description
      "This package provides a logging implementation for `log` which hooks to android
log output.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ndk-glue-0.3
  (package
    (name "rust-ndk-glue")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk-glue" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "11cksaj1f2sy4dwqyssrvvhbnd86zajfvm17bj81rb2i9p1g1jn5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-android-logger" ,rust-android-logger-0.9)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-ndk" ,rust-ndk-0.3)
         ("rust-ndk-macro" ,rust-ndk-macro-0.2)
         ("rust-ndk-sys" ,rust-ndk-sys-0.2))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "Startup code for android binaries")
    (description "Startup code for android binaries")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-enum-derive-0.5
  (package
    (name "rust-num-enum-derive")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_enum_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08dvxpa7l5hx5fcdr0bdv9bzajbcbxsbbnc6hl6zxmwhhiv2p68d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/illicitonion/num_enum")
    (synopsis
      "Internal implementation details for ::num_enum (Procedural macros to make inter-operation between primitives and enums easier)")
    (description
      "Internal implementation details for ::num_enum (Procedural macros to make
inter-operation between primitives and enums easier)")
    (license (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-num-enum-0.5
  (package
    (name "rust-num-enum")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_enum" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1b96nmbhn2gadlh4hna6mz6w892gzp1zic60q1s4akjy0nhkw3bj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-enum-derive" ,rust-num-enum-derive-0.5))))
    (home-page "https://github.com/illicitonion/num_enum")
    (synopsis
      "Procedural macros to make inter-operation between primitives and enums easier.")
    (description
      "Procedural macros to make inter-operation between primitives and enums easier.")
    (license (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-ndk-0.3
  (package
    (name "rust-ndk")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndk" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1avk39s8w21inkzq09x83yghgq3v8rmhrycba8prg6rif8hk5547"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-jni" ,rust-jni-0.14)
         ("rust-jni-glue" ,rust-jni-glue-0.0.10)
         ("rust-jni-sys" ,rust-jni-sys-0.3)
         ("rust-ndk-sys" ,rust-ndk-sys-0.2)
         ("rust-num-enum" ,rust-num-enum-0.5)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/rust-windowing/android-ndk-rs")
    (synopsis "Safe Rust bindings to the Android NDK")
    (description "Safe Rust bindings to the Android NDK")
    (license (list license:expat license:asl2.0))))

(define-public rust-jni-0.19
  (package
    (name "rust-jni")
    (version "0.19.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "jni" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1v0pn0i1wb8zp4wns4l8hz9689hqsplv7iba7hylaznvwg11ipy6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cesu8" ,rust-cesu8-1)
         ("rust-combine" ,rust-combine-4)
         ("rust-jni-sys" ,rust-jni-sys-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/jni-rs/jni-rs")
    (synopsis "Rust bindings to the JNI")
    (description "Rust bindings to the JNI")
    (license (list license:expat license:asl2.0))))

(define-public rust-jack-sys-0.2
  (package
    (name "rust-jack-sys")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "jack-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1h9c9za19nyr1prx77gkia18ia93f73lpyjdiyrvmhhbs79g54bv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libloading" ,rust-libloading-0.6)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/RustAudio/rust-jack/tree/main/jack-sys")
    (synopsis "Low-level binding to the JACK audio API.")
    (description "Low-level binding to the JACK audio API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-jack-0.7
  (package
    (name "rust-jack")
    (version "0.7.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "jack" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1r7bgfpbph3fl9xyp4i9qffcc4h923dcs7d967mpir13lxg216yp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-jack-sys" ,rust-jack-sys-0.2)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/RustAudio/rust-jack")
    (synopsis "Real time audio and midi with JACK.")
    (description "Real time audio and midi with JACK.")
    (license license:expat)))

(define-public rust-bindgen-0.56
  (package
    (name "rust-bindgen")
    (version "0.56.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0fajmgk2064ca1z9iq1jjkji63qwwz38z3d67kv6xdy0xgdpk8rd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-cexpr" ,rust-cexpr-0.4)
         ("rust-clang-sys" ,rust-clang-sys-1)
         ("rust-clap" ,rust-clap-2)
         ("rust-env-logger" ,rust-env-logger-0.8)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-lazycell" ,rust-lazycell-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-peeking-take-while" ,rust-peeking-take-while-0.1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-regex" ,rust-regex-1)
         ("rust-rustc-hash" ,rust-rustc-hash-1)
         ("rust-shlex" ,rust-shlex-0.1)
         ("rust-which" ,rust-which-3))))
    (home-page "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-coreaudio-sys-0.2
  (package
    (name "rust-coreaudio-sys")
    (version "0.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "coreaudio-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1yiipfq8gni2fkh62kzzprqgnfb77046d392p9mb82bapr3k6zib"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.56))))
    (home-page "https://github.com/RustAudio/coreaudio-sys")
    (synopsis
      "Bindings for Apple's CoreAudio frameworks generated via rust-bindgen")
    (description
      "Bindings for Apple's CoreAudio frameworks generated via rust-bindgen")
    (license license:expat)))

(define-public rust-coreaudio-rs-0.10
  (package
    (name "rust-coreaudio-rs")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "coreaudio-rs" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "125d4zr3n363ybga4629p41ym7iqjfb2alnwrc1zj7zyxch4p28i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-coreaudio-sys" ,rust-coreaudio-sys-0.2))))
    (home-page "https://github.com/RustAudio/coreaudio-rs")
    (synopsis "A friendly rust interface for Apple's CoreAudio API.")
    (description
      "This package provides a friendly rust interface for Apple's CoreAudio API.")
    (license (list license:expat license:asl2.0))))

(define-public rust-asio-sys-0.2
  (package
    (name "rust-asio-sys")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "asio-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1m8v2jsa4n57s7a7142vs23dkz63dhjxgcjxykd17kvq66v9qqj7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bindgen" ,rust-bindgen-0.54)
         ("rust-cc" ,rust-cc-1)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-num-derive" ,rust-num-derive-0.3)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/RustAudio/cpal/")
    (synopsis
      "Low-level interface and binding generation for the steinberg ASIO SDK.")
    (description
      "Low-level interface and binding generation for the steinberg ASIO SDK.")
    (license license:asl2.0)))

(define-public rust-alsa-sys-0.3
  (package
    (name "rust-alsa-sys")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "alsa-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09qmmnpmlcj23zcgx2xsi4phcgm5i02g9xaf801y7i067mkfx3yv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/diwic/alsa-sys")
    (synopsis
      "FFI bindings for the ALSA project (Advanced Linux Sound Architecture)")
    (description
      "FFI bindings for the ALSA project (Advanced Linux Sound Architecture)")
    (license license:expat)))

(define-public rust-alsa-0.5
  (package
    (name "rust-alsa")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "alsa" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "03nmld6vbpxqg22fy07p51x2rmwl7bzsc7rszhd03gyknd5ldaqb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-alsa-sys" ,rust-alsa-sys-0.3)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-nix" ,rust-nix-0.21))))
    (home-page "https://github.com/diwic/alsa-rs")
    (synopsis "Thin but safe wrappers for ALSA (Linux sound API)")
    (description "Thin but safe wrappers for ALSA (Linux sound API)")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cpal-0.13
  (package
    (name "rust-cpal")
    (version "0.13.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cpal" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0614gbjg29n817m97595974pbw331dqyz2c8g0ncs5zn4455zx4q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-alsa" ,rust-alsa-0.5)
         ("rust-asio-sys" ,rust-asio-sys-0.2)
         ("rust-core-foundation-sys" ,rust-core-foundation-sys-0.8)
         ("rust-coreaudio-rs" ,rust-coreaudio-rs-0.10)
         ("rust-jack" ,rust-jack-0.7)
         ("rust-jni" ,rust-jni-0.19)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-mach" ,rust-mach-0.3)
         ("rust-ndk" ,rust-ndk-0.3)
         ("rust-ndk-glue" ,rust-ndk-glue-0.3)
         ("rust-nix" ,rust-nix-0.20)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-oboe" ,rust-oboe-0.4)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-stdweb" ,rust-stdweb-0.1)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-web-sys" ,rust-web-sys-0.3)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/rustaudio/cpal")
    (synopsis "Low-level cross-platform audio I/O library in pure Rust.")
    (description "Low-level cross-platform audio I/O library in pure Rust.")
    (license license:asl2.0)))

(define-public rust-claxon-0.4
  (package
    (name "rust-claxon")
    (version "0.4.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "claxon" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1206mxvw833ysg10029apcsjjwly8zmsvksgza5cm7ma4ikzbysb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/ruuda/claxon#readme")
    (synopsis "A FLAC decoding library")
    (description "This package provides a FLAC decoding library")
    (license license:asl2.0)))

(define-public rust-rodio-0.14
  (package
    (name "rust-rodio")
    (version "0.14.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rodio" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ybb0ip0wi7ckcq54a63bpbp03kzrp445h9bgq2ja5dnazjzb62d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-claxon" ,rust-claxon-0.4)
         ("rust-cpal" ,rust-cpal-0.13)
         ("rust-hound" ,rust-hound-3)
         ("rust-lewton" ,rust-lewton-0.10)
         ("rust-minimp3" ,rust-minimp3-0.5))
        #:cargo-development-inputs
        (("rust-quickcheck" ,rust-quickcheck-0.9))))
    (home-page "https://github.com/RustAudio/rodio")
    (synopsis "Audio playback library")
    (description "Audio playback library")
    (license (list license:expat license:asl2.0))))

(define-public rust-mp4ameta-proc-0.1
  (package
    (name "rust-mp4ameta-proc")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "mp4ameta_proc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1i82asxzdl4cxrb9y50s1y5j40qgx4c5ca89y2vy6rvb3x287bk4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/Saecki/rust-mp4ameta")
    (synopsis
      "Procedural macros to generate common accessors for the mp4ameta crate.")
    (description
      "Procedural macros to generate common accessors for the mp4ameta crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mp4ameta-0.6
  (package
    (name "rust-mp4ameta")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "mp4ameta" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ch1jsp6vilkxlb8ds0cxwkq9l3jfifnx6r0w9xrxapya6xa5xqy"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-mp4ameta-proc" ,rust-mp4ameta-proc-0.1))))
    (home-page "https://github.com/Saecki/rust-mp4ameta")
    (synopsis
      "A library for reading and writing iTunes style MPEG-4 audio metadata.")
    (description
      "This package provides a library for reading and writing iTunes style MPEG-4
audio metadata.")
    (license (list license:expat license:asl2.0))))

(define-public rust-metaflac-0.2
  (package
    (name "rust-metaflac")
    (version "0.2.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "metaflac" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0l57bcm1f8k33i72rhwizl4vmf1h8dcznfpbylm6j3dvq4y0siz1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/jameshurst/rust-metaflac")
    (synopsis "A library for reading and writing FLAC metadata.")
    (description
      "This package provides a library for reading and writing FLAC metadata.")
    (license license:expat)))

(define-public rust-id3-0.5
  (package
    (name "rust-id3")
    (version "0.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "id3" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0cb33a7pxydm1dq70zja9y07iaa8b8z1zpqj6igprmb0mbjpmcwc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-flate2" ,rust-flate2-1))))
    (home-page "https://github.com/polyfloyd/rust-id3")
    (synopsis "A library for reading and writing ID3 metadata")
    (description
      "This package provides a library for reading and writing ID3 metadata")
    (license license:expat)))

(define-public rust-audiotags-dev-macro-0.1
  (package
    (name "rust-audiotags-dev-macro")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "audiotags-dev-macro" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0vmk7hlyqi2a131xq0z3dd30gvk362bgfz9j0qpk27qnj62jjy9v"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/TianyiShi2001/audiotags")
    (synopsis "macros used during the development of audiotags")
    (description "macros used during the development of audiotags")
    (license license:expat)))

(define-public rust-audiotags-0.2
  (package
    (name "rust-audiotags")
    (version "0.2.7182")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "audiotags" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1n76kkx7hkqxf6z3b9028yb2b6c75lpdvi8kbyxic97l308i2zdq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-audiotags-dev-macro" ,rust-audiotags-dev-macro-0.1)
         ("rust-id3" ,rust-id3-0.5)
         ("rust-metaflac" ,rust-metaflac-0.2)
         ("rust-mp4ameta" ,rust-mp4ameta-0.6)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/TianyiShi2001/audiotags")
    (synopsis "Unified IO for different types of audio metadata")
    (description "Unified IO for different types of audio metadata")
    (license license:expat)))

(define-public rust-hamming-0.1
  (package
    (name "rust-hamming")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hamming" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1q9hri1l1x1y7vv153kvdw9lkqslmbwgia5r3qj6i39pfji3s135"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-development-inputs
        (("rust-quickcheck" ,rust-quickcheck-0.2)
         ("rust-rand" ,rust-rand-0.3))))
    (home-page "https://github.com/huonw/hamming")
    (synopsis
      "Count ones, fast (aka popcount, hamming weight). This provides a
performant popcount and bitwise hamming distance for a slice of bytes.
")
    (description
      "Count ones, fast (aka popcount, hamming weight).  This provides a performant
popcount and bitwise hamming distance for a slice of bytes.")
    (license (list license:expat license:asl2.0))))

(define-public rust-transpose-0.2
  (package
    (name "rust-transpose")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "transpose" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17z34pdylj8mh2nbiai6cmrfrkah0mlgs9z2mr1ymdlqm80ckycm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-strength-reduce" ,rust-strength-reduce-0.2))))
    (home-page "http://github.com/ejmahler/transpose")
    (synopsis "Utility for transposing multi-dimensional data")
    (description "Utility for transposing multi-dimensional data")
    (license (list license:expat license:asl2.0))))

(define-public rust-transpose-0.1
  (package
    (name "rust-transpose")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "transpose" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "07ndndq94c5hsqz5kphjs0cmnw688axysp4yn1xpqqmh1dc22gk4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "http://github.com/ejmahler/transpose")
    (synopsis "Utility for transposing multi-dimensional data")
    (description "Utility for transposing multi-dimensional data")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustfft-3
  (package
    (name "rust-rustfft")
    (version "3.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustfft" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1r8g8gb6fxzwlnj9hl2ip79r7s7v51nslpifmjsch8w9kbaqw03p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-complex" ,rust-num-complex-0.2)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-strength-reduce" ,rust-strength-reduce-0.2)
         ("rust-transpose" ,rust-transpose-0.1))))
    (home-page "https://github.com/ejmahler/RustFFT")
    (synopsis "High-performance FFT library written in pure Rust.")
    (description "High-performance FFT library written in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustdct-0.4
  (package
    (name "rust-rustdct")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustdct" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0z8bg39g364jn51hyfxpa8b0gaasr4scvnsb2716ikxlfiv1ckgg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-rustfft" ,rust-rustfft-3))))
    (home-page "https://github.com/ejmahler/rust_dct")
    (synopsis
      "Compute Discrete Cosine Transforms (DCT) of any size in O(nlogn) time, in pure Rust.")
    (description
      "Compute Discrete Cosine Transforms (DCT) of any size in O(nlogn) time, in pure
Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fnv-1
  (package
    (name "rust-fnv")
    (version "1.0.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fnv" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/servo/rust-fnv")
    (synopsis "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (description "Fowlerâ\x80\x93Nollâ\x80\x93Vo hash function")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bk-tree-0.4
  (package
    (name "rust-bk-tree")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bk_tree" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gzg40a6q7fs9dxvhbhvl911bvf2wxb1sqx2bixp2kg90zhzc8b1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-fnv" ,rust-fnv-1) ("rust-triple-accel" ,rust-triple-accel-0.3))
        #:cargo-development-inputs
        (("rust-rand" ,rust-rand-0.3))))
    (home-page "https://github.com/eugene-bulkin/rust-bk-tree")
    (synopsis "A Rust BK-tree implementation")
    (description "This package provides a Rust BK-tree implementation")
    (license license:expat)))

(define-public rust-img-hash-3
  (package
    (name "rust-img-hash")
    (version "3.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "img_hash" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0j8blz1riwl7v13w6nm2v3fsbgs7nwr0f8aw7lvfsr2gzk3fm92y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-base64" ,rust-base64-0.13)
         ("rust-image" ,rust-image-0.23)
         ("rust-rustdct" ,rust-rustdct-0.4)
         ("rust-serde" ,rust-serde-1)
         ("rust-transpose" ,rust-transpose-0.2))
        #:cargo-development-inputs
        (("rust-criterion" ,rust-criterion-0.3))))
    (home-page "http://github.com/abonander/img_hash")
    (synopsis
      "A simple library that provides perceptual hashing and difference calculation for images.")
    (description
      "This package provides a simple library that provides perceptual hashing and
difference calculation for images.")
    (license (list license:expat license:asl2.0))))

(define-public rust-blake3-1
  (package
    (name "rust-blake3")
    (version "1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "blake3" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0dvg22dyld3a7r6fc421v4c1f4xpwvl048a4dv5ycanbl3j9jbl8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-arrayref" ,rust-arrayref-0.3)
         ("rust-arrayvec" ,rust-arrayvec-0.7)
         ("rust-cc" ,rust-cc-1)
         ("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-constant-time-eq" ,rust-constant-time-eq-0.1)
         ("rust-digest" ,rust-digest-0.10)
         ("rust-rayon" ,rust-rayon-1))
        #:cargo-development-inputs
        (("rust-hex" ,rust-hex-0.4)
         ("rust-page-size" ,rust-page-size-0.4)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-rand-chacha" ,rust-rand-chacha-0.3))))
    (home-page "https://github.com/BLAKE3-team/BLAKE3")
    (synopsis "the BLAKE3 hash function")
    (description "the BLAKE3 hash function")
    (license (list license:cc0 license:asl2.0))))

(define-public rust-transpose-0.2
  (package
    (name "rust-transpose")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "transpose" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17z34pdylj8mh2nbiai6cmrfrkah0mlgs9z2mr1ymdlqm80ckycm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-strength-reduce" ,rust-strength-reduce-0.2))))
    (home-page "http://github.com/ejmahler/transpose")
    (synopsis "Utility for transposing multi-dimensional data")
    (description "Utility for transposing multi-dimensional data")
    (license (list license:expat license:asl2.0))))

(define-public rust-primal-check-0.3
  (package
    (name "rust-primal-check")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "primal-check" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "07aihxa8pqhxi1738lw76z7vrqc3wj1kvqjl8nacm8f1fbp9qh81"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1))))
    (home-page "https://github.com/huonw/primal")
    (synopsis "Fast standalone primality testing.
")
    (description "Fast standalone primality testing.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustfft-5
  (package
    (name "rust-rustfft")
    (version "5.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustfft" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0by4mm6lg19c8sm7cp45amd06dsn2qgn7g7l5zaq0wzpdwmbns8q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-complex" ,rust-num-complex-0.3)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-primal-check" ,rust-primal-check-0.3)
         ("rust-strength-reduce" ,rust-strength-reduce-0.2)
         ("rust-transpose" ,rust-transpose-0.2))))
    (home-page "https://github.com/ejmahler/RustFFT")
    (synopsis "High-performance FFT library written in pure Rust.")
    (description "High-performance FFT library written in pure Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rustdct-0.6
  (package
    (name "rust-rustdct")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustdct" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "03gq6gddhb4mmsrkqqh68sp2lr732awrh56vvahlv9lap42vbp7s"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-rustfft" ,rust-rustfft-5))))
    (home-page "https://github.com/ejmahler/rust_dct")
    (synopsis
      "Compute Discrete Cosine Transforms (DCT) of any size in O(nlogn) time, in pure Rust.")
    (description
      "Compute Discrete Cosine Transforms (DCT) of any size in O(nlogn) time, in pure
Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ffmpeg-cmdline-utils-0.1
  (package
    (name "rust-ffmpeg-cmdline-utils")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ffmpeg_cmdline_utils" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hfx4hxhwkcdjalprdzqz0zas38dz7ck5z8yxhsn3wd5bcgnn59g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-image" ,rust-image-0.23)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/Farmadupe/ffmpeg_cmdline_utils")
    (synopsis
      "Rust wrapper around the commandline interface to FFMPEG. Can be used to read frames from videos into bufrers in rust.")
    (description
      "Rust wrapper around the commandline interface to FFMPEG.  Can be used to read
frames from videos into bufrers in rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-vid-dup-finder-lib-0.1
  (package
    (name "rust-vid-dup-finder-lib")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vid_dup_finder_lib" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0cijhbb2psvikkqyvygwcmhl0cwgqf712l2pqngdzn9a0asqbgv4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-ffmpeg-cmdline-utils" ,rust-ffmpeg-cmdline-utils-0.1)
         ("rust-image" ,rust-image-0.23)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-rustdct" ,rust-rustdct-0.6)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-transpose" ,rust-transpose-0.2))
        #:cargo-development-inputs
        (("rust-itertools" ,rust-itertools-0.10))))
    (home-page "https://github.com/Farmadupe/vid_dup_finder_app")
    (synopsis "a library to find near-duplicate video files")
    (description "a library to find near-duplicate video files")
    (license (list license:expat license:asl2.0))))

(define-public rust-czkawka-core
  (package
    (name "rust-czkawka-core")
    (version "4.0.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
		(url "https://github.com/qarmin/czkawka")
		(commit version)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1d2fg71b4md5ziz2h1dvx1sj4zx7i1zzaw1xr8sq5jj63kifw2s0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
(("rust-humansize" ,rust-humansize-1)
("rust-rayon" ,rust-rayon-1)
("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5) 

("rust-directories-next" ,rust-directories-next-2)

("rust-img-hash" ,rust-img-hash-3)
("rust-bk-tree" ,rust-bk-tree-0.4)
("rust-image" ,rust-image-0.23)
("rust-hamming" ,rust-hamming-0.1)
("rust-bitflags" ,rust-bitflags-1)
("rust-audiotags" ,rust-audiotags-0.2) 

("rust-futures" ,rust-futures-0.3)
("rust-zip" rust-zip-0.5)
("rust-rodio" ,rust-rodio-0.14)
("rust-blake3" ,rust-blake3-1)
("rust-crc32fast" ,rust-crc32fast-1)
("rust-xxhash-rust" rust-xxhash-rust-0.8)
("rust-tempfile" ,rust-tempfile-3)
("rust-vid-dup-finder-lib" ,rust-vid-dup-finder-lib-0.1)
("rust-ffmpeg-cmdline-utils" ,rust-ffmpeg-cmdline-utils-0.1)
("rust-serde" ,rust-serde-1)
("rust-bincode" ,rust-bincode-1)
("rust-serde_json" ,rust-serde-json-1)
("rust-i18n-embed" rust-i18n-embed-0.13)
("rust-i18n-embed-fl" ,rust-i18n-embed-fl-0.6)
("rust-embed" ,rust-embed-6.3)
("rust-once-cell" ,rust-once-cell-1)
("rust-rawloader" ,rust-rawloader-0.37)
("rust-imagepipe" ,rust-imagepipe-0.4))
#:phases
(modify-phases %standard-phases
(add-after 'unpack 'chdir-czkawka-core
(lambda* _
(chdir "czkawka_core"))))))
    (home-page "https://github.com/qarmin/czkawka")
    (synopsis
      "Find duplicates, empty folders, similar images")
    (description
      "")
    (license license:expat)))
