(define-module (expanse packages nbtscan)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nbtscan
 (package
  (name "nbtscan")
  (version "1.7.2")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/resurrecting-open-source-projects/nbtscan")
                   (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0j8cy0yqcaxqsbx8cyi4dnyy1lv732xljqpsp8c729j1dd1qp2m0"))))
  (build-system gnu-build-system)
  (native-inputs (list autoconf automake))
  (synopsis "Scan networks searching for NetBIOS information")
  (description "This package provides tool for scanning IP networks for NetBIOS
name information.  It sends NetBIOS status query to each address in supplied
range and lists received information in human readable form.  For each responded
host it lists IP address, NetBIOS computer name, logged-in user name and
MAC address.")
  (home-page "https://github.com/resurrecting-open-source-projects/nbtscan")
  (license license:gpl2+)))
