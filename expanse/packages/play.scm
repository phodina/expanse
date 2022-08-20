(define-module (expanse packages play)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public open-wireless-link
(let ((commit "8e4e840b212ae5a09a8a99484be3ab18bad22fa7")
      (revision "1"))
  (package
    (name "open-wireless-link")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/seemoo-lab/owl")
	   (commit commit)))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system cmake-build-system)
    (home-page
     "https://owlink.org/")
    (synopsis
     "Apple Wireless Direct Link implementation")
    (description
     "")
    (license license:gpl3+))))

(define-public opendrop
  (package
    (name "opendrop")
    (version "0.13.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/seemoo-lab/opendrop")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system gnu-build-system)
    (home-page
     "https://owlink.org/")
    (synopsis
     "Implementation of Apple AirDrop protocol")
    (description
     "")
    (license license:gpl3+)))

(define-public uxplay
  (package
    (name "uxplay")
    (version "1.47")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/FDH2/UxPlay")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/FDH2/UxPlay")
    (synopsis
     "AirPlay Unix mirroring server")
    (description
     "")
    (license license:gpl3+)))

(define-public clevis
  (package
    (name "clevis")
    (version "18")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/latchset/clevis")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system meson-build-system)
    (home-page
     "https://github.com/latchset/clevis")
    (synopsis
     "Automated Encryption Framework")
    (description
     "")
    (license license:gpl3+)))
