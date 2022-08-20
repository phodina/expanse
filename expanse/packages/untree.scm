(define-module (expanse packages untree)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (expanse packages ftzz)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-embed-doc-image-0.1
  (package
    (name "rust-embed-doc-image")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "embed-doc-image" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0vhn8wnbkm61ranfhpmzrs7mbyjqarcrcs6b4lj857bd4f8zadmg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-base64" ,rust-base64-0.13)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Andlon/embed-doc-image")
    (synopsis "Embed images in Rust documentation")
    (description "Embed images in Rust documentation")
    (license license:expat)))

(define-public rust-kstring-1
  (package
    (name "rust-kstring")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "kstring" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09j5xb3rnjd3kmc2v667wzsc4mz4c1hl1vkzszbj30fyxb60qccb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/cobalt-org/kstring")
    (synopsis "Key String: optimized for map keys")
    (description "Key String: optimized for map keys")
    (license (list license:expat license:asl2.0))))

(define-public rust-combine-4
  (package
    (name "rust-combine")
    (version "4.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "combine" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0qihymj493vvs054gzpcmp4lzb098zrj2p9miv19yzvrrjm2gdsh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bytes" ,rust-bytes-0.5)
         ("rust-bytes" ,rust-bytes-1)
         ("rust-futures-core" ,rust-futures-core-0.3)
         ("rust-futures-io" ,rust-futures-io-0.3)
         ("rust-memchr" ,rust-memchr-2)
         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
         ("rust-regex" ,rust-regex-1)
         ("rust-tokio" ,rust-tokio-1)
         ("rust-tokio" ,rust-tokio-0.3)
         ("rust-tokio" ,rust-tokio-0.2)
         ("rust-tokio-util" ,rust-tokio-util-0.6))))
    (home-page "https://github.com/Marwes/combine")
    (synopsis
      "Fast parser combinators on arbitrary streams with zero-copy support.")
    (description
      "Fast parser combinators on arbitrary streams with zero-copy support.")
    (license license:expat)))

