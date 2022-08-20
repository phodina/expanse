(define-module (expanse packages intune)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (nonguix build-system binary)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public intune
  (package
    (name "intune")
    (version "1.2204.1")
    (source
      (origin
 (method url-fetch)
	(uri (string-append
	"https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/i/intune-portal/intune-portal_" version "_amd64.deb"))
        (sha256
          (base32 "03f2v2arp777b31lkssvbsqypx6560k51adzlfj4b8iw55jl0ljk"))))
    (build-system binary-build-system)
    (arguments
     (list #:patchelf-plan #~`(("usr/bin/intune-agent" ("libx11" 
	              "libsecret"
				  "openssl"
				  "libsoup-minimal"
	              "util-linux"
				  "gtk+"
				  "glibc"
                  "zlib"
				  "inetutils"
				  "sqlite"
				  "curl"
                  "libstdc++"
                  "gcc"
				  "webkitgtk-with-libsoup2"
				  "glib"))
     ("usr/bin/intune-portal" ("libx11" 
	              "libsecret"
				  "libsoup-minimal"
				  "openssl"
	              "util-linux"
				  "glibc"
				  "gtk+"
                  "zlib"
				  "sqlite"
				  "inetutils"
				  "curl"
                  "libstdc++"
                  "gcc"
				  "webkitgtk-with-libsoup2"
				  "glib")))
       #:install-plan
       #~`(("usr/bin" "bin"))
       #:phases
       #~(modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((debian-files (assoc-ref inputs "source")))
               (invoke "ar" "x" debian-files)
               (invoke "tar" "xJf" "data.tar.xz")))))))
    (inputs (list libx11
	              curl
				  ;msalsdk-dbusclient
	              libsecret
				  libsoup-minimal-2
				  glibc
				  openssl
                  (make-libstdc++ gcc)
				  inetutils ; for hostname
	              `(,util-linux "lib")
				  webkitgtk-with-libsoup2
                  `(,gcc "lib")
				  gtk+ 
				  sqlite
				  zlib
				  glib))
    (synopsis "Microsoft Intune Endpoint Agent")
    (description
     "This package provides Microsoft Endpoint Manager to protect
	 organization-owned data on devices.")
    (home-page "https://docs.microsoft.com/en-us/mem/intune/fundamentals/what-is-intune")
	; Well what to do
	; https://docs.microsoft.com/en-us/mem/intune/fundamentals/licenses
    (license #f)))

;(define-public ambarella
; (nonguix-container->package
;  (nonguix-container
;   (name "ambarella")
;   (wrap-package ambausb)
;   (run "/bin/ambausb")

(define-public msalsdk-dbusclient
  (package
    (name "msalsdk-dbusclient")
    (version "1.0.0")
    (source
      (origin
 (method url-fetch)
	(uri (string-append
	"https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/msalsdk-dbusclient/msalsdk-dbusclient_" version "_amd64.deb"))
        (sha256
          (base32 "0dhbmwrkqg3swd3y8f6r5xrnvrzc1vkpc10sdw4z6fwx0cbqsn3q"))))
    (build-system binary-build-system)
    (arguments
     (list #:patchelf-plan #~`(("usr/lib/libmsal_dbus_client.so" (
				  ;"sdbus-cpp"
				  "glibc"
                  "dbus"
                  "libstdc++"
                  "gcc")))
;       #:install-plan
;       #~`(("usr/bin" "bin"))
       #:phases
       #~(modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((debian-files (assoc-ref inputs "source")))
               (invoke "ar" "x" debian-files)
               (invoke "tar" "xzf" "data.tar.gz")))))))
    (inputs (list dbus
				  glibc
                  (make-libstdc++ gcc)
                  `(,gcc "lib")
				  ;sdbus-cpp
				  ))
    (synopsis "Microsoft Authentication Library cross platform")
    (description
     "")
    (home-page "")
	; Well what to do
	; https://docs.microsoft.com/en-us/mem/intune/fundamentals/licenses
    (license #f)))

(define-public sdbus-cpp
  (package
    (name "sdbus-cpp")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
               (url "https://github.com/Kistler-Group/sdbus-cpp")
			   (recursive? #t)
			   (commit (string-append "v" version))))
	;		  (patches '("patches/sdbus-cpp-remove-systemd.patch"))
              (sha256
               (base32
                ;"1d1fdk47j36mvnmp9lnypj9cfmfkxm3hc507iis775lci7lrjdh2"))))
                "1d1fdk47j36mvnmp9lnypj9cfmfkxm3hc507iis775lci7lrjdh2"))))
    (build-system cmake-build-system)
	(arguments
	`(#:configure-flags '("-DBUILD_LIBSYSTEMD=ON"
	"-DBUILD_TESTS=ON")))
	(native-inputs (list meson ninja pkg-config))
	(inputs (list dbus util-linux libcap))
    (home-page "https://github.com/Kistler-Group/sdbus-cpp")
    (synopsis "High-level C++ D-Bus library")
    (description "")
    (license license:lgpl2.1)))

; TODO: JAVA based
(define-public msft-identity-broker
  (package
    (name "msft-identity-broker")
    (version "1.0.6")
    (source
      (origin
 (method url-fetch)
	(uri (string-append
	"https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/msft-identity-broker/msft-identity-broker_" version "_amd64.deb"))
        (sha256
          (base32 "1frbqsvsz74w1sms2sdbn402b2aabp4v354g4qs2nl0agcnvw8sm"))))
    (build-system binary-build-system)
    (arguments
     (list ;#:patchelf-plan #~`(("usr/lib/libmsal_dbus_client.so" (
;				  ;"sdbus-cpp"
;				  "glibc"
;                  "dbus"
;                  "libstdc++"
;                  "gcc")))
;;       #:install-plan
;       #~`(("usr/bin" "bin"))
       #:phases
       #~(modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((debian-files (assoc-ref inputs "source")))
               (invoke "ar" "x" debian-files)
               (invoke "tar" "xzf" "data.tar.gz")))))))
;    (inputs (list dbus
;				  glibc
;                  (make-libstdc++ gcc)
;                  `(,gcc "lib")
				  ;sdbus-cpp
;				  ))
    (synopsis "Microsoft Identity broker")
    (description
     "")
    (home-page "")
	; Well what to do
	; https://docs.microsoft.com/en-us/mem/intune/fundamentals/licenses
    (license #f)))
