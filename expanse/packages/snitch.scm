(define-module (expanse packages snitch)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages golang)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-github-com-evilsocket-ftrace
  (package
    (name "go-github-com-evilsocket-ftrace")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/evilsocket/ftrace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16njp0j1g8mcw5abw1zwsa7zqfvb01lm2sl0180dy5r37vcp3h54"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/evilsocket/ftrace"))
    (home-page "https://github.com/evilsocket/ftrace")
    (synopsis "FTRACE kernel framework library for Go")
    (description
     "Package ftrace utilizes the FTRACE kernel framework in order to trace system
calls and kernel events from user space.")
    (license license:gpl3)))

(define-public opensnitch
  (package
    (name "opensnitch")
    (version "1.5.1")
    (home-page "https://github.com/evilsocket/opensnitch/")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1b4j12bavyjmjr28cqx80796k24ihldgzvsb30kbmmhvcjkfx1zh"))))
    (build-system gnu-build-system)
	(arguments
	(list #:phases #~(modify-phases %standard-phases
	 (delete 'configure))))
	(native-inputs (list qttools))
	(inputs (list go go-github-com-evilsocket-ftrace))
    (synopsis "Application firewall")
    (description "This package provides application firewall")
    (license license:gpl3+)))
