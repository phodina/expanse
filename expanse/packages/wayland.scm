(define-module (expanse packages wayland)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages python)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-i3ipc
  (package
    (name "python-i3ipc")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "i3ipc" version))
              (sha256
               (base32
                "1s6crkdn7q8wmzl5d0pb6rdkhhbvp444yxilrgaylnbr2kbxg078"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f))
    (native-inputs (list python-pytest))
    (propagated-inputs (list python-xlib))
    (home-page "https://github.com/altdesktop/i3ipc-python")
    (synopsis "An improved Python library to control i3wm and sway")
    (description "An improved Python library to control i3wm and sway")
    (license license:bsd-3)))

(define-public nwg-displays
  (package
    (name "nwg-displays")
    (version "0.1.3")
    (home-page "https://github.com/nwg-piotr/nwg-displays")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0pfr9nq2n0r39bbw41lgdx85wwhhl2vwl0ffqhwhlmr1hljysvg9"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
	      #:phases
	 #~(modify-phases %standard-phases
          (add-after 'install 'wrap
          ;(replace 'wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((gi-typelib-path   (getenv "GI_TYPELIB_PATH"))
                     (sitedir (site-packages inputs outputs))
                     (python (dirname (dirname
                                          (search-input-file
                                            inputs "bin/python"))))
                     (python-sitedir
                         (string-append python "/lib/python"
                                        (python-version python)
                                        "/site-packages")))
                 (wrap-program (string-append #$output "/bin/nwg-displays")
                     `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))
                       `("GUIX_PYTHONPATH" ":" suffix
                         ,(list sitedir python-sitedir))))))
	    (delete 'sanity-check)
	    (add-before 'check 'pre-check
		 (lambda _
		  (setenv "HOME" (getenv "TMPDIR")))))))
	;(native-inputs (list desktop-file-utils gettext-minimal `(,glib "bin") `(,gtk+ "bin") pkg-config))
	(inputs (list gtk+ gtk-layer-shell python-i3ipc))
	(propagated-inputs (list bash-minimal python-pygobject))
    (synopsis "Output management utility for sway Wayland compositor")
    (description "")
    (license license:expat)))
