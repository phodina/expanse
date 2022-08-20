(define-module (expanse packages guppy)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-pretty-assertions-1
  (package
    (name "rust-pretty-assertions")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pretty_assertions" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0l2xpgqa1a73fkbacn0qxngixwmyp1fb90k496sql095nx4bbmbn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-ansi-term" ,rust-ansi-term-0.12)
         ("rust-ctor" ,rust-ctor-0.1)
         ("rust-diff" ,rust-diff-0.1)
         ("rust-output-vt100" ,rust-output-vt100-0.1))))
    (home-page "https://github.com/colin-kiegel/rust-pretty-assertions")
    (synopsis
      "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.")
    (description
      "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding
colorful diffs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-target-lexicon-0.12
  (package
    (name "rust-target-lexicon")
    (version "0.12.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "target-lexicon" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1hbs7gs6br3r7hkjw011bnfbddpfla2i9h5klvy8bjrs0iapxynp"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/bytecodealliance/target-lexicon")
    (synopsis "Targeting utilities for compilers and related tools")
    (description "Targeting utilities for compilers and related tools")
    (license (list license:asl2.0 #f))))

(define-public rust-cfg-expr-0.10
  (package
    (name "rust-cfg-expr")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cfg-expr" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1kdmljn6dhqhbbk12i5hgfpxpzbl7rimwfmjq3z2a2m632wnwnr9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-smallvec" ,rust-smallvec-1)
         ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/EmbarkStudios/cfg-expr")
    (synopsis "A parser and evaluator for Rust `cfg()` expressions.")
    (description
      "This package provides a parser and evaluator for Rust `cfg()` expressions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-target-spec-1
  (package
    (name "rust-target-spec")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "target-spec" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1wd5z8sclhndkwnkc5sihf0xg54cjsbcd4x55c5xk5qgxs1rliva"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-expr" ,rust-cfg-expr-0.10)
         ("rust-guppy-workspace-hack" ,rust-guppy-workspace-hack-0.1)
         ("rust-proptest" ,rust-proptest-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-target-lexicon" ,rust-target-lexicon-0.12))))
    (home-page "https://github.com/facebookincubator/cargo-guppy")
    (synopsis "Evaluate Cargo.toml target specifications")
    (description "Evaluate Cargo.toml target specifications")
    (license (list license:expat license:asl2.0))))

(define-public rust-smallvec-1
  (package
    (name "rust-smallvec")
    (version "1.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "smallvec" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "10zf4fn63p2d6sx8qap3jvyarcfw563308x3431hd4c34r35gpgj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-arbitrary" ,rust-arbitrary-1) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/servo/rust-smallvec")
    (synopsis
      "'Small vector' optimization: store up to a small number of items on the stack")
    (description
      "'Small vector' optimization: store up to a small number of items on the stack")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.79")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde_json" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "158xd1swdvw6y59bx4avb8vdpj727n54r77xw5f7c15kqfjrz3cf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-indexmap" ,rust-indexmap-1)
         ("rust-itoa" ,rust-itoa-1)
         ("rust-ryu" ,rust-ryu-1)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "A JSON serialization file format")
    (description "This package provides a JSON serialization file format")
    (license (list license:expat license:asl2.0))))

(define-public rust-proptest-derive-0.3
  (package
    (name "rust-proptest-derive")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proptest-derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1p4x6k1zxq9lrpk46npdnzj6894mjx5bpwkwrdk63ird72an5d4h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-0.4)
         ("rust-quote" ,rust-quote-0.6)
         ("rust-syn" ,rust-syn-0.15))))
    (home-page
      "https://altsysrq.github.io/proptest-book/proptest-derive/index.html")
    (synopsis "Custom-derive for the Arbitrary trait of proptest.
")
    (description "Custom-derive for the Arbitrary trait of proptest.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pathdiff-0.2
  (package
    (name "rust-pathdiff")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pathdiff" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1pa4dcmb7lwir4himg1mnl97a05b2z0svczg62l8940pbim12dc8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-camino" ,rust-camino-1))))
    (home-page "https://github.com/Manishearth/pathdiff")
    (synopsis "Library for diffing paths to obtain relative paths")
    (description "Library for diffing paths to obtain relative paths")
    (license (list license:expat license:asl2.0))))

(define-public rust-nested-0.1
  (package
    (name "rust-nested")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nested" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17lwhdw0z8c4g00yfdasxh4zc5dq1ccylmbb0n1zw1wgcc7l4aya"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/tafia/nested")
    (synopsis
      "A memory efficient container for nested collections (like `Vec<String>` or `Vec<Vec<T>>`)")
    (description
      "This package provides a memory efficient container for nested collections (like
`Vec<String>` or `Vec<Vec<T>>`)")
    (license license:expat)))

