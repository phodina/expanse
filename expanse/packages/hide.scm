(define-module (expanse packages hide)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages xfce)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages python)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-undercover
(let ((commit "a423152181845135c17732aa386aad4a68539085")
      (revision "1"))
  (package
    (name "go-undercover")
    (version "0.1-pre")
	(home-page "https://github.com/SofianeHamlaoui/Go-undercover")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "112hvz3wafqixvg2gzj4bc51yf2pr7cv79p9jvwb3683fqrwkj4k"))))
    (build-system copy-build-system)
	(arguments
	(list #:phases #~(modify-phases %standard-phases
	(add-after 'install 'wrap-program
	 (lambda* _
	  (substitute* (string-append #$output "/go-undercover.sh")
	  (("/usr/share/go-undercover/") (string-append #$output "/go-undercover")))
	  (wrap-program (string-append #$output "/go-undercover.sh")
	  `("PATH" ":" prefix
		,(map (lambda (dir) (string-append dir "/bin"))
		(list #$(this-package-input "xfconf")
		      #$(this-package-input "libnotify"))))))))))
	(native-inputs (list `(,glib "bin") pkg-config))
	(inputs (list libnotify xfconf python python-pygobject))
    (synopsis
     "Switch appearance from Linux to Windows")
    (description
     "This package provides tool to switch appearance from Linux to Windows.")
    (license license:gpl3+))))
