(define-module (expanse packages adsb)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-hexlit-0.5
  (package
    (name "rust-hexlit")
    (version "0.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hexlit" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "02vb2d2j1azgkkwl9j8jksjbhza9aahwv58mk1q9hvn0m0j4606j"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/inspier/hexlit")
    (synopsis
      "A zero-allocation no_std-compatible zero-cost way to convert hex-strings to byte-arrays at compile time.")
    (description
      "This package provides a zero-allocation no_std-compatible zero-cost way to
convert hex-strings to byte-arrays at compile time.")
    (license license:expat)))

(define-public rust-assert-hex-0.2
  (package
    (name "rust-assert-hex")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "assert_hex" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08y71m95naxgjzv00kamlqy4fc3c9c3f29a51ab3708bxlijhy5w"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/wcampbell0x2a/assert_hex")
    (synopsis "display assert panics in hexadecimal {:#x?} format")
    (description "display assert panics in hexadecimal {:#x?} format")
    (license license:expat)))

(define-public rust-deku-derive-0.12
  (package
    (name "rust-deku-derive")
    (version "0.12.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "deku_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1871v80d6vbvzv954yyzp6xs09jcw7n0yapaklccrffnqpsz1xwv"))))
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
    (home-page "https://github.com/sharksforarms/deku")
    (synopsis "bit level serialization/deserialization proc-macro for structs")
    (description
      "bit level serialization/deserialization proc-macro for structs")
    (license (list license:expat license:asl2.0))))

(define-public rust-deku-0.12
  (package
    (name "rust-deku")
    (version "0.12.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "deku" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1fkcy7s7szcxly6bczy9ppipqqyac2s8hyy37fwkl08i125wndk6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitvec" ,rust-bitvec-0.22)
         ("rust-deku-derive" ,rust-deku-derive-0.12))))
    (home-page "https://github.com/sharksforarms/deku")
    (synopsis "bit level serialization/deserialization proc-macro for structs")
    (description
      "bit level serialization/deserialization proc-macro for structs")
    (license (list license:expat license:asl2.0))))

;; requires rust-1.58.1
(define-public rust-adsb-deku-0.5
  (package
    (name "rust-adsb-deku")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "adsb_deku" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1f2lnmaxqqdlclfwkpg0n1jcpglbxvgm1z8k1i0fvlihkjnlawnd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-deku" ,rust-deku-0.12))
        #:cargo-development-inputs
        (("rust-assert-hex" ,rust-assert-hex-0.2)
         ("rust-criterion" ,rust-criterion-0.3)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-hexlit" ,rust-hexlit-0.5))))
    (home-page "https://github.com/wcampbel0x2a/adsb_deku")
    (synopsis
      "Decoder for ADS-B(Automatic Depedent Surveillance-Broadcast) - written with deku")
    (description
      "Decoder for ADS-B(Automatic Depedent Surveillance-Broadcast) - written with deku")
    (license license:expat)))
