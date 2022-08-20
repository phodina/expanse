(define-module (expanse packages rest)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-simd-lite-0.1
  (package
    (name "rust-simd-lite")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "simd-lite" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0qim5gpyglc3846362xcp7dkc2ac8rrqirwcr9qji8j8n0bk11pc"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/simd-lite/simd-lite")
    (synopsis "Helpful functionality for working with SIMD intrinsics in Rust")
    (description
      "Helpful functionality for working with SIMD intrinsics in Rust")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libc-0.1
  (package
    (name "rust-libc")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08k14zb7bw25avmaj227calcdglb4ac394kklr9nv175fp7p0ap3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/rust-lang/libc")
    (synopsis "Raw FFI bindings to platform libraries like libc.
")
    (description "Raw FFI bindings to platform libraries like libc.")
    (license (list license:expat license:asl2.0))))

(define-public rust-mmap-0.1
  (package
    (name "rust-mmap")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "mmap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08xqhvr4l3rf1fkz2w4cwz3z5wd0m1jab1d34sxd4v80lr459j0b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.1) ("rust-tempdir" ,rust-tempdir-0.3))))
    (home-page "https://github.com/rbranson/rust-mmap")
    (synopsis "A library for dealing with memory-mapped I/O
")
    (description
      "This package provides a library for dealing with memory-mapped I/O")
    (license license:expat)))

(define-public rust-perfcnt-0.5
  (package
    (name "rust-perfcnt")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "perfcnt" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1zyh1sh07m1qhp0x2s863759g90976vkjkjfmmqffqjrvvaswivy"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-mmap" ,rust-mmap-0.1)
         ("rust-nom" ,rust-nom-4)
         ("rust-phf" ,rust-phf-0.8)
         ("rust-x86" ,rust-x86-0.33))))
    (home-page "https://github.com/gz/rust-perfcnt")
    (synopsis
      "Library to configure and read hardware performance counters in rust.")
    (description
      "Library to configure and read hardware performance counters in rust.")
    (license license:expat)))

(define-public rust-page-size-0.4
  (package
    (name "rust-page-size")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "page_size" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1kgdv7f626jy4i2pq8czp4ppady4g4kqfa5ik4dah7mzzd4fbggf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-spin" ,rust-spin-0.5)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Elzair/page_size_rs")
    (synopsis
      "Provides an easy, fast, cross-platform way to retrieve the memory page size")
    (description
      "This package provides an easy, fast, cross-platform way to retrieve the memory
page size")
    (license (list license:expat license:asl2.0))))

(define-public rust-halfbrown-0.1
  (package
    (name "rust-halfbrown")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "halfbrown" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09f8hgz913650fbqhqxldiwf46r7fcka6xjil60rnccx4mvrblry"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-fxhash" ,rust-fxhash-0.2)
         ("rust-hashbrown" ,rust-hashbrown-0.11)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/Licenser/halfbrown")
    (synopsis
      "Multi backend HashMap for higher performance on different key space sizes")
    (description
      "Multi backend HashMap for higher performance on different key space sizes")
    (license (list license:asl2.0 license:expat))))

(define-public rust-simd-json-0.1
  (package
    (name "rust-simd-json")
    (version "0.1.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "simd-json" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0pl2jqp3mcaalwycbxvbf5pvsm3jdg16q82k1lmk4hdg8lyxqbff"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-colored" ,rust-colored-1)
         ("rust-float-cmp" ,rust-float-cmp-0.5)
         ("rust-getopts" ,rust-getopts-0.2)
         ("rust-halfbrown" ,rust-halfbrown-0.1)
         ("rust-itoa" ,rust-itoa-0.4)
         ("rust-jemallocator" ,rust-jemallocator-0.3)
         ("rust-page-size" ,rust-page-size-0.4)
         ("rust-perfcnt" ,rust-perfcnt-0.5)
         ("rust-ryu" ,rust-ryu-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-simd-lite" ,rust-simd-lite-0.1))))
    (home-page "https://github.com/simd-lite/simd-json")
    (synopsis "High performance JSON parser based on a port of simdjson")
    (description "High performance JSON parser based on a port of simdjson")
    (license (list license:asl2.0 license:expat))))

(define-public rust-restson-1
  (package
    (name "rust-restson")
    (version "1.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "restson" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1d2fg71b4md5ziz2h1dvx1sj4zx7i1zzaw8xr8sq5jj63kifw2s0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f ; requires network connection to https://httpbin.org
	    #:cargo-inputs
        (("rust-base64" ,rust-base64-0.13)
         ("rust-futures" ,rust-futures-0.3)
         ("rust-hyper" ,rust-hyper-0.14)
         ("rust-hyper-tls" ,rust-hyper-tls-0.5)
         ("rust-log" ,rust-log-0.4)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-simd-json" ,rust-simd-json-0.1)
         ("rust-tokio" ,rust-tokio-1)
         ("rust-url" ,rust-url-2))
        #:cargo-development-inputs
        (("rust-serde-derive" ,rust-serde-derive-1)
         ("rust-tokio" ,rust-tokio-1))))
	(native-inputs (list pkg-config))
	(inputs (list openssl))
    (home-page "https://github.com/spietika/restson-rust")
    (synopsis
      "Easy-to-use REST client with automatic serialization and deserialization.")
    (description
      "Easy-to-use REST client with automatic serialization and deserialization.")
    (license license:expat)))
