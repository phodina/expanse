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
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ambausb
  (package
    (name "ambausb")
    (version "4.3.2-1")
    ;; Private package, store them in /data :-(
    (source (local-file (string-append "/data/ambausb_" version "_amd64.deb")))
    (build-system binary-build-system)
    (arguments
     `(#:patchelf-plan `(("usr/bin/ambausb" ("libx11" "libxcursor"
                                             "gcc:lib"
                                             "qtbase"
                                             "zlib"
                                             "glibc"
                                             "libstdc++"
                                             "qtmultimedia"
                                             "libusb")) ("usr/lib/libdraminit-ads.so"
                                                         ("gcc:lib" "qtbase"
                                                          "libstdc++" "libusb")))
       #:install-plan
       `(("usr/bin" "") ("lib" "lib")
         ("usr/lib" "")
         ("usr/share" "usr/"))
       #:phases
       (modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((debian-files (assoc-ref inputs "source")))
               (invoke "ar" "x" debian-files)
               (invoke "tar" "xJf" "data.tar.xz")
               (substitute* "lib/udev/rules.d/90-ambausb.rules"
                 (("root") "dialout")
                 (("ENV\\{DEVTYPE\\}==\"usb_device\",")
                  "ATTRS{idProduct}==\"0001\",")
                 ;; (("4255\"") "4255\", RUN\+=\"/bin/sh -c \'echo ambarella >> /tmp/ambausb\'\", "))))))))
                 )))))))
    (inputs (list libx11
                  qtbase-5
                  glibc
                  zlib
                  libxcursor
                  ;; (make-libstdc++ gcc))
                  `(,gcc "lib")
                  qtmultimedia
                  eudev
                  libusb))
    (synopsis "Ambarella USB Utility")
    (description
     "A simple utility designed to download firmware to Ambarella's development board. This is a replacement of DirectUSB")
    (home-page #f)
    (license #f)))
