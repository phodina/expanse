(define-module (expanse packages intel)
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

(define-public rust-redox-uefi-0.1
  (package
    (name "rust-redox-uefi")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "redox_uefi" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1nix5qfz4k7s21axi1q3gfryj6697y7yp9fi985daycyi613wj0c"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://gitlab.redox-os.org/redox-os/uefi")
    (synopsis "UEFI support library")
    (description "UEFI support library")
    (license license:expat)))

(define-public rust-redox-intelflash-0.1
  (package
    (name "rust-redox-intelflash")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "redox-intelflash" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1xa337n5qwk8bz9xgzfxpd2lmkhzz2nwcjfajjhjzn28fp8m33kx"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-plain" ,rust-plain-0.2)
         ("rust-redox-uefi" ,rust-redox-uefi-0.1))))
    (home-page "https://gitlab.redox-os.org/redox-os/intelflash")
    (synopsis "Library for parsing Intel UEFI images")
    (description "Library for parsing Intel UEFI images")
    (license license:expat)))

(define-public rust-coreboot-fs-0.1
  (package
    (name "rust-coreboot-fs")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "coreboot-fs" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "06yg4xi8ip3yl865iq2yaw4b7zyp8lb4mjn4zb0pcj7hhw54xv1c"))))
    (build-system cargo-build-system)
    (arguments `(#:cargo-inputs (("rust-plain" ,rust-plain-0.2))))
    (home-page "")
    (synopsis "Coreboot Filesystem Parser")
    (description "Coreboot Filesystem Parser")
    (license license:expat)))

(define-public intel-spi
  (package
    (name "intel-spi")
    (version "0.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/system76/intel-spi")
	   (commit version)))
       (sha256
        (base32
         "1h3903g12d5kjd88ad7hra2zj3fvl58n5a8rcpm6spdnzf2j0zb8"))))
    (build-system cargo-build-system)
	(arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-redox-intelflash" ,rust-redox-intelflash-0.1)
         ("rust-coreboot-fs" ,rust-coreboot-fs-0.1))
	#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'enable-unstable-features
           (lambda _
             (setenv "RUSTC_BOOTSTRAP" "1")
             )))))
    (home-page
     "https://github.com/system76/intel-spi")
    (synopsis
     "Library for acessing Intel PCH SPI")
    (description
     "")
    (license license:expat)))
