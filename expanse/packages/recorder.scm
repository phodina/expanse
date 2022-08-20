(define-module (expanse packages recorder)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public gpu-screen-recorder
(let ((commit "5ca83d45cf044754ba1ae60a057b5420ab407a35")
      (revision "1"))
  (package
    (name "gpu-screen-recoder")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://repo.dec05eba.com/gpu-screen-recorder")
	   (commit commit)))
       (sha256
        (base32
         "1v9ml5s17brr9hryc58y8cpga5li9y7hxi0zsfpm4v4aw2fwjhya"))))
    (build-system gnu-build-system)
	(arguments
	`(#:tests? #f
	  #:phases
	 (modify-phases %standard-phases
	  (add-before 'check 'home
	  (lambda* _
	  (setenv "HOME" "tmp"))))))
    (propagated-inputs
     (list gtk+ python python-pygobject python-pyaml python-pygobject python-evdev python-requests
	 python-magic python-lxml))
    (home-page
     "https://git.dec05eba.com/gpu-screen-recorder/about/")
    (synopsis
     "Screen recoder with minimal impact on system performace")
    (description
     "")
    (license license:gpl3+))))

(define-public gpu-screen-recorder-gtk
(let ((commit "eaa84b057cf01534858d8adc8ccf433429f229e3")
      (revision "1"))
  (package
    (name "gpu-screen-recoder-gtk")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.dec05eba.com/gpu-screen-recorder-gtk")
	   (commit commit)))
       (sha256
        (base32
         "4v9ml5s17brr9hryc58y8cpga5li9y7hxi0zsfpm4v4aw2fwjhya"))))
    (build-system gnu-build-system)
	(arguments
	`(#:tests? #f
	  #:phases
	 (modify-phases %standard-phases
	  (add-before 'check 'home
	  (lambda* _
	  (setenv "HOME" "tmp"))))))
    (propagated-inputs
     (list gtk+ python python-pygobject python-pyaml python-pygobject python-evdev python-requests
	 python-magic python-lxml))
    (home-page
     "https://git.dec05eba.com/gpu-screen-recorder-gtk/about/")
    (synopsis
     "")
    (description
     "")
    (license license:gpl3+)))
