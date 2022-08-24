(define-module (expanse packages ftzz)
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
(define-public rust-oorandom-11
  (package
    (name "rust-oorandom")
    (version "11.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "oorandom" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0xdm4vd89aiwnrk1xjwzklnchjqvib4klcihlc2bsd4x50mbrc8a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-development-inputs
        (("rust-rand-core" ,rust-rand-core-0.5)
         ("rust-rand-pcg" ,rust-rand-pcg-0.2)
         ("rust-random-fast-rng" ,rust-random-fast-rng-0.1)
         ("rust-randomize" ,rust-randomize-3))))
    (home-page "https://sr.ht/~icefox/oorandom/")
    (synopsis "A tiny, robust PRNG implementation.")
    (description "This package provides a tiny, robust PRNG implementation.")
    (license license:expat)))

(define-public rust-stack-buffer-0.2
  (package
    (name "rust-stack-buffer")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stack-buffer" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1v0dyhvvmd3cymvnjrykhrnl9c0wwg3a71qbd6l3ca7bxiag0cd5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/SUPERCILEX/stack-buffer")
    (synopsis
      "Stack buffer provides alternatives to BufReader and BufWriter allocated on the stack instead of the heap.")
    (description
      "Stack buffer provides alternatives to BufReader and BufWriter allocated on the
stack instead of the heap.")
    (license license:asl2.0)))

(define-public rust-rstest-0.12
  (package
    (name "rust-rstest")
    (version "0.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rstest" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0vv11n0wiqm70lyjc1byl22sqd1z1cpaq49yxrk9myd3ar8z64nr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-rustc-version" ,rust-rustc-version-0.4)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/la10736/rstest")
    (synopsis
      "Rust fixture based test framework. It use procedural macro
to implement fixtures and table based tests.
")
    (description
      "Rust fixture based test framework.  It use procedural macro to implement
fixtures and table based tests.")
    (license (list license:expat license:asl2.0))))

(define-public rust-more-asserts-0.2
  (package
    (name "rust-more-asserts")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "more-asserts" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "12b3fypg2sr4qmxy6wiyx6k9sdg573f5ij98cdmbrg00whnyqhvq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/thomcc/rust-more-asserts")
    (synopsis
      "Small library providing additional assert_* and debug_assert_* macros.")
    (description
      "Small library providing additional assert_* and debug_assert_* macros.")
    (license license:cc0)))

(define-public rust-criterion-plot-0.4
  (package
    (name "rust-criterion-plot")
    (version "0.4.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "criterion-plot" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0mys2zkizh5az6ax77m5aqifk0vz35rn0a6wykvmjx9gkzg9c2fh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cast" ,rust-cast-0.2)
         ("rust-itertools" ,rust-itertools-0.10))))
    (home-page "https://github.com/bheisler/criterion.rs")
    (synopsis "Criterion's plotting library")
    (description "Criterion's plotting library")
    (license (list license:expat license:asl2.0))))

