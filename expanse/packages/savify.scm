(define-module (expanse packages savify)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages video)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-spotipy
  (package
    (name "python-spotipy")
    (version "2.20.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "spotipy" version))
              (sha256
               (base32
                "1j8qm30a9qc4nwbzlfkpzjgfb8agqifkajrbbcvl5z72bfvrjsp2"))))
    (build-system python-build-system)
	(arguments (list #:tests? #f))
    (propagated-inputs (list python-redis python-requests python-six
                             python-urllib3))
    (native-inputs (list python-mock))
    (home-page "https://spotipy.readthedocs.org/")
    (synopsis "A light weight Python library for the Spotify Web API")
    (description
     "This package provides a light weight Python library for the Spotify Web API")
    (license license:expat)))

(define-public python-ffmpy
  (package
    (name "python-ffmpy")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ffmpy" version))
              (sha256
               (base32
                "1p4sdxxjvysk5x8y0iyv6d2pk8imh2svkzy91ajv89gf3rc92xbm"))))
    (build-system python-build-system)
;	(arguments
;	(list #:phases #~(modify-phases %standard-phases
;	 (add-after 'unpack 'fix-path
;	  (lambda* _
;	   (substitute* "ffmpy.py"
;	    (("executable=\"ffmpeg\"") (string-append
;		"executable=\"" #$ffmpeg "\bin\ffmpeg\""))))))))
;	(inputs (list ffmpeg))
    (home-page "https://github.com/Ch00k/ffmpy")
    (synopsis "A simple Python wrapper for ffmpeg")
    (description "This package provides a simple Python wrapper for ffmpeg")
    (license license:expat)))

(define-public savify
  (package
    (name "savify")
    (version "2.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "savify" version))
       (sha256
        (base32
         "13djkydms4ppjzj5zsqyf6g91fgnxjbbypssps35q0ramzn2wz3p"))))
    (build-system python-build-system)
	(arguments (list #:tests? #f))
	(inputs (list
	python-ffmpy
python-spotipy
python-tldextract
python-validators
youtube-dl
python-requests
python-pytest-runner
python-click))
	(propagated-inputs (list ffmpeg which))
    (home-page
     "https://github.com/LaurenceRawlings/savify")
    (synopsis
     "Download Spotify songs to mp3 with full metadata and cover art!")
    (description
     "")
    (license license:bsd-3)))
