(define-module (expanse packages dupeguru)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages music)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-send2trash
  (package
    (name "python-send2trash")
    (version "1.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "Send2Trash" version))
        (sha256
          (base32 "0bcwr6h6dyf8nlwxssxys9cfliqlhx2mw5gz1858cn9pzmi4ghnj"))))
    (build-system python-build-system)
    (home-page "https://github.com/arsenetar/send2trash")
    (synopsis "Send file to trash natively under Mac OS X, Windows and Linux.")
    (description
      "Send file to trash natively under Mac OS X, Windows and Linux.")
    (license license:bsd-3)))

(define-public dupeguru
  (package
    (name "dupeguru")
    (version "4.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/arsenetar/dupeguru")
	   (commit version)))
       (sha256
        (base32
         "1a34kkw2xyfdirv0nw5w6v7s2db4cfn17ksnnblkl7ahndr6hlnj"))))
    (build-system python-build-system)
	(propagated-inputs
	(list python-send2trash python-sphinx python-polib python-mutagen))
    (home-page
     "https://github.com/arsenetar/dupeguru")
    (synopsis
     "Find duplicate files")
    (description
     "This package provides a GUI tool to find duplicate files in a system.")
    (license license:gpl3+)))

(define-public videoduplicatefinder
  (package
    (name "videoduplicatefinder")
    (version "3.0.x")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/0x90d/videoduplicatefinder")
	   (commit version)))
       (sha256
        (base32
         "0p34gz07r55hb1h1fks6fzsqwq18j3268nhjwhxzaqjhzrf9ijyh"))))
    (build-system copy-build-system)
    (home-page
     "https://github.com/0x90d/videoduplicatefinder")
    (synopsis
     "Video duplicate finder")
    (description
     "This package provides a tool to find duplicated video (and image) files on hard disk based on similiarity.")
    (license license:gpl3+)))