(define-public rust-itertools-0.10
  (package
    (name "rust-itertools")
    (version "0.10.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "itertools" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1qy55fqbaisr9qgbn7cvdvqlfqbh1f4ddf99zwan56z7l6gx3ad9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-either" ,rust-either-1))))
    (home-page "https://github.com/rust-itertools/itertools")
    (synopsis
      "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (description
      "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-indexmap-1
  (package
    (name "rust-indexmap")
    (version "1.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "indexmap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08s2rdps98z4qggzad2cf58nx012lnznn0b5q02a9arcf93n4ai8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-autocfg" ,rust-autocfg-1)
         ("rust-hashbrown" ,rust-hashbrown-0.11)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-rustc-rayon" ,rust-rustc-rayon-0.3)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis
      "A hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys. It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index. A corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed to
indexmap.
")
    (description
      "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value pairs is
independent of the hash values of the keys.  It has the usual hash table
functionality, it preserves insertion order except after removals, and it allows
lookup of its elements by either hash table key or numerical index.  A
corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed
to indexmap.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-guppy-workspace-hack-0.1
  (package
    (name "rust-guppy-workspace-hack")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "guppy-workspace-hack" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "106pg6ifjq92rz5xbbv0aw4xchl1fkikpjry72p0nxczv620cqlj"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/facebookincubator/cargo-guppy")
    (synopsis "workspace-hack package, managed by hakari")
    (description "workspace-hack package, managed by hakari")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-1
  (package
    (name "rust-semver")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "semver" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13gkqi8szcqgn3k6agndw9kfggfa41pm6ir02y3l5lpd0cg3i8x4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
      "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (license (list license:expat license:asl2.0))))

(define-public rust-guppy-summaries-0.6
  (package
    (name "rust-guppy-summaries")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "guppy-summaries" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17kyi5s8l21kiwkanvg0lh6aaz979qvpybwr8vjjg03qzybsv99c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-camino" ,rust-camino-1)
         ("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-diffus" ,rust-diffus-0.10)
         ("rust-semver" ,rust-semver-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-toml" ,rust-toml-0.5))))
    (home-page "https://github.com/facebookincubator/cargo-guppy")
    (synopsis "Build summaries for Cargo, created by guppy.")
    (description "Build summaries for Cargo, created by guppy.")
    (license (list license:expat license:asl2.0))))

(define-public rust-fixedbitset-0.4
  (package
    (name "rust-fixedbitset")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fixedbitset" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0gh5qp6h5ivgbn80klx10lgp1jg0qmvmp58p0cr4qg0bw8lb17r7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/petgraph/fixedbitset")
    (synopsis "FixedBitSet is a simple bitset collection")
    (description "FixedBitSet is a simple bitset collection")
    (license (list license:expat license:asl2.0))))

(define-public rust-debug-ignore-1
  (package
    (name "rust-debug-ignore")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "debug-ignore" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0i8prxp09456asxs4v7r1hb26lapz4rrkpfxl3q92i2fbb6qjc12"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/sunshowers/debug-ignore")
    (synopsis
      "A newtype wrapper that causes a field to be skipped while printing out Debug output.")
    (description
      "This package provides a newtype wrapper that causes a field to be skipped while
printing out Debug output.")
    (license (list license:expat license:asl2.0))))

(define-public rust-camino-1
  (package
    (name "rust-camino")
    (version "1.0.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "camino" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08zwlrqmfy6bds5x0w0cr3zqmasnm1q5i7q4d0h55c1h54k34cbg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/camino-rs/camino")
    (synopsis "UTF-8 paths")
    (description "UTF-8 paths")
    (license (list license:expat license:asl2.0))))

(define-public rust-guppy-0.13
  (package
    (name "rust-guppy")
    (version "0.13.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "guppy" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13b7yw6nw7s5nmb96hx51zpzah787lx3abi1plww1q54isvvyw35"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-camino" ,rust-camino-1)
         ("rust-cargo-metadata" ,rust-cargo-metadata-0.14)
         ("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-debug-ignore" ,rust-debug-ignore-1)
         ("rust-fixedbitset" ,rust-fixedbitset-0.4)
         ("rust-guppy-summaries" ,rust-guppy-summaries-0.6)
         ("rust-guppy-workspace-hack" ,rust-guppy-workspace-hack-0.1)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-itertools" ,rust-itertools-0.10)
         ("rust-nested" ,rust-nested-0.1)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-pathdiff" ,rust-pathdiff-0.2)
         ("rust-petgraph" ,rust-petgraph-0.6)
         ("rust-proptest" ,rust-proptest-1)
         ("rust-proptest-derive" ,rust-proptest-derive-0.3)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-semver" ,rust-semver-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-smallvec" ,rust-smallvec-1)
         ("rust-target-spec" ,rust-target-spec-1)
         ("rust-toml" ,rust-toml-0.5))
        #:cargo-development-inputs
        (("rust-pretty-assertions" ,rust-pretty-assertions-1))))
    (home-page "https://github.com/facebookincubator/cargo-guppy")
    (synopsis "Track and query Cargo dependency graphs.")
    (description "Track and query Cargo dependency graphs.")
    (license (list license:expat license:asl2.0))))
