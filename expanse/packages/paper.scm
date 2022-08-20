(define-module (expanse packages paper)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public hydrapaper
  (package
    (name "hydrapaper")
    (version "3.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.gnome.org/GabMus/HydraPaper") 
	   (commit version)))
       (sha256
        (base32
         "0da6ij12492lq9qmc377hb7dv2ddm2r9y34ay05smywcyn1cni1n"))))
    (build-system meson-build-system)
	(arguments
	(list #:configure-flags
	        #~(list (string-append "--with-pygi-overrides-dir="
			#$output "/lib/python" #$(version-major+minor (package-version
			(this-package-input "python"))) "/site-packages/gi/overrides"))
	      #:phases
	#~(modify-phases %standard-phases
	    (add-after 'unpack 'skip-gtk-update-icon-cache
		 (lambda* _
		 (substitute* "meson_post_install.py"
		 (("gtk-update-icon-cache") "true")))))))
	(native-inputs (list blueprint-compiler gobject-introspection `(,glib "bin") `(,gtk "bin") pandoc pkg-config))
    (propagated-inputs
     (list dbus python python-pillow libadwaita gtk))
    (home-page
	"https://hydrapaper.gabmus.org/")
    (synopsis
     "Utility to set different backgrounds for each monitor on GNOME")
    (description
     "")
    (license license:gpl3+)))

(define-public blueprint-compiler
(let ((commit "06278a64248cec92bb95a958eadfba453943c061")
      (revision "1"))
  (package
    (name "blueprint-compiler")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.gnome.org/jwestman/blueprint-compiler") 
	   (commit version)))
       (sha256
        (base32
         "1nsn8zz0jarqrgs13gpql2c5z7s53sfmpfj950hxmq15yrdfljxs"))))
    (build-system meson-build-system)
	(arguments
	(list #:tests? #f))
	(native-inputs (list pkg-config))
	(inputs (list python gtk))
    (home-page
	"https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/")
    (synopsis
     "Markup language for GTK user interface files")
    (description
     "")
    (license license:lgpl3))))