(define-public rust-toml-edit-0.12
  (package
    (name "rust-toml-edit")
    (version "0.12.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "toml_edit" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0wx4wd849bmkqj0gdi041gmpfpvlyhy2ha4zpin69yw9d9npl8cl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-combine" ,rust-combine-4)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-itertools" ,rust-itertools-0.10)
         ("rust-kstring" ,rust-kstring-1)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/ordian/toml_edit")
    (synopsis "Yet another format-preserving TOML parser.")
    (description "Yet another format-preserving TOML parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-shlex-1
  (package
    (name "rust-shlex")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shlex" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "18zqcay2dgxgrd1r645mb79m4q745jcrqj659k11bwh99lx8bcj3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/comex/rust-shlex")
    (synopsis "Split a string into shell words, like Python's shlex.")
    (description "Split a string into shell words, like Python's shlex.")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-pipe-1
  (package
    (name "rust-os-pipe")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "os_pipe" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09xbp0wdpc2043qn8nf400p9ng81wbf2gm1yw9gqj6rkrbmr4d0f"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2) ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/oconnor663/os_pipe.rs")
    (synopsis "a cross-platform library for opening OS pipes")
    (description "a cross-platform library for opening OS pipes")
    (license license:expat)))

(define-public rust-humantime-serde-1
  (package
    (name "rust-humantime-serde")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "humantime-serde" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0n208zzy69f7pgwcm1d0id4nzhssxn3z3zy7ki3dpkaazmnaad5c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-humantime" ,rust-humantime-2) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/jean-airoldie/humantime-serde")
    (synopsis "Serde support for the `humantime` crate")
    (description "Serde support for the `humantime` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-escargot-0.5
  (package
    (name "rust-escargot")
    (version "0.5.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "escargot" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "19h1yvg9x7lvyb7p75ypyb94sacns5dkxwc4fa56mcksgnhlnn7m"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/crate-ci/escargot")
    (synopsis "Cargo API written in Paris")
    (description "Cargo API written in Paris")
    (license (list license:expat license:asl2.0))))

(define-public rust-concolor-query-0.0.5
  (package
    (name "rust-concolor-query")
    (version "0.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "concolor-query" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0jcll1lnnkbdr6xcgppf6dr0ra9rxcp78xr1zlrvba03zkk7yhfn"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/rust-cli/concolor")
    (synopsis "Look up colored console capabilities")
    (description "Look up colored console capabilities")
    (license (list license:expat license:asl2.0))))

(define-public rust-concolor-0.0.8
  (package
    (name "rust-concolor")
    (version "0.0.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "concolor" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1bs03868bywgz2f8x4h41akvxpxiax9b036hrpf0mwhx7db6flh1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-atty" ,rust-atty-0.2)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-concolor-query" ,rust-concolor-query-0.0.5))))
    (home-page "https://github.com/rust-cli/concolor")
    (synopsis "Control console coloring across all dependencies")
    (description "Control console coloring across all dependencies")
    (license (list license:expat license:asl2.0))))

(define-public rust-trycmd-0.9
  (package
    (name "rust-trycmd")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "trycmd" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13b37rjdcczi04qkv048y5jc9z8vfx7cirlqwl1cmpb9fh2vn0ra"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-concolor" ,rust-concolor-0.0.8)
         ("rust-content-inspector" ,rust-content-inspector-0.2)
         ("rust-difflib" ,rust-difflib-0.4)
         ("rust-dunce" ,rust-dunce-1)
         ("rust-escargot" ,rust-escargot-0.5)
         ("rust-glob" ,rust-glob-0.3)
         ("rust-humantime" ,rust-humantime-2)
         ("rust-humantime-serde" ,rust-humantime-serde-1)
         ("rust-normalize-line-endings" ,rust-normalize-line-endings-0.3)
         ("rust-os-pipe" ,rust-os-pipe-1)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-schemars" ,rust-schemars-0.8)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-shlex" ,rust-shlex-1)
         ("rust-tempfile" ,rust-tempfile-3)
         ("rust-toml-edit" ,rust-toml-edit-0.12)
         ("rust-wait-timeout" ,rust-wait-timeout-0.2)
         ("rust-walkdir" ,rust-walkdir-2)
         ("rust-yansi" ,rust-yansi-0.5))))
    (home-page "https://github.com/assert-rs/trycmd")
    (synopsis "Snapshot testing for a herd of CLI tests")
    (description "Snapshot testing for a herd of CLI tests")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-clap-derive-33
  (package
    (name "rust-clap-derive")
    (version "3.0.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "11daqrx6asa985qr3mcjw11h4p8akwx6p44bvlh1rcs477f344cs"))))
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

(define-public rust-clap-33
  (package
    (name "rust-clap")
    (version "3.0.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gpd7qpiy6gk6wn3filb737237m97l3sk6631k7s3iv1r699yy88"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-atty" ,rust-atty-0.2)
         ("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-clap-derive" ,rust-clap-derive-33)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-os-str-bytes" ,rust-os-str-bytes-6)
         ("rust-regex" ,rust-regex-1)
         ("rust-strsim" ,rust-strsim-0.10)
         ("rust-termcolor" ,rust-termcolor-1)
         ("rust-terminal-size" ,rust-terminal-size-0.1)
         ("rust-textwrap" ,rust-textwrap-0.14)
         ("rust-unicase" ,rust-unicase-2)
         ("rust-yaml-rust" ,rust-yaml-rust-0.4))
        #:cargo-development-inputs
        (("rust-criterion" ,rust-criterion-0.3)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-regex" ,rust-regex-1)
         ("rust-rustversion" ,rust-rustversion-1)
         ("rust-trybuild" ,rust-trybuild-1)
         ("rust-trycmd" ,rust-trycmd-0.9))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
      "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
      "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public untree
  (package
    (name "untree")
    (version "0.9.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/codeinred/untree")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0gnz15s74b2hhiss2sdk900nmflqc0imznc6dxl4c2b9bifw5hxs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
	   (("rust-colored" ,rust-colored-2)
	   ("rust-quick-error" ,rust-quick-error-2)
	   ("rust-textwrap" ,rust-textwrap-0.14)
	   ("rust-embed-doc-image" ,rust-embed-doc-image-0.1)
	   ("rust-clap" ,rust-clap-33))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-version-requirements
           (lambda _
             (substitute* "Cargo.toml"
               (("3.0.13")
                ,(package-version rust-clap-33))))))))
    (home-page
     "https://github.com/codeinred/untree")
    (synopsis
     "Inverts the action of tree")
    (description
     "")
    (license license:expat)))
