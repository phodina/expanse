(define-module (expanse packages delta)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-empfindung-0.2
  (package
    (name "rust-empfindung")
    (version "0.2.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "empfindung" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1h68h3sxsa79a47jag3yim5jm63ffz72ifj46xkn12j2s5nss85l"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lab" ,rust-lab-0.11) ("rust-rgb" ,rust-rgb-0.8))))
    (home-page "https://github.com/mina86/empfindung")
    (synopsis
      "Empfindung is a pure-Rust implementation of the CIEDE2000 colour difference")
    (description
      "Empfindung is a pure-Rust implementation of the CIEDE2000 colour difference")
    (license license:expat)))

(define-public rust-ansi-colours-1
  (package
    (name "rust-ansi-colours")
    (version "1.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ansi-colours" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13yjl5ywszm46nsc25xkvas64pnxrf68yv9wrgqxk6m471hzpqk0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-cc" ,rust-cc-1))
        #:cargo-development-inputs
        (("rust-empfindung" ,rust-empfindung-0.2)
         ("rust-lab" ,rust-lab-0.11))))
    (home-page "https://github.com/mina86/ansi_colours")
    (synopsis "true-colour â\x86\x94 ANSI terminal palette converter")
    (description "true-colour â\x86\x94 ANSI terminal palette converter")
    (license license:lgpl3+)))

(define-public rust-ansi-term-0.12
  (package
    (name "rust-ansi-term")
    (version "0.12.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ansi-term" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ljmkbilxgmhavxvxqa7qvm6f3fjggi7q2l3a72q9x0cxjvrnanm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-serde" ,rust-serde-1) ("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-doc-comment" ,rust-doc-comment-0.3)
         ("rust-regex" ,rust-regex-1)
         ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/ogham/rust-ansi-term")
    (synopsis "Library for ANSI terminal colours and styles (bold, underline)")
    (description
      "Library for ANSI terminal colours and styles (bold, underline)")
    (license license:expat)))

(define-public rust-box-drawing-0.1
  (package
    (name "rust-box-drawing")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "box-drawing" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0jx4rrxy4xmgmplmgl398vrng67sfl8qny7n7d91fyw6zpaxh9za"))))
    (build-system cargo-build-system)
    (home-page "https://gitlab.com/chronos.alfa/box_drawing.git")
    (synopsis
      "A very simple library containing constants for UTF-8 box drawing.")
    (description
      "This package provides a very simple library containing constants for UTF-8 box
drawing.")
    (license license:expat)))

(define-public rust-bytelines-2
  (package
    (name "rust-bytelines")
    (version "2.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bytelines" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0pv1dwbbqws84v31f64g6b3nxi0jbhi59cipwpg6651ys504w7kr"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/whitfin/bytelines")
    (synopsis "Read input lines as byte slices for high efficiency")
    (description "Read input lines as byte slices for high efficiency")
    (license license:expat)))

(define-public rust-rand-mt-4
  (package
    (name "rust-rand-mt")
    (version "4.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rand_mt" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1bbsbkckcbidp2520bc8zs43yp11lxpkxfmiqrl00h3kxri5q0c8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rand-core" ,rust-rand-core-0.6))))
    (home-page "https://github.com/artichoke/rand_mt")
    (synopsis "Reference Mersenne Twister random number generators.")
    (description "Reference Mersenne Twister random number generators.")
    (license (list license:expat license:asl2.0))))

(define-public rust-phf-shared-0.9
  (package
    (name "rust-phf-shared")
    (version "0.9.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_shared" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ng0hi2byifqah6bcdy3zcpbwq8jxgl4laz65gq40dp3dm11i0x6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-siphasher" ,rust-siphasher-0.3)
         ("rust-uncased" ,rust-uncased-0.9)
         ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description "Support code shared by PHF libraries")
    (license license:expat)))

(define-public rust-phf-generator-0.9
  (package
    (name "rust-phf-generator")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_generator" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "10ih96kaxnkn1yxk3ghpzgm09nc0rn69fd52kv68003fv4h34gyl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-criterion" ,rust-criterion-0.3)
         ("rust-phf-shared" ,rust-phf-shared-0.9)
         ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license license:expat)))

(define-public rust-phf-macros-0.9
  (package
    (name "rust-phf-macros")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_macros" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1rpc0jy5sfrk3ir87k2q0kk44a45nsrbwc131jmsi6f8hi3fqi7g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-phf-generator" ,rust-phf-generator-0.9)
         ("rust-phf-shared" ,rust-phf-shared-0.9)
         ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1)
         ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Macros to generate types in the phf crate")
    (description "Macros to generate types in the phf crate")
    (license license:expat)))