(define-public rust-criterion-0.3
  (package
    (name "rust-criterion")
    (version "0.3.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "criterion" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "044d2x7cxfvw2g558lzyllcv7jcdkw9xmacmb0nzx8pv4pyxl10n"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-async-std" ,rust-async-std-1)
         ("rust-atty" ,rust-atty-0.2)
         ("rust-cast" ,rust-cast-0.2)
         ("rust-clap" ,rust-clap-2)
         ("rust-criterion-plot" ,rust-criterion-plot-0.4)
         ("rust-csv" ,rust-csv-1)
         ("rust-futures" ,rust-futures-0.3)
         ("rust-itertools" ,rust-itertools-0.10)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-oorandom" ,rust-oorandom-11)
         ("rust-plotters" ,rust-plotters-0.3)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-regex" ,rust-regex-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-cbor" ,rust-serde-cbor-0.11)
         ("rust-serde-derive" ,rust-serde-derive-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-smol" ,rust-smol-1)
         ("rust-tinytemplate" ,rust-tinytemplate-1)
         ("rust-tokio" ,rust-tokio-1)
         ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description "Statistics-driven micro-benchmarking library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-simple-logger-1
  (package
    (name "rust-simple-logger")
    (version "1.16.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "simple_logger" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0pkvkp0v3w9kwqjhx5npb2jbyj9kfbb8y2w92s5cphsxldc05dj5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-atty" ,rust-atty-0.2)
         ("rust-colored" ,rust-colored-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-time" ,rust-time-0.3)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/borntyping/rust-simple_logger")
    (synopsis
      "A logger that prints all messages with a readable output format")
    (description
      "This package provides a logger that prints all messages with a readable output
format")
    (license license:expat)))

(define-public rust-syn-1
  (package
    (name "rust-syn")
    (version "1.0.86")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syn" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0sqwa4nqxzm89nj8xd8sk4iz0hbrw3mb17b6hyc2w2d0zzsb6rca"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro2-1
  (package
    (name "rust-proc-macro2")
    (version "1.0.36")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0adh6gvs31x6pfwmygypmzrv1jc7kjq568vsqcfaxk7vhdc2sd67"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/dtolnay/proc-macro2")
    (synopsis
      "A substitute implementation of the compiler's `proc_macro` API to decouple
token-based libraries from the procedural macro use case.
")
    (description
      "This package provides a substitute implementation of the compiler's `proc_macro`
API to decouple token-based libraries from the procedural macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-quote-1
  (package
    (name "rust-quote")
    (version "1.0.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quote" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0id1q0875pvhkg0mlb5z8gzdm2g2rbbz76bfzhv331lrm2b3wkc6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "Quasi-quoting macro quote!(...)")
    (license (list license:expat license:asl2.0))))

(define-public rust-cli-errors-macros-0.2
  (package
    (name "rust-cli-errors-macros")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cli-errors-macros" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1dy9zmh20qnaaskmny2gr1nj2s51sf5ikvl74k81jsv2crpb03qn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-quote" ,rust-quote-1) ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/SUPERCILEX/cli-errors")
    (synopsis "CLI Errors's proc macros.")
    (description "CLI Errors's proc macros.")
    (license license:asl2.0)))

(define-public rust-cli-errors-0.2
  (package
    (name "rust-cli-errors")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cli-errors" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1lcnhcsv11d8d1zs9kvwibxwdb5hnd1vbdnkmb5mfwshiiypfbnn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-anyhow" ,rust-anyhow-1)
         ("rust-cli-errors-macros" ,rust-cli-errors-macros-0.2)
         ("rust-exitcode" ,rust-exitcode-1))))
    (home-page "https://github.com/SUPERCILEX/cli-errors")
    (synopsis
      "CLI Errors provides a wrapper type around anyhow to support exiting programs with an arbitrary exit code.")
    (description
      "CLI Errors provides a wrapper type around anyhow to support exiting programs
with an arbitrary exit code.")
    (license license:asl2.0)))

(define-public rust-clap-verbosity-flag-0.4
  (package
    (name "rust-clap-verbosity-flag")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap-verbosity-flag" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1cr9ivgkmzwqdgzb7wn5w1y9b0k2yk0npkspb90hzg3s3amq24pv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-clap" ,rust-clap-3) ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/rust-clique/clap-verbosity-flag")
    (synopsis "Easily add a `--verbose` flag to CLIs using Structopt")
    (description "Easily add a `--verbose` flag to CLIs using Structopt")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-num-1
  (package
    (name "rust-clap-num")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap-num" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0mphz0p2my2zi62dwv903nan84760537h9k1zigwig39hs1rsn7a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/newAM/clap-num/")
    (synopsis "Number parsers for clap")
    (description "Number parsers for clap")
    (license license:expat)))

(define-public rust-unicode-linebreak-0.1
  (package
    (name "rust-unicode-linebreak")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicode-linebreak" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0grq6bsn967q4vpifld53s7a140nlmpq5vy8ghgr73f4n2mdqlis"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/axelf4/unicode-linebreak")
    (synopsis "Implementation of the Unicode Line Breaking Algorithm")
    (description "Implementation of the Unicode Line Breaking Algorithm")
    (license license:asl2.0)))

