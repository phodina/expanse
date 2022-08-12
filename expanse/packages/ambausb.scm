(define-module (expanse packages ambausb)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public ambausb
  (package
    (name "ambausb")
    (version "4.3.2")
    ;; Private package, store them in /data :-(
    (source (local-file (string-append "/data/ambausb-" version ".tar.xz")))
    (build-system qt-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (add-after 'install 'install-udev-rules
                          (lambda* _
                            (substitute* "rules/90-ambausb.rules"
                              (("root")
                               "dialout"))
                            (install-file "rules/90-ambausb.rules"
                                          (string-append #$output
                                           "/lib/udev/rules.d/"))))
                        (replace 'configure
                          (lambda* _
                            (substitute* "AmbaUSB.desktop"
                              (("/usr/bin/ambausb")
                               (string-append #$output "/bin/ambausb")))
                            (substitute* "AmbaUSB.pri"
                              (("/usr/local")
                               #$output))
                            (invoke "qmake"))))))
    (native-inputs (list pkg-config))
    (inputs (list libx11
                  qtbase-5
                  glibc
                  zlib
                  libxcursor
                  ;; (make-libstdc++ gcc))
                  `(,gcc "lib")
                  qtmultimedia-5
                  qtwayland
                  eudev
                  libusb))
    (synopsis "Ambarella USB Utility")
    (description
     "A simple utility designed to download firmware to Ambarella's development board. This is a replacement of DirectUSB")
    (home-page #f)
    (license #f)))