(define-public rust-phf-0.9
  (package
    (name "rust-phf")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0sk9arhiv4hkg3hbmbxnpjvr0bffhyz7kpb2pn86mn6ia4c566xj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-phf-macros" ,rust-phf-macros-0.9)
         ("rust-phf-shared" ,rust-phf-shared-0.9)
         ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/sfackler/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description "Runtime support for perfect hash function data structures")
    (license license:expat)))

(define-public rust-find-crate-0.6
  (package
    (name "rust-find-crate")
    (version "0.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "find-crate" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ljpkh11gj7940xwz47xjhsvfbl93c2q0ql7l2v0w77amjx8paar"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-toml" ,rust-toml-0.5))))
    (home-page "https://github.com/taiki-e/find-crate")
    (synopsis "Find the crate name from the current Cargo.toml.
")
    (description "Find the crate name from the current Cargo.toml.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-palette-derive-0.6
  (package
    (name "rust-palette-derive")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1b9vsd2sdx060kwsfy73ab7n6y2facps8yrw36hxi9m87q2w76bp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-find-crate" ,rust-find-crate-0.6)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis "Automatically implement traits from the palette crate.")
    (description "Automatically implement traits from the palette crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-palette-0.6
  (package
    (name "rust-palette")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "062x8giqxwvrwqv8fyjr4dpq19v19drc4pfdp90gg8si3rz5ywzr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-approx" ,rust-approx-0.5)
         ("rust-bytemuck" ,rust-bytemuck-1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-palette-derive" ,rust-palette-derive-0.6)
         ("rust-phf" ,rust-phf-0.9)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-serde" ,rust-serde-1))
        #:cargo-development-inputs
        (("rust-clap" ,rust-clap-2)
         ("rust-criterion" ,rust-criterion-0.3)
         ("rust-csv" ,rust-csv-1)
         ;("rust-image" ,rust-image-0.23)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-rand-mt" ,rust-rand-mt-4)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-derive" ,rust-serde-derive-1)
         ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis
      "Convert and manage colors with a focus on correctness, flexibility and ease of use.")
    (description
      "Convert and manage colors with a focus on correctness, flexibility and ease of
use.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syntect-4
  (package
    (name "rust-syntect")
    (version "4.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syntect" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0cd0rbi5r83p9pqph0gyj3vgr18ihh54amv9dvh0pvl0prdq284b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bincode" ,rust-bincode-1)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-fancy-regex" ,rust-fancy-regex-0.7)
         ("rust-flate2" ,rust-flate2-1)
         ("rust-fnv" ,rust-fnv-1)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-lazycell" ,rust-lazycell-1)
         ("rust-onig" ,rust-onig-6)
         ("rust-plist" ,rust-plist-1)
         ("rust-regex-syntax" ,rust-regex-syntax-0.6)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-derive" ,rust-serde-derive-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-walkdir" ,rust-walkdir-2)
         ("rust-yaml-rust" ,rust-yaml-rust-0.4))
        #:cargo-development-inputs
        (("rust-criterion" ,rust-criterion-0.3)
         ("rust-getopts" ,rust-getopts-0.2)
         ("rust-pretty-assertions" ,rust-pretty-assertions-0.6)
         ("rust-rayon" ,rust-rayon-1)
         ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/trishume/syntect")
    (synopsis
      "library for high quality syntax highlighting and code intelligence using Sublime Text's grammars")
    (description
      "library for high quality syntax highlighting and code intelligence using Sublime
Text's grammars")
    (license license:expat)))

(define-public rust-libgit2-sys-0.12
  (package
    (name "rust-libgit2-sys")
    (version "0.12.26+1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "libgit2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "153l8nvz9p8vyd5840xi6fwblvhpn3c33jwdwsznyq4f4jcwiq8r"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cc" ,rust-cc-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
         ("rust-libz-sys" ,rust-libz-sys-1)
         ("rust-openssl-sys" ,rust-openssl-sys-0.9)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Native bindings to the libgit2 library")
    (description "Native bindings to the libgit2 library")
    (license (list license:expat license:asl2.0))))

(define-public rust-git2-0.13
  (package
    (name "rust-git2")
    (version "0.13.25")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "git2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1mppxyjzi69m879mwpin4d9jljanwaijlx3f5w3fdh143g62k4pj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libgit2-sys" ,rust-libgit2-sys-0.12)
         ("rust-log" ,rust-log-0.4)
         ("rust-openssl-probe" ,rust-openssl-probe-0.1)
         ("rust-openssl-sys" ,rust-openssl-sys-0.9)
         ("rust-url" ,rust-url-2))
        #:cargo-development-inputs
        (("rust-paste" ,rust-paste-1)
         ("rust-structopt" ,rust-structopt-0.3)
         ("rust-tempfile" ,rust-tempfile-3)
         ("rust-time" ,rust-time-0.1))))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis
      "Bindings to libgit2 for interoperating with git repositories. This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.
")
    (description
      "Bindings to libgit2 for interoperating with git repositories.  This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ctrlc-3
  (package
    (name "rust-ctrlc")
    (version "3.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ctrlc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1gy73qwcchh802nc4vdr5cv16nnq1fr3wwkd6jih736wzznnr751"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-nix" ,rust-nix-0.23) ("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Detegr/rust-ctrlc")
    (synopsis "Easy Ctrl-C handler for Rust projects")
    (description "Easy Ctrl-C handler for Rust projects")
    (license (list license:expat license:asl2.0))))

(define-public rust-error-chain-0.12
  (package
    (name "rust-error-chain")
    (version "0.12.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "error-chain" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1z6y5isg0il93jp287sv7pn10i4wrkik2cpyk376wl61rawhcbrd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/rust-lang-nursery/error-chain")
    (synopsis "Yet another error boilerplate library.")
    (description "Yet another error boilerplate library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-delta
  (package
    (name "rust-delta")
    (version "0.11.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/dandavison/delta")
	   (commit version)))
       (sha256
        (base32
         "1vv9izw61yqcbij0fh042v28silwl20h3nb1slicawni6m9ig6ma"))))
    (build-system cargo-build-system)
	(arguments
	`(#:cargo-inputs
	(("rust-chrono" ,rust-chrono-0.4)
("rust-chrono-humanize" ,rust-chrono-humanize-0.2)
("rust-ansi-colours" ,rust-ansi-colours-1)
("rust-ansi-term" ,rust-ansi-term-0.12)
("rust-atty" ,rust-atty-0.2)
("rust-bitflags" ,rust-bitflags-1)
("rust-box-drawing" ,rust-box-drawing-0.1)
("rust-bytelines" ,rust-bytelines-2)
("rust-clap" ,rust-clap-3)
("rust-console" ,rust-console-0.15)
("rust-ctrlc" ,rust-ctrlc-3)
("rust-dirs-next" ,rust-dirs-next-2)
("rust-grep-cli" ,rust-grep-cli-0.1)
("rust-itertools" ,rust-itertools-0.10)
("rust-lazy-static" ,rust-lazy-static-1)
("rust-palette" ,rust-palette-0.6)
("rust-pathdiff" ,rust-pathdiff-0.2)
("rust-regex" ,rust-regex-1)
("rust-serde" ,rust-serde-1)
("rust-serde-json" ,rust-serde-json-1)
("rust-shell-words" ,rust-shell-words-1)
("rust-smol-str" ,rust-smol-str-0.1)
("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
("rust-unicode-width" ,rust-unicode-width-0.1)
("rust-vte" ,rust-vte-0.10)
("rust-git2" ,rust-git2-0.13)
("rust-syntect" ,rust-syntect-4)
("rust-sysinfo" ,rust-sysinfo-0.23)
("rust-error-chain" ,rust-error-chain-0.12)
("rust-xdg" ,rust-xdg-2))))
    (home-page
     "https://github.com/dandavison/delta")
    (synopsis
     "Syntax-highlighting pager for git, diff, and grep output")
    (description "This package provides a syntax-highlighting pager for git,
diff, and grep output.")
    (license license:expat)))
