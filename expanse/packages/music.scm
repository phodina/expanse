(define-module (expanse packages music)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages music)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module ((guix licenses) #:prefix license:))


(define-public lessampler
  (package
    (name "lessampler")
    (version "0.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/YuzukiTsuru/lessampler")
	   (commit (string-append "alpha." version))))
       (sha256
        (base32
         "0c2yyrp4rzsasr5zrjz2mw7mnpvrhclmm5fg9348msqlh85gm20v"))))
	(build-system cmake-build-system)
    (home-page
     "https://github.com/YuzukiTsuru/lessampler")
    (synopsis
     "Singing Voice Synthesizer")
	(description "")
	(license license:gpl3+)))

(define-public python-enum34-next
  (package
    (inherit python-enum34)
    (name "python-enum34")
    (version "1.1.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "enum34" version))
              (sha256
               (base32
                "1cgm5ng2gcfrkrm3hc22brl6chdmv67b9zvva9sfs7gn7dwc9n4a"))))))

(define-public python-brotlicffi
  (package
    (name "python-brotlicffi")
    (version "1.0.9.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "brotlicffi" version))
              (sha256
               (base32
                "15kxgdiqcg0cm6h5xq3vkbhw7674673hcx3n2yicd3wx29l8l90c"))))
    (build-system python-build-system)
    (propagated-inputs (list python-cffi)); python-enum34-next))
    (home-page "https://github.com/python-hyper/brotlicffi")
    (synopsis "Python CFFI bindings to the Brotli library")
    (description "Python CFFI bindings to the Brotli library")
    (license license:expat)))

(define-public python-yt-dlp
  (package
    (name "python-yt-dlp")
    (version "2022.5.18")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "yt-dlp" version))
              (sha256
               (base32
                "0d2iwch17av6mss4c8vayhj5c3p2gyiwbfg0m25wwfabzg95jyrs"))))
    (build-system python-build-system)
    (propagated-inputs (list python-brotli
                             python-brotlicffi
                             python-certifi
                             python-mutagen
                             python-pycryptodomex
                             python-websockets))
    (home-page "https://github.com/yt-dlp/yt-dlp")
    (synopsis "A youtube-dl fork with additional features and patches")
    (description
     "This package provides a youtube-dl fork with additional features and patches")
    (license #f)))

(define-public myuzi
  (package
    (name "myuzi")
    (version "0.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.com/zehkira/myuzi")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1rlnw7lsz1nhcyd12y4lf0y42nxw7miki9qqyf5z7qwicbcl4h6a"))))
	(build-system python-build-system)
	(inputs (list gtk+ python-beautifulsoup4 python-yt-dlp python-pygobject python-requests))
    (home-page
     "https://gitlab.com/zehkira/myuzi")
    (synopsis
     " Spotify alternative for Linux with no ads")
	(description "")
	(license license:expat)))
