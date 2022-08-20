(define-module (expanse packages riff)
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

(define-public rust-threadpool-1
  (package
    (name "rust-threadpool")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "threadpool" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1amgfyzvynbm8pacniivzq9r0fh3chhs7kijic81j76l6c5ycl6h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-num-cpus" ,rust-num-cpus-1))))
    (home-page "https://github.com/rust-threadpool/rust-threadpool")
    (synopsis
     "A thread pool for running a number of jobs on a fixed set of worker threads.
")
    (description
     "This package provides a thread pool for running a number of jobs on a fixed set
of worker threads.")
    (license (list license:expat license:asl2.0))))

(define-public rust-isatty-0.1
  (package
    (name "rust-isatty")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "isatty" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1p2yx591kwz2b3f2bv7al9hamhn052zmz9jd969rdv4kzj0q46p3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-0.1)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-redox-syscall" ,rust-redox-syscall-0.1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "")
    (synopsis "Deprecated -- use the `atty` crate")
    (description "Deprecated -- use the `atty` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-packed-simd-2-0.3
  (package
    (name "rust-packed-simd-2")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "packed_simd_2" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "10p2bm0p57shg3arlpfwm6z0bbnlkyr4g0dlkmpwvz6qaba4r4d1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-core-arch" ,rust-core-arch-0.1)
                       ("rust-libm" ,rust-libm-0.1)
                       ("rust-sleef-sys" ,rust-sleef-sys-0.1))))
    (home-page "https://github.com/rust-lang/packed_simd")
    (synopsis "Portable Packed SIMD vectors")
    (description "Portable Packed SIMD vectors")
    (license (list license:expat license:asl2.0))))
(define-public rust-bytecount-0.6
  (package
    (name "rust-bytecount")
    (version "0.6.3")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "bytecount" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "173wsvyagflb7ic3hpvp1db6q3dsigr452inslnzmsb3ix3nlrrc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-packed-simd-2" ,rust-packed-simd-2-0.3))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.3)
                                   ("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/llogiq/bytecount")
    (synopsis
     "count occurrences of a given byte, or the number of UTF-8 code points, in a byte slice, fast")
    (description
     "count occurrences of a given byte, or the number of UTF-8 code points, in a byte
slice, fast")
    (license (list license:asl2.0 license:expat))))

(define-public riff
  (package
    (name "riff")
    (version "2.18.1")
    (home-page "https://github.com/walles/riff")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "1qa65dfhc3s0lli70jjcj7bmhnfdsp1q4913myp2pdibd1jmgcz4"))))
    (build-system cargo-build-system)
	(arguments
	`(#:cargo-inputs
	  (("rust-diffus" ,rust-diffus-0.10)
	   ("rust-regex" ,rust-regex-1)
	   ("rust-lazy-static" ,rust-lazy-static-1)
	   ("rust-isatty" ,rust-isatty-0.1)
	   ("rust-git-version" ,rust-git-version-0.3)
	   ("rust-backtrace" ,rust-backtrace-0.3)
	   ("rust-bytecount" ,rust-bytecount-0.6)
	   ("rust-num-cpus" ,rust-num-cpus-1)
	   ("rust-threadpool" ,rust-threadpool-1))
      #:cargo-development-inputs
	  (("rust-pretty-assertions" ,rust-pretty-assertions-0.6)
	   ("rust-tempfile" ,rust-tempfile-3))))
    (synopsis
     "Diff Filter highliting")
    (description
     "")
    (license license:expat)))
