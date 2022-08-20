(define-module (expanse packages bluez)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))


(define-public bluez-firmware
(let ((commit "31ad68831357d2019624004f1f0846475671088f")
      (revision "1"))
  (package
    (name "bluez-firmware")
    (version "")
    (home-page "https://github.com/RPi-Distro/bluez-firmware")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                   (url "https://github.com/RPi-Distro/bluez-firmware")
				   (commit commit))) 
              (sha256
               (base32
                "0j5q2g1wrvyp2fmfws267lw6f860vlswmbcrzb96mlr2npnwjap6"))))
    (build-system copy-build-system)
    (synopsis "Firmware for bluez")
    (description "")
    (license license:gpl2+))))
