(define-module (expanse packages netgear)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-pynetgear
  (package
    (name "python-pynetgear")
    (version "0.10.4")
    (home-page "https://github.com/MatMaul/pynetgear")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "17mvwlkmvrlxja4k4ssdg999rb1vin44gkri97rc3bwlg25znfzr"))))
    (build-system python-build-system)
    (inputs (list python-requests))
    (synopsis
     "Python library to control Netgear wireless routers")
    (description
     "")
    (license license:expat)))