(define-public rust-openblas-src-0.9
  (package
    (name "rust-openblas-src")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openblas-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0syy38a5bgv5mj6mb1n1zk1d6l5gqqrswvbmwkwx6h4z9wfrsql4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/blas-lapack-rs/openblas-src")
    (synopsis "The package provides a source of BLAS and LAPACK via OpenBLAS.")
    (description
      "The package provides a source of BLAS and LAPACK via OpenBLAS.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlib-src-0.8
  (package
    (name "rust-netlib-src")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "netlib-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "04l2ggdaq0bjc64prsw2f8ddxn84m1rmpnkjb9nr0ijdpcv1zx1r"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-cmake" ,rust-cmake-0.1))))
    (home-page "https://github.com/blas-lapack-rs/netlib-src")
    (synopsis "The package provides a source of BLAS and LAPACK via Netlib.")
    (description
      "The package provides a source of BLAS and LAPACK via Netlib.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-intel-mkl-tool-0.1
  (package
    (name "rust-intel-mkl-tool")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "intel-mkl-tool" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1myyrxvmyij4c60w9x15npwzhlbjm8y8c94lvfsnrl5pbyakz8md"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-curl" ,rust-curl-0.4)
         ("rust-dirs" ,rust-dirs-2)
         ("rust-env-logger" ,rust-env-logger-0.7)
         ("rust-failure" ,rust-failure-0.1)
         ("rust-glob" ,rust-glob-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-structopt" ,rust-structopt-0.3)
         ("rust-tar" ,rust-tar-0.4)
         ("rust-zstd" ,rust-zstd-0.5))))
    (home-page "https://github.com/rust-math/intel-mkl-src")
    (synopsis "CLI utility for redistributiing Intel(R) MKL")
    (description "CLI utility for redistributiing Intel(R) MKL")
    (license license:expat)))

