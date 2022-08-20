(define-module (expanse packages readers)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages containers)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages iso-codes)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))


; Failing install
(define-public foliate
  (package
    (name "foliate")
    (version "2.6.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
			  (url "https://github.com/johnfactotum/foliate")
			  (commit version)))
              (sha256
               (base32
                "1rrnrgnra5i98mvdzwnrm9jsib1c2mhc90jwxqb3wp07cc1rig9y"))))
    (build-system meson-build-system)
;    (arguments
;     (list ;#:configure-flags #~(list "--disable-static")))
;	  #:phases
;	  #~(modify-phases %standard-phases
;	   (add-after 'unpack 'fix-missing-module
;	   (lambda* _
;	   (substitute* "test/test_udev_rules.py"
;	   (("import libevdev") "import evdev"))
;	   (substitute* "meson.build"
;	   (("libevdev") "evdev")))))))
    (native-inputs (list gettext-minimal pkg-config `(,glib "bin")))
	(inputs (list iso-codes gjs))
    (home-page "https://johnfactotum.github.io/foliate/")
    (synopsis "Modern GTK eBook reader")
    (description
     "")
    (license license:gpl3+)))

; Failing install
(define-public pinenote-app
(let ((commit "cec3236321789d3c6a0d469eb4433142cb25e0c6")
      (revision "1"))
  (package
    (name "pinenote-app")
    (version "")
    (home-page "https://github.com/husnoo/pinenote-app")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "168h2aa5skphbg7fwv427l81z8j2b33zp56cvlgsfi4fn45b5isq"))))
    (build-system qt-build-system)
    (arguments
     (list
           #:tests? #f
           #:phases
		   #~(modify-phases %standard-phases
		   (delete 'configure)
	   (add-after 'unpack 'run-qmake
	   (lambda* _
	   (invoke "qmake"))))))
(inputs (list qtbase))
    (synopsis "eally simple app to draw on the screen using QT6 on a pinenote")
    (description "")
    (license #f))))

; tests depend on gnome-xsession  gnome-wayland-nested
; failing install
(define-public fly-pie
  (package
    (name "fly-pie")
    (version "16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Schneegans/Fly-Pie")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15ixjn962910jx3jnjmbx2lxb5wvv1l1az00rba3s2vbcd7fiwh7"))))
    (build-system gnu-build-system)
    (arguments
     (list
	       #:tests? #f
           #:test-target "test"
           #:phases
		   #~(modify-phases %standard-phases
		   (delete 'configure))))
	(native-inputs (list podman gettext-minimal unzip `(,glib "bin") zip))
	(inputs (list gnome-shell))
    (home-page "http://schneegans.github.io/news/2021/12/02/flypie10")
    (synopsis "Marking menu written as a GNOME Shell extension")
    (description "")
    (license license:expat)))
; Depends on this package https://github.com/archlinux/svntogit-community/blob/packages/plank/trunk/PKGBUILD
(define-public gnome-pie
  (package
    (name "gnome-pie")
    (version "0.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Schneegans/Gnome-Pie")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f6alps7wicxvw25cj5hg6ls5l99jm7a53lcvc0syb073as7h9f9"))))
    (build-system cmake-build-system)
;    (arguments
;     (list
;	       #:tests? #f
;           #:phases
;		   #~(modify-phases %standard-phases
;		   (delete 'configure))))
;	(native-inputs (list podman gettext-minimal unzip `(,glib "bin") zip))
;	(inputs (list gnome-shell))
    (native-inputs (list pkg-config))
    (inputs (list vala gtk+ libappindicator libwnck libgee libxml2 libx11
	gnome-menus))
    (home-page "http://schneegans.github.io/gnome-pie.html")
    (synopsis "Marking menu written as a GNOME Shell extension")
    (description "")
    (license license:expat)))

(define-public pdfrankenstein
  (package
    (name "pdfrankenstein")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
			  (url "https://github.com/oxplot/pdfrankenstein")
			  (commit (string-append "v" version))))
              (sha256
               (base32
                "8rrnrgnra5i98mvdzwnrm9jsib1c2mhc90jwxqb3wp07cc1rig9y"))))
    (build-system go-build-system)
    (home-page "https://johnfactotum.github.io/foliate/")
    (synopsis " PDF Annotator of Nightmares")
    (description
     "")
    (license license:bsd-3)))

(define-public sioyek
  (package
    (name "sioyek")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
			  (url "https://github.com/ahrm/sioyek")
			  (commit (string-append "v" version))))
              (sha256
               (base32
                "5rrnrgnra5i98mvdzwnrm9jsib1c2mhc90jwxqb3wp07cc1rig9y"))))
    (build-system gnu-build-system)
    (home-page "https://sioyek.info/")
    (synopsis "PDF viewer designed for reading research papers and technical books")
    (description
     "")
    (license license:gpl3+)))
