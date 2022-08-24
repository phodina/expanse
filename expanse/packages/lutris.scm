(define-module (expanse packages lutris)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))


; attempts to read distro
; needs to open /etc/ld.so.cache
; attempts to access GPU
(define-public lutris
  (package
    (name "lutris")
    (version "0.5.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/lutris/lutris")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1v9ml5s17brr9hryc58y8cpga5li9y7hxi0zsfpm4v4aw2fwjhya"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
	  #:phases
	 #~(modify-phases %standard-phases
	  (add-before 'check 'home
	  (lambda* _
	  (setenv "HOME" "tmp")))
	  (add-after 'unpack 'fix-webkit
                 (lambda* (#:key inputs #:allow-other-keys)
				 (substitute* "lutris/util/linux.py"
				 (("libGL.so.1") (search-input-file inputs "/lib/libGL.so.1"))
				 (("libgnutls.so.30") (search-input-file inputs "/lib/libgnutls.so.30"))
				 (("libvulkan.so.1") (search-input-file inputs "/lib/libvulkan.so.1")))
				 (substitute* "lutris/util/graphics/glxinfo.py"
				 (("\"glxinfo\"") (string-append "\"" (search-input-file inputs
				 "/bin/glxinfo") "\"")))
                   (substitute* "lutris/gui/dialogs/webconnect_dialog.py"
                     (("WebKit2\", \"4.0") "WebKit2\", \"4.1"))))
	(add-after 'install 'patch-python-references
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((site (string-append #$output "/lib/python"
                                               #$(version-major+minor (package-version
                                                                       python))
                                               "/site-packages")) (path (getenv
                                                                         "GUIX_PYTHONPATH")))
                     (wrap-program (string-append #$output "/bin/lutris")
					           ;    `("PATH" ":" prefix
                               ;,(list (search-input-file inputs "/bin/gsettings")))
                                   `("GUIX_PYTHONPATH" ":" prefix
                                     (,site ,path))
                                   `("GSETTINGS_SCHEMA_DIR" =
                                     (,(string-append #$output
                                        "/share/glib-2.0/schemas/")))
                                   `("GI_TYPELIB_PATH" ":" prefix
                                     (,(getenv
									 "GI_TYPELIB_PATH"))))))))))
	(native-inputs (list `(,glib "bin") `(,gtk+ "bin")))
    (propagated-inputs
     (list dbus webkitgtk gtk+ python-dbus gnome-desktop `(,glib "bin") python
	 python-pygobject python-pyaml python-pygobject python-evdev python-requests
	 python-pillow libnotify python-distro
	 python-magic python-lxml xgamma retroarch
	 mesa vkd3d wine mesa-utils vulkan-loader gnutls
	hicolor-icon-theme))
    (home-page
     "https://github.com/lutris/lutris")
    (synopsis
     "Lutris helps you install and play video games from all eras and from most
	 gaming systems")
    (description
     "")
    (license license:gpl3+)))
