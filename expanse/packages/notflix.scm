(define-module (expanse packages notflix)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:))

(define-public notflix
(let ((commit "20f201ea5563e8445510826ab9097d7fb0da8451")
      (revision "1"))
  (package
    (name "notflix")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/Bugswriter/notflix")
	   (commit commit)))
       (sha256
        (base32
         "00pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system copy-build-system)
	(inputs (list curl peerflix))
    (home-page
     "https://github.com/Bugswriter/notflix")
    (synopsis
     "Search and stream torrent")
    (description
     "This package provides a shell script to search and stream torrent.")
    (license license:gpl3+))))

(define-public node-peerflix
  (package
    (name "node-peerflix")
    (version "0.39.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/mafintosh/peerflix")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0i20skyah9pw5m7mavid43dr9aaj6b3hmzfg4mm39ga21lbas36j"))))
    (build-system node-build-system)
;	"airplayer": "^2.0.0",
;    "buffer-from": "^1.0.0",
;    "clivas": "^0.2.0",
;	"inquirer": "^5.0.1",
;    "keypress": "^0.2.1",
;    "mime": "^2.2.0",
;    "network-address": "^1.1.0",
;    "numeral": "^2.0.6",
;    "open": "0.0.5",
;    "optimist": "^0.6.1",
;    "parse-torrent": "^5.4.0",
;    "pump": "^2.0.0",
;    "range-parser": "^1.0.0",
;    "rc": "^1.1.6",
;    "torrent-stream": "^1.0.1",
;    "winreg": "1.2.4",
;    "xtend": "^4.0.0"
    (home-page
     "https://github.com/mafintosh/peerflix")
    (synopsis
     "Streaming torrent client for node.js")
    (description
     "")
    (license license:expat)))

(define-public node-airplayer
  (package
    (name "node-airplayer")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/watson/airplayer")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1i20skyah9pw5m7mavid43dr9aaj6b3hmzfg4mm39ga21lbas36j"))))
    (build-system node-build-system)
    (home-page
     "https://github.com/watson/airplayer")
    (synopsis
     "Query your local network for about Apple TV")
    (description
     "")
    (license license:expat)))

(define-public node-clivas
  (package
    (name "node-clivas")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/mafintosh/clivas")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2i90skyah9pw5m7mavid43dr9aaj6b3hmzfg4mm39ga21lbas36j"))))
    (build-system node-build-system)
    (home-page
     "https://github.com/mafintosh/clivas")
    (synopsis
     "Use terminal as canvas")
    (description
     "")
    (license license:expat)))
