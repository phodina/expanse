(define-module (expanse packages bootloaders)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages base)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cross-base)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages firmware)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages mtools)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 regex))

(define-public dtc
  (package
    (name "dtc")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://kernel.org/software/utils/dtc/"
                    "dtc-" version ".tar.gz"))
              (sha256
               (base32
                "0xm38h31jb29xfh2sfyk48d8wdfq4b8lmb412zx9vjr35izjb9iq"))))
    (build-system gnu-build-system)
    (native-inputs
     (append
       (list bison
             flex
             libyaml
             pkg-config
             swig)
       (if (member (%current-system) (package-supported-systems valgrind))
           (list valgrind)
           '())))
    (inputs
     (list python))
    (arguments
     `(#:make-flags
       (list (string-append "CC=" ,(cc-for-target))

             ;; /bin/fdt{get,overlay,put} need help finding libfdt.so.1.
             (string-append "LDFLAGS=-Wl,-rpath="
                            (assoc-ref %outputs "out") "/lib")

             (string-append "PREFIX=" (assoc-ref %outputs "out"))
             (string-append "SETUP_PREFIX=" (assoc-ref %outputs "out"))
             "INSTALL=install")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-pkg-config
           (lambda _
             (substitute* '("Makefile"
                            "tests/run_tests.sh")
               (("pkg-config")
                ,(pkg-config-for-target)))))
         (delete 'configure))))         ; no configure script
    (home-page "https://www.devicetree.org")
    (synopsis "Compiles device tree source files")
    (description "@command{dtc} compiles
@uref{http://elinux.org/Device_Tree_Usage, device tree source files} to device
tree binary files.  These are board description files used by Linux and BSD.")
    (license license:gpl2+)))

(define %u-boot-rockchip-inno-usb-patch
  ;; Fix regression in 2020.10 causing freezes on boot with USB boot enabled.
  ;; See https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-rockpro64/-/issues/4
  ;; and https://patchwork.ozlabs.org/project/uboot/patch/20210406151059.1187379-1-icenowy@aosc.io
  (search-patch "u-boot-rockchip-inno-usb.patch"))

(define %u-boot-sifive-prevent-relocating-initrd-fdt
  ;; Fix boot in 2021.07 on Hifive unmatched, see
  ;; https://bugs.launchpad.net/ubuntu/+source/u-boot/+bug/1937246
  (search-patch "u-boot-sifive-prevent-reloc-initrd-fdt.patch"))

(define %u-boot-allow-disabling-openssl-patch
  ;; Fixes build of u-boot 2021.10 without openssl
  ;; https://lists.denx.de/pipermail/u-boot/2021-October/462728.html
  (search-patch "u-boot-allow-disabling-openssl.patch"))

(define %u-boot-rk3399-enable-emmc-phy-patch
  ;; Fix emmc boot on rockpro64 and pinebook-pro, this was a regression
  ;; therefore should hopefully be fixed when updating u-boot.
  ;; https://lists.denx.de/pipermail/u-boot/2021-November/466329.html
  (search-patch "u-boot-rk3399-enable-emmc-phy.patch"))

(define u-boot
  (package
    (name "u-boot")
    (version "2021.10")
    (source (origin
	      (patches
               (list %u-boot-rockchip-inno-usb-patch
    ;                 %u-boot-allow-disabling-openssl-patch
                     %u-boot-sifive-prevent-relocating-initrd-fdt
                     %u-boot-rk3399-enable-emmc-phy-patch))
     (method git-fetch)
     (uri (git-reference
	 (url "https://gitlab.com/phodina/u-boot-quartz64")
	 ;(commit "3a10fb6bfbbaa747b425233b1fc08cd008084281")))
	 (commit (string-append "v" version))))
	 ;(commit (string-append "pinenote-v" version))))
     (sha256
      (base32
       ;"1017qf214qnzwhgq3ymk4pgbhja5rnv5p62nqifl0if8i5jml8s8"))))
       ;"0b4ldh8m4dc1h1iq8pbmhxp780h7rqbywgdp4i82r5jcrkdp40w9"))))
       "0rbbll6294crpmkdhg6ijvqbp37xkwvb5mxdcgk77l76cqf0h9yq"))))
    (native-inputs
     `(("bc" ,bc)
       ("bison" ,bison)
       ("dtc" ,dtc)
       ("flex" ,flex)
       ("lz4" ,lz4)
       ("perl" ,perl)
       ("python" ,python)
       ("python-coverage" ,python-coverage)
       ("python-pycryptodomex" ,python-pycryptodomex)
       ("python-pytest" ,python-pytest)
       ("swig" ,swig)))
    (build-system  gnu-build-system)
    (home-page "https://www.denx.de/wiki/U-Boot/")
    (synopsis "ARM bootloader")
    (description "U-Boot is a bootloader used mostly for ARM boards.  It
also initializes the boards (RAM etc).")
    (license license:gpl2+)))

(define-public u-boot-tools
  (package
    (inherit u-boot)
    (name "u-boot-tools")
    (native-inputs
     (modify-inputs (package-native-inputs u-boot)
       (prepend sdl2)))
    (arguments
     `(#:make-flags '("HOSTCC=gcc")
       #:test-target "tcheck"
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "Makefile"
              (("/bin/pwd") (which "pwd"))
              (("/bin/false") (which "false")))
             (substitute* "tools/dtoc/fdt_util.py"
              (("'cc'") "'gcc'"))
             (substitute* "tools/patman/test_util.py"
              ;; python3-coverage is simply called coverage in guix.
              (("python3-coverage") "coverage"))
             (substitute* "test/run"
              ;; Make it easier to find test failures.
              (("#!/bin/bash") "#!/bin/bash -x")
              ;; This test would require git.
              (("\\./tools/patman/patman") (which "true"))
              ;; FIXME: test fails, needs further investiation
              (("run_test \"binman\"") "# run_test \"binman\"")
              ;; FIXME: test_spl fails, needs further investiation
              (("test_ofplatdata or test_handoff or test_spl")
                "test_ofplatdata or test_handoff")
              ;; FIXME: code coverage not working
              (("run_test \"binman code coverage\"")
               "# run_test \"binman code coverage\"")
              ;; This test would require internet access.
              (("\\./tools/buildman/buildman") (which "true")))
             (substitute* "test/py/tests/test_sandbox_exit.py"
              (("def test_ctrl_c")
               "@pytest.mark.skip(reason='Guix has problems with SIGINT')
def test_ctrl_c"))
             ;; Test against the tools being installed rather than tools built
             ;; for "sandbox" target.
             (substitute* "test/image/test-imagetools.sh"
               (("BASEDIR=sandbox") "BASEDIR=."))
             (for-each (lambda (file)
                              (substitute* file
                                  ;; Disable features that require OpenSSL due
                                  ;; to GPL/Openssl license incompatibilities.
                                  ;; See https://bugs.gnu.org/34717 for
                                  ;; details.
                                  (("CONFIG_FIT_SIGNATURE=y")
                                   "CONFIG_FIT_SIGNATURE=n\nCONFIG_UT_LIB_ASN1=n\nCONFIG_TOOLS_LIBCRYPTO=n")
                                  ;; This test requires a sound system, which is un-used
                                  ;; in u-boot-tools.
                                  (("CONFIG_SOUND=y") "CONFIG_SOUND=n")))
                              (find-files "configs" "sandbox_.*defconfig$|tools-only_defconfig"))
             #t))
         (replace 'configure
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke "make" "tools-only_defconfig" make-flags)))
         (replace 'build
           (lambda* (#:key inputs make-flags #:allow-other-keys)
             (apply invoke "make" "tools-all" make-flags)))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin")))
               (for-each (lambda (name)
                           (install-file name bin))
                         '("tools/netconsole"
                           "tools/jtagconsole"
                           "tools/gen_eth_addr"
                           "tools/gen_ethaddr_crc"
                           "tools/img2srec"
                           "tools/mkenvimage"
                           "tools/dumpimage"
                           "tools/mkimage"
                           "tools/kwboot"
                           "tools/proftool"
                           "tools/fdtgrep"
                           "tools/env/fw_printenv"
                           "tools/sunxi-spl-image-builder"))
               #t)))
           (delete 'check)
           (add-after 'install 'check
             (lambda* (#:key make-flags test-target #:allow-other-keys)
               (invoke "test/image/test-imagetools.sh")))
           ;; Only run full test suite on x86_64 systems, as many tests
           ;; assume x86_64.
           ,@(if (string-match "^x86_64-linux"
                               (or (%current-target-system)
                                   (%current-system)))
                 '((add-after 'check 'check-x86
                     (lambda* (#:key make-flags test-target #:allow-other-keys)
                       (apply invoke "make" "mrproper" make-flags)
                       (setenv "SDL_VIDEODRIVER" "dummy")
                       (setenv "PAGER" "cat")
                       (apply invoke "make" test-target make-flags))))
                 '()))))
    (description "U-Boot is a bootloader used mostly for ARM boards.  It
also initializes the boards (RAM etc).  This package provides its
board-independent tools.")))

(define-public (make-u-boot-package board triplet)
  "Returns a u-boot package for BOARD cross-compiled for TRIPLET."
  (let ((same-arch? (lambda ()
                      (string=? (%current-system)
                                (gnu-triplet->nix-system triplet)))))
    (package
      (inherit u-boot)
      (name (string-append "u-boot-"
                           (string-replace-substring (string-downcase board)
                                                     "_" "-")))
      (native-inputs
       `(,@(if (not (same-arch?))
             `(("cross-gcc" ,(cross-gcc triplet))
               ("cross-binutils" ,(cross-binutils triplet)))
             `())
         ,@(package-native-inputs u-boot)))
      (arguments
       `(#:modules ((ice-9 ftw)
                    (srfi srfi-1)
                    (guix build utils)
                    (guix build gnu-build-system))
         #:test-target "test"
         #:make-flags
         (list "HOSTCC=gcc"
               ,@(if (not (same-arch?))
                   `((string-append "CROSS_COMPILE=" ,triplet "-"))
                   '()))
         #:phases
         (modify-phases %standard-phases
           (replace 'configure
             (lambda* (#:key outputs make-flags #:allow-other-keys)
               (let ((config-name (string-append ,board "_defconfig")))
                 (if (file-exists? (string-append "configs/" config-name))
                     (apply invoke "make" `(,@make-flags ,config-name))
                     (begin
                       (display "Invalid board name. Valid board names are:"
                                (current-error-port))
                       (let ((suffix-len (string-length "_defconfig"))
                             (entries (scandir "configs")))
                         (for-each (lambda (file-name)
                                     (when (string-suffix? "_defconfig" file-name)
                                       (format (current-error-port)
                                               "- ~A\n"
                                               (string-drop-right file-name
                                                                  suffix-len))))
                                   (sort entries string-ci<)))
                       (error "Invalid boardname ~s." ,board))))))
           (add-after 'configure 'disable-tools-libcrypto
             ;; Disable libcrypto due to GPL and OpenSSL license
             ;; incompatibilities
             (lambda _
               (substitute* ".config"
                 (("CONFIG_TOOLS_LIBCRYPTO=.*$") "CONFIG_TOOLS_LIBCRYPTO=n"))))
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (libexec (string-append out "/libexec"))
                      (uboot-files (append
                                    (remove
                                     ;; Those would not be reproducible
                                     ;; because of the randomness used
                                     ;; to produce them.
                                     ;; It's expected that the user will
                                     ;; use u-boot-tools to generate them
                                     ;; instead.
                                     (lambda (name)
                                       (string-suffix?
                                        "sunxi-spl-with-ecc.bin"
                                        name))
                                     (find-files "." ".*\\.(bin|efi|img|spl|itb|dtb|rksd)$"))
                                    (find-files "." "^(MLO|SPL)$"))))
                 (mkdir-p libexec)
                 (install-file ".config" libexec)
                 ;; Useful for "qemu -kernel".
                 (install-file "u-boot" libexec)
                 (for-each
                  (lambda (file)
                    (let ((target-file (string-append libexec "/" file)))
                      (mkdir-p (dirname target-file))
                      (copy-file file target-file)))
                  uboot-files)
                 #t)))))))))

(define-public u-boot-pinenote
  (make-u-boot-package "pinenote-rk3566" "aarch64-linux-gnu"))

(define-public u-boot-malta
  (make-u-boot-package "malta" "mips64el-linux-gnuabi64"))

(define-public u-boot-am335x-boneblack
  (let ((base (make-u-boot-package "am335x_evm" "arm-linux-gnueabihf")))
    (package
      (inherit base)
      (name "u-boot-am335x-boneblack")
      (description "U-Boot is a bootloader used mostly for ARM boards.  It
also initializes the boards (RAM etc).

This U-Boot is built for the BeagleBone Black, which was removed upstream,
adjusted from the am335x_evm build with several device trees removed so that
it fits within common partitioning schemes.")
      (arguments
       (substitute-keyword-arguments (package-arguments base)
         ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'unpack 'patch-defconfig
               ;; Patch out other devicetrees to build image small enough to
               ;; fit within typical partitioning schemes where the first
               ;; partition begins at sector 2048.
               (lambda _
                 (substitute* "configs/am335x_evm_defconfig"
                   (("CONFIG_OF_LIST=.*$") "CONFIG_OF_LIST=\"am335x-evm am335x-boneblack\"\n"))
                 #t)))))))))

(define-public u-boot-am335x-evm
  (make-u-boot-package "am335x_evm" "arm-linux-gnueabihf"))

(define-public (make-u-boot-sunxi64-package board triplet)
  (let ((base (make-u-boot-package board triplet)))
    (package
      (inherit base)
      (arguments
        (substitute-keyword-arguments (package-arguments base)
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'set-environment
                (lambda* (#:key native-inputs inputs #:allow-other-keys)
                  (let ((bl31
                         (string-append
                          (assoc-ref (or native-inputs inputs) "firmware")
                          "/bl31.bin")))
                    (setenv "BL31" bl31)
                    ;; This is necessary when we're using the bundled dtc.
                    ;(setenv "PATH" (string-append (getenv "PATH") ":"
                    ;                              "scripts/dtc"))
                    )
                  #t))))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-sun50i-a64)
         ,@(package-native-inputs base))))))

(define-public u-boot-pine64-plus
  (make-u-boot-sunxi64-package "pine64_plus" "aarch64-linux-gnu"))

(define-public u-boot-pine64-lts
  (make-u-boot-sunxi64-package "pine64-lts" "aarch64-linux-gnu"))

(define-public u-boot-pinebook
  (let ((base (make-u-boot-sunxi64-package "pinebook" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
       (substitute-keyword-arguments (package-arguments base)
         ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'unpack 'patch-pinebook-config
               ;; Fix regression with LCD video output introduced in 2020.01
               ;; https://patchwork.ozlabs.org/patch/1225130/
               (lambda _
                 (substitute* "configs/pinebook_defconfig"
                   (("CONFIG_VIDEO_BRIDGE_ANALOGIX_ANX6345=y") "CONFIG_VIDEO_BRIDGE_ANALOGIX_ANX6345=y\nCONFIG_VIDEO_BPP32=y"))
                 #t)))))))))

(define-public u-boot-bananapi-m2-ultra
  (make-u-boot-package "Bananapi_M2_Ultra" "arm-linux-gnueabihf"))

(define-public u-boot-a20-olinuxino-lime
  (make-u-boot-package "A20-OLinuXino-Lime" "arm-linux-gnueabihf"))

(define-public u-boot-a20-olinuxino-lime2
  (make-u-boot-package "A20-OLinuXino-Lime2" "arm-linux-gnueabihf"))

(define-public u-boot-a20-olinuxino-micro
  (make-u-boot-package "A20-OLinuXino_MICRO" "arm-linux-gnueabihf"))

(define-public u-boot-nintendo-nes-classic-edition
  (let ((base (make-u-boot-package "Nintendo_NES_Classic_Edition"
                                   "arm-linux-gnueabihf")))
    (package
      (inherit base)
      ;; Starting with 2019.01, FEL doesn't work anymore on A33.
      (version "2018.11")
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://ftp.denx.de/pub/u-boot/"
                      "u-boot-" version ".tar.bz2"))
                (sha256
                 (base32
                  "0znkwljfwwn4y7j20pzz4ilqw8znphrfxns0x1lwdzh3xbr96z3k"))
                (patches (search-patches
                           "u-boot-nintendo-nes-serial.patch"))))
      (description "U-Boot is a bootloader used mostly for ARM boards.  It
also initializes the boards (RAM etc).

This version is for the Nintendo NES Classic Edition.  It is assumed that
you have added a serial port to pins PB0 and PB1 as described on
@url{https://linux-sunxi.org/Nintendo_NES_Classic_Edition}.

In order to use FEL mode on the device, hold the Reset button on the
device while it's being turned on (and a while longer).")
      (native-inputs
       `(("python" ,python-2)
         ,@(package-native-inputs base))))))

(define-public u-boot-wandboard
  (make-u-boot-package "wandboard" "arm-linux-gnueabihf"))

(define-public u-boot-mx6cuboxi
  (make-u-boot-package "mx6cuboxi" "arm-linux-gnueabihf"))

(define-public u-boot-novena
  (let ((base (make-u-boot-package "novena" "arm-linux-gnueabihf")))
    (package
      (inherit base)
      (description "U-Boot is a bootloader used mostly for ARM boards.  It
also initializes the boards (RAM etc).

This U-Boot is built for Novena.  Be advised that this version, contrary
to Novena upstream, does not load u-boot.img from the first partition.")
      (arguments
       (substitute-keyword-arguments (package-arguments base)
         ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'unpack 'patch-novena-defconfig
               ;; Patch configuration to disable loading u-boot.img from FAT partition,
               ;; allowing it to be installed at a device offset.
               (lambda _
                 (substitute* "configs/novena_defconfig"
                   (("CONFIG_SPL_FS_FAT=y") "# CONFIG_SPL_FS_FAT is not set"))
                 #t)))))))))

(define-public u-boot-cubieboard
  (make-u-boot-package "Cubieboard" "arm-linux-gnueabihf"))

(define-public u-boot-cubietruck
  (make-u-boot-package "Cubietruck" "arm-linux-gnueabihf"))

(define-public u-boot-puma-rk3399
  (let ((base (make-u-boot-package "puma-rk3399" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
        (substitute-keyword-arguments (package-arguments base)
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'set-environment
                (lambda* (#:key inputs #:allow-other-keys)
                  (setenv "BL31"
                          (search-input-file inputs "/bl31.elf"))))
              ;; Phases do not succeed on the bl31 ELF.
              (delete 'strip)
              (delete 'validate-runpath)))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-rk3399)
         ,@(package-native-inputs base))))))

(define-public u-boot-qemu-riscv64
  (make-u-boot-package "qemu-riscv64" "riscv64-linux-gnu"))

(define-public u-boot-qemu-riscv64-smode
  (let ((base (make-u-boot-package "qemu-riscv64_smode" "riscv64-linux-gnu")))
    (package
      (inherit base)
      (source (origin
                (inherit (package-source u-boot))
                (patches
                 (search-patches "u-boot-riscv64-fix-extlinux.patch"
                                 %u-boot-allow-disabling-openssl-patch)))))))

(define-public u-boot-sifive-unleashed
  (make-u-boot-package "sifive_unleashed" "riscv64-linux-gnu"))

(define-public u-boot-sifive-unmatched
  (let ((base (make-u-boot-package "sifive_unmatched" "riscv64-linux-gnu")))
    (package
      (inherit base)
      (arguments
       (substitute-keyword-arguments (package-arguments base)
         ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'unpack 'set-environment
               (lambda* (#:key inputs #:allow-other-keys)
                 (let ((opensbi (string-append (assoc-ref inputs "firmware")
                                               "/fw_dynamic.bin")))
                   (setenv "OPENSBI" opensbi))))))))
      (inputs
       `(("firmware" ,opensbi-generic)
         ,@(package-inputs base))))))

(define-public u-boot-rock64-rk3328
  (let ((base (make-u-boot-package "rock64-rk3328" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
       (substitute-keyword-arguments (package-arguments base)
         ((#:phases phases)
          `(modify-phases ,phases
             (add-after 'unpack 'set-environment
               (lambda* (#:key inputs #:allow-other-keys)
                 (let ((bl31 (search-input-file inputs "/bl31.elf")))
                   (setenv "BL31" bl31))))))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-rk3328)
         ,@(package-native-inputs base))))))

(define-public u-boot-firefly-rk3399
  (let ((base (make-u-boot-package "firefly-rk3399" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
        (substitute-keyword-arguments (package-arguments base)
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'set-environment
                (lambda* (#:key inputs #:allow-other-keys)
                  (setenv "BL31" (search-input-file inputs "/bl31.elf"))))
              ;; Phases do not succeed on the bl31 ELF.
              (delete 'strip)
              (delete 'validate-runpath)))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-rk3399)
         ,@(package-native-inputs base))))))

(define-public u-boot-rockpro64-rk3399
  (let ((base (make-u-boot-package "rockpro64-rk3399" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
        (substitute-keyword-arguments (package-arguments base)
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'set-environment
                (lambda* (#:key inputs #:allow-other-keys)
                  (setenv "BL31"
                          (search-input-file inputs "/bl31.elf"))))
              ;; Phases do not succeed on the bl31 ELF.
              (delete 'strip)
              (delete 'validate-runpath)))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-rk3399)
         ,@(package-native-inputs base))))))

(define-public u-boot-pinebook-pro-rk3399
  (let ((base (make-u-boot-package "pinebook-pro-rk3399" "aarch64-linux-gnu")))
    (package
      (inherit base)
      (arguments
        (substitute-keyword-arguments (package-arguments base)
          ((#:phases phases)
           `(modify-phases ,phases
              (add-after 'unpack 'set-environment
                (lambda* (#:key inputs #:allow-other-keys)
                  (setenv "BL31"
                          (search-input-file inputs "/bl31.elf"))))
              ;; Phases do not succeed on the bl31 ELF.
              (delete 'strip)
              (delete 'validate-runpath)))))
      (native-inputs
       `(("firmware" ,arm-trusted-firmware-rk3399)
         ,@(package-native-inputs base))))))

(define-public vboot-utils
  (package
    (name "vboot-utils")
    (version "R63-10032.B")
    (source (origin
              ;; XXX: Snapshots are available but changes timestamps every download.
              (method git-fetch)
              (uri (git-reference
                    (url (string-append "https://chromium.googlesource.com"
                                        "/chromiumos/platform/vboot_reference"))
                    (commit (string-append "release-" version))))
              (file-name (string-append name "-" version "-checkout"))
              (sha256
               (base32
                "0h0m3l69vp9dr6xrs1p6y7ilkq3jq8jraw2z20kqfv7lvc9l1lxj"))
              (patches
               (search-patches "vboot-utils-skip-test-workbuf.patch"
                               "vboot-utils-fix-tests-show-contents.patch"
                               "vboot-utils-fix-format-load-address.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags (list "CC=gcc"
                          ;; On ARM, we must pass "HOST_ARCH=arm" so that the
                          ;; ${HOST_ARCH} and ${ARCH} variables in the makefile
                          ;; match.  Otherwise, ${HOST_ARCH} will be assigned
                          ;; "armv7l", the value of `uname -m`, and will not
                          ;; match ${ARCH}, which will make the tests require
                          ;; QEMU for testing.
                          ,@(if (string-prefix? "arm"
                                                (or (%current-target-system)
                                                    (%current-system)))
                                '("HOST_ARCH=arm")
                                '())
                          (string-append "DESTDIR=" (assoc-ref %outputs "out")))
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'patch-hard-coded-paths
                    (lambda* (#:key inputs outputs #:allow-other-keys)
                      (let ((coreutils (assoc-ref inputs "coreutils"))
                            (diffutils (assoc-ref inputs "diffutils")))
                        (substitute* "futility/misc.c"
                          (("/bin/cp") (string-append coreutils "/bin/cp")))
                        (substitute* "tests/bitmaps/TestBmpBlock.py"
                          (("/usr/bin/cmp") (string-append diffutils "/bin/cmp")))
                        (substitute* "vboot_host.pc.in"
                          (("prefix=/usr")
                           (string-append "prefix=" (assoc-ref outputs "out"))))
                        #t)))
                  (delete 'configure)
                  (add-before 'check 'patch-tests
                    (lambda _
                      ;; These tests compare diffs against known-good values.
                      ;; Patch the paths to match those in the build container.
                      (substitute* (find-files "tests/futility/expect_output")
                        (("/mnt/host/source/src/platform/vboot_reference")
                         (string-append "/tmp/guix-build-" ,name "-" ,version
                                        ".drv-0/source")))
                      ;; Tests require write permissions to many of these files.
                      (for-each make-file-writable (find-files "tests/futility"))
                      #t))
                  (add-after 'install 'install-devkeys
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (share (string-append out "/share/vboot-utils")))
                        (copy-recursively "tests/devkeys"
                                          (string-append share "/devkeys"))
                        #t))))
       #:test-target "runtests"))
    (native-inputs
     `(("pkg-config" ,pkg-config)

       ;; For tests.
       ("diffutils" ,diffutils)
       ("python@2" ,python-2)))
    (inputs
     `(("coreutils" ,coreutils)
       ("libyaml" ,libyaml)
       ("openssl" ,openssl)
       ("openssl:static" ,openssl "static")
       ("util-linux" ,util-linux "lib")))
    (home-page
     "https://dev.chromium.org/chromium-os/chromiumos-design-docs/verified-boot")
    (synopsis "ChromiumOS verified boot utilities")
    (description
     "vboot-utils is a collection of tools to facilitate booting of
Chrome-branded devices.  This includes the @command{cgpt} partitioning
program, the @command{futility} and @command{crossystem} firmware management
tools, and more.")
    (license license:bsd-3)))

(define-public os-prober
  (package
    (name "os-prober")
    (version "1.79")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "mirror://debian/pool/main/o/os-prober/os-prober_"
                           version ".tar.xz"))
       (sha256
        (base32 "1vhhk0bl2j4910513gn5h3z8nsaavyv3c8764bim2klc0xyk3rmb"))))
    (build-system gnu-build-system)
    (arguments
     `(#:modules ((guix build gnu-build-system)
                  (guix build utils)
                  (ice-9 regex)         ; for string-match
                  (srfi srfi-26))       ; for cut
       #:make-flags
       (list ,(string-append "CC=" (cc-for-target)))
       #:tests? #f                      ; no tests
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* (find-files ".")
               (("/usr") (assoc-ref outputs "out")))
             (substitute* (find-files "." "50mounted-tests$")
               (("mkdir") "mkdir -p"))
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (define (find-files-non-recursive directory)
               (find-files directory
                           (lambda (file stat)
                             (string-match (string-append "^" directory "/[^/]*$")
                                           file))
                           #:directories? #t))

             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (lib (string-append out "/lib"))
                    (share (string-append out "/share")))
               (for-each (cut install-file <> bin)
                         (list "linux-boot-prober" "os-prober"))
               (install-file "newns" (string-append lib "/os-prober"))
               (install-file "common.sh" (string-append share "/os-prober"))
               (install-file "os-probes/mounted/powerpc/20macosx"
                             (string-append lib "/os-probes/mounted"))
               (for-each
                (lambda (directory)
                  (for-each
                   (lambda (file)
                     (let ((destination (string-append lib "/" directory
                                                       "/" (basename file))))
                       (mkdir-p (dirname destination))
                       (copy-recursively file destination)))
                   (append (find-files-non-recursive (string-append directory "/common"))
                           (find-files-non-recursive (string-append directory "/x86")))))
                (list "os-probes" "os-probes/mounted" "os-probes/init"
                      "linux-boot-probes" "linux-boot-probes/mounted"))
               #t))))))
    (home-page "https://joeyh.name/code/os-prober")
    (synopsis "Detect other operating systems")
    (description "os-prober probes disks on the system for other operating
systems so that they can be added to the bootloader.  It also works out how to
boot existing GNU/Linux systems and detects what distribution is installed in
order to add a suitable bootloader menu entry.")
    (license license:gpl2+)))

(define-public ipxe
  ;; XXX: 'BUILD_TIMESTAMP' is used to automatically select the newest version
  ;; of iPXE if multiple iPXE drivers are loaded concurrently in a UEFI system.
  ;;
  ;; TODO: Bump this timestamp at each modifications of the package (not only
  ;; for updates) by running: date +%s.
  (let ((timestamp "1591706427"))
    (package
      (name "ipxe")
      (version "1.21.1")
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ipxe/ipxe")
                      (commit (string-append "v" version))))
                (file-name (git-file-name name version))
                (patches (search-patches "ipxe-reproducible-geniso.patch"))
                (sha256
                 (base32
                  "1pkf1n1c0rdlzfls8fvjvi1sd9xjd9ijqlyz3wigr70ijcv6x8i9"))))
      (build-system gnu-build-system)
      (arguments
       `(#:modules ((guix build utils)
                    (guix build gnu-build-system)
                    (guix base32)
                    (ice-9 string-fun)
                    (ice-9 regex)
                    (rnrs bytevectors))
         #:imported-modules ((guix base32)
                             ,@%gnu-build-system-modules)
         #:make-flags
         ;; XXX: 'BUILD_ID' is used to determine when another ROM in the
         ;; system contains identical code in order to save space within the
         ;; legacy BIOS option ROM area, which is extremely limited in size.
         ;; It is supposed to be collision-free across all ROMs, to do so we
         ;; use the truncated output hash of the package.
         (let ((build-id
                (lambda (out)
                  (let* ((nix-store (string-append
                                     (or (getenv "NIX_STORE") "/gnu/store")
                                     "/"))
                         (filename
                          (string-replace-substring out nix-store ""))
                         (hash (match:substring (string-match "[0-9a-z]{32}"
                                                              filename)))
                         (bv (nix-base32-string->bytevector hash)))
                    (format #f "0x~x"
                            (bytevector-u32-ref bv 0 (endianness big))))))
               (out (assoc-ref %outputs "out"))
               (syslinux (assoc-ref %build-inputs "syslinux")))
           (list "ECHO_E_BIN_ECHO=echo"
                 "ECHO_E_BIN_ECHO_E=echo -e"

                 ;; cdrtools' mkisofs will silently ignore a missing isolinux.bin!
                 ;; Luckily xorriso is more strict.
                 (string-append "ISOLINUX_BIN=" syslinux
                                "/share/syslinux/isolinux.bin")
                 (string-append "SYSLINUX_MBR_DISK_PATH=" syslinux
                                "/share/syslinux/isohdpfx.bin")

                 ;; Build reproducibly.
                 (string-append "BUILD_ID_CMD=echo -n " (build-id out))
                 (string-append "BUILD_TIMESTAMP=" ,timestamp)
                 "everything"))
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'enter-source-directory
             (lambda _ (chdir "src") #t))
           (add-after 'enter-source-directory 'set-options
             (lambda _
               (substitute* "config/general.h"
                 (("^//(#define PING_CMD.*)" _ uncommented) uncommented)
                 (("^//(#define IMAGE_TRUST_CMD.*)" _ uncommented)
                  uncommented)
                 (("^#undef.*(DOWNLOAD_PROTO_HTTPS.*)" _ option)
                  (string-append "#define " option))
                 (("^#undef.*(DOWNLOAD_PROTO_NFS.*)" _ option)
                  (string-append "#define " option)))
               #t))
           (delete 'configure)          ; no configure script
           (replace 'install
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out"))
                      (ipxe (string-append out "/lib/ipxe"))
                      (exts-re
                       "\\.(efi|efirom|iso|kkpxe|kpxe|lkrn|mrom|pxe|rom|usb)$")
                      (dirs '("bin" "bin-i386-linux" "bin-x86_64-pcbios"
                              "bin-x86_64-efi" "bin-x86_64-linux" "bin-i386-efi"))
                      (files (apply append
                                    (map (lambda (dir)
                                           (find-files dir exts-re)) dirs))))
                 (for-each (lambda (file)
                             (let* ((subdir (dirname file))
                                    (fn (basename file))
                                    (tgtsubdir (cond
                                                ((string=? "bin" subdir) "")
                                                ((string-prefix? "bin-" subdir)
                                                 (string-drop subdir 4)))))
                               (install-file file
                                             (string-append ipxe "/" tgtsubdir))))
                           files))
               #t))
           (add-after 'install 'leave-source-directory
             (lambda _ (chdir "..") #t)))
         #:tests? #f))                  ; no test suite
      (native-inputs
       (list perl syslinux xorriso))
      (home-page "https://ipxe.org")
      (synopsis "PXE-compliant network boot firmware")
      (description "iPXE is a network boot firmware.  It provides a full PXE
implementation enhanced with additional features such as booting from: a web
server via HTTP, an iSCSI SAN, a Fibre Channel SAN via FCoE, an AoE SAN, a
wireless network, a wide-area network, an Infiniband network.  It
controls the boot process with a script.  You can use iPXE to replace the
existing PXE ROM on your network card, or you can chainload into iPXE to obtain
the features of iPXE without the hassle of reflashing.")
      (license license:gpl2+))))

(define rk3566-u-boot
;(let ((commit "ae59228edff4cb3d4abb1b44b470fafa352601a7")
(let ((commit "eb3393310bffab27265cfc82f15470f70f1acd97")
      (revision "1"))
 (package
  (inherit u-boot) 
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	 ;(url "https://gitlab.com/pgwipeout/u-boot-quartz64")
	 (url "https://github.com/u-boot/u-boot")
	 (commit commit)))
     (sha256
      (base32
       "0y8np4ixx0qpbhdf5rpvcd2w485cjdnv27sayp3q0qkrp53lw1ff")))))))


;u-boot-pinebook