(define-public rust-intel-mkl-src-0.5
  (package
    (name "rust-intel-mkl-src")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "intel-mkl-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "155q49a7nfbq1lllchsyx8jv2q2pijrjh1w08awvrbjyfcxb6q3j"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-intel-mkl-tool" ,rust-intel-mkl-tool-0.1))))
    (home-page "https://github.com/rust-math/intel-mkl-src")
    (synopsis "Redistribution of Intel(R) MKL as a crate")
    (description "Redistribution of Intel(R) MKL as a crate")
    (license #f)))

(define-public rust-accelerate-src-0.3
  (package
    (name "rust-accelerate-src")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "accelerate-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17fiqyq7f9k41pbsyrvk9pxyx9z6fw399wq036cvwkbmb14xcpj1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/blas-lapack-rs/accelerate-src")
    (synopsis
      "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
    (description
      "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-blas-src-0.6
  (package
    (name "rust-blas-src")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "blas-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0a134wadi4rslfqk4mafi6y7bbvacjh12x87621w4vyc3dni6px2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-accelerate-src" ,rust-accelerate-src-0.3)
         ("rust-intel-mkl-src" ,rust-intel-mkl-src-0.5)
         ("rust-netlib-src" ,rust-netlib-src-0.8)
         ("rust-openblas-src" ,rust-openblas-src-0.9))))
    (home-page "https://github.com/blas-lapack-rs/blas-src")
    (synopsis "The package provides a BLAS source of choice.")
    (description "The package provides a BLAS source of choice.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ndarray-0.14
  (package
    (name "rust-ndarray")
    (version "0.14.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ndarray" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "011wqzmrd9gpfcfvy1xfbskqfiahn96pmi2d0r9x34d682amq3bc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-approx" ,rust-approx-0.4)
         ("rust-blas-src" ,rust-blas-src-0.6)
         ("rust-cblas-sys" ,rust-cblas-sys-0.1)
         ("rust-matrixmultiply" ,rust-matrixmultiply-0.2)
         ("rust-num-complex" ,rust-num-complex-0.3)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-rawpointer" ,rust-rawpointer-0.2)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-ndarray/ndarray")
    (synopsis
      "An n-dimensional array for general elements and for numerics. Lightweight array views and slicing; views support chunking and splitting.")
    (description
      "An n-dimensional array for general elements and for numerics.  Lightweight array
views and slicing; views support chunking and splitting.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smawk-0.3
  (package
    (name "rust-smawk")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "smawk" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hv0q1mw1r1brk7v3g4a80j162p7g1dri4bdidykrakzfqjd4ypn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-ndarray" ,rust-ndarray-0.14))))
    (home-page "https://github.com/mgeisler/smawk")
    (synopsis "Functions for finding row-minima in a totally monotone matrix.")
    (description
      "This package provides functions for finding row-minima in a totally monotone
matrix.")
    (license license:expat)))

(define-public rust-hyphenation-commons-0.8
  (package
    (name "rust-hyphenation-commons")
    (version "0.8.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hyphenation_commons" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1gq59h9h8597k04yl53an0j56cvb0in98pxpp27dkiz5mnifgssz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-fst" ,rust-fst-0.4) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/tapeinosyne/hyphenation")
    (synopsis "Proemial code for the `hyphenation` library")
    (description "Proemial code for the `hyphenation` library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fst-0.4
  (package
    (name "rust-fst")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fst" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "06mnksicgv9rp8b7w0ykkshf355l05zym3ygm74qr5z30ndmpf3s"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-utf8-ranges" ,rust-utf8-ranges-1))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
      "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).
")
    (description
      "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).")
    (license (list license:unlicense license:expat))))

(define-public rust-hyphenation-0.8
  (package
    (name "rust-hyphenation")
    (version "0.8.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hyphenation" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1w2hib167vpz7jbg3zs92ifihj4akirlhb5509aib1df8i6dvx5w"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bincode" ,rust-bincode-1)
         ("rust-bincode" ,rust-bincode-1)
         ("rust-fst" ,rust-fst-0.4)
         ("rust-fst" ,rust-fst-0.4)
         ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
         ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
         ("rust-pocket-resources" ,rust-pocket-resources-0.3)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/tapeinosyne/hyphenation")
    (synopsis "Knuth-Liang hyphenation for a variety of languages")
    (description "Knuth-Liang hyphenation for a variety of languages")
    (license (list license:asl2.0 license:expat))))

(define-public rust-textwrap-0.14
  (package
    (name "rust-textwrap")
    (version "0.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "textwrap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "106xjfzfpk3nj51fx9slf9kyir7xjwvpqm003v9ardgq5b8whrh0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-hyphenation" ,rust-hyphenation-0.8)
         ("rust-smawk" ,rust-smawk-0.3)
         ("rust-terminal-size" ,rust-terminal-size-0.1)
         ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
         ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
      "Powerful library for word wrapping, indenting, and dedenting strings")
    (description
      "Powerful library for word wrapping, indenting, and dedenting strings")
    (license license:expat)))

(define-public rust-uniquote-3
  (package
    (name "rust-uniquote")
    (version "3.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "uniquote" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gqwq3kbzdsj5qsc8jfm5v4qwzgnp4rrfvdpm71ch1593h22y664"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dylni/uniquote")
    (synopsis "Quote strings for clear display in output
")
    (description "Quote strings for clear display in output")
    (license (list license:expat license:asl2.0))))

(define-public rust-print-bytes-0.5
  (package
    (name "rust-print-bytes")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "print_bytes" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0d4i9y3jx1chi6w97a8rgdbwm9g3cppr53rw53zl6fcaq31qx0b6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/dylni/print_bytes")
    (synopsis "Print bytes as losslessly as possible
")
    (description "Print bytes as losslessly as possible")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-str-bytes-6
  (package
    (name "rust-os-str-bytes")
    (version "6.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "os_str_bytes" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0r5z5xds2wzzqlqjaw96dpjsz5nqyzc1rflm4mh09aa32qyl88lf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-memchr" ,rust-memchr-2)
         ("rust-print-bytes" ,rust-print-bytes-0.5)
         ("rust-uniquote" ,rust-uniquote-3))))
    (home-page "https://github.com/dylni/os_str_bytes")
    (synopsis
      "Utilities for converting between byte sequences and platform-native strings
")
    (description
      "Utilities for converting between byte sequences and platform-native strings")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-3
  (package
    (name "rust-clap-derive")
    (version "3.0.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0anr3wr9fgn9yl4vqv4yqsixdw5ngqwddxzvsj5k6bx2jy0hglhg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-heck" ,rust-heck-0.4)
         ("rust-proc-macro-error" ,rust-proc-macro-error-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
    (synopsis
      "Parse command line argument by defining a struct, derive crate.")
    (description
      "Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-3
  (package
    (name "rust-clap")
    (version "3.0.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hwziwihny04x12spk5dga9va6hp78hrzq61in8l1pf7nmagmzia"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-atty" ,rust-atty-0.2)
         ("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-clap-derive" ,rust-clap-derive-3)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-os-str-bytes" ,rust-os-str-bytes-6)
         ("rust-regex" ,rust-regex-1)
         ("rust-strsim" ,rust-strsim-0.10)
         ("rust-termcolor" ,rust-termcolor-1)
         ("rust-terminal-size" ,rust-terminal-size-0.1)
         ("rust-textwrap" ,rust-textwrap-0.14)
         ("rust-unicase" ,rust-unicase-2)
         ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
      "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
      "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-bytesize-1
  (package
    (name "rust-bytesize")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bytesize" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0w7wmmbcirxp5isza0i1lxq5d7r7f0z1pxbxl5f6s1n5m8vfqn3c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/hyunsik/bytesize/")
    (synopsis "an utility for human-readable bytes representations")
    (description "an utility for human-readable bytes representations")
    (license license:asl2.0)))

(define-public rust-anyhow-1
  (package
    (name "rust-anyhow")
    (version "1.0.53")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "anyhow" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1q06xg4jn4lpad7lj1af28x5xdwymgl1k820zj2nnrhlbi2mp94l"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis "Flexible concrete Error type built on std::error::Error")
    (description "Flexible concrete Error type built on std::error::Error")
    (license (list license:expat license:asl2.0))))

(define-public rust-ftzz-1
  (package
    (name "rust-ftzz")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ftzz" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0xf9xq4ywfsbj9d48d68m5m8gbim5b6p79zh1ja9vdqynm7yhd5f"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-anyhow" ,rust-anyhow-1)
         ("rust-bytesize" ,rust-bytesize-1)
         ("rust-clap" ,rust-clap-3)
         ("rust-clap-num" ,rust-clap-num-1)
         ("rust-clap-verbosity-flag" ,rust-clap-verbosity-flag-0.4)
         ("rust-cli-errors" ,rust-cli-errors-0.2)
         ("rust-derive-builder" ,rust-derive-builder-0.10)
         ("rust-exitcode" ,rust-exitcode-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-nix" ,rust-nix-0.23)
         ("rust-num-format" ,rust-num-format-0.4)
         ("rust-num-cpus" ,rust-num-cpus-1)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-rand-distr" ,rust-rand-distr-0.4)
         ("rust-rand-xorshift" ,rust-rand-xorshift-0.3)
         ("rust-simple-logger" ,rust-simple-logger-1)
         ("rust-tokio" ,rust-tokio-1))
        #:cargo-development-inputs
        (("rust-criterion" ,rust-criterion-0.3)
         ("rust-more-asserts" ,rust-more-asserts-0.2)
         ("rust-rstest" ,rust-rstest-0.12)
         ("rust-seahash" ,rust-seahash-4)
         ("rust-stack-buffer" ,rust-stack-buffer-0.2)
         ("rust-tempfile" ,rust-tempfile-3))
       #:features '("strip")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enable-unstable-features
           (lambda _
             (setenv "RUSTC_BOOTSTRAP" "1")
             #t)))))
    (home-page "https://github.com/SUPERCILEX/ftzz")
    (synopsis
      "File Tree Fuzzer creates a pseudo-random directory hierarchy filled with some number of files.")
    (description
      "File Tree Fuzzer creates a pseudo-random directory hierarchy filled with some
number of files.")
    (license license:asl2.0)))
