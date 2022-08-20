(define-module (expanse packages tang)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

;; https://www.root.cz/clanky/sifrovane-disky-na-serveru-automaticke-odemykani-pomoci-tang-a-clevis/
(define-public tang
  (package
    (name "tang")
    (version "11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/latchset/tang")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system meson-build-system)
    (home-page
     "https://github.com/latchset/tang")
    (synopsis
     "Tang bingind daemon")
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
