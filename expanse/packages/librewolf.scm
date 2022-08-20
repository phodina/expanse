(define-module (expanse packages librewolf)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages check)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages node)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libcanberra)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages video)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages rust)
  #:use-module (nongnu packages wasm)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:))
  
  
  
 (define-public node-chalk
  (package
    (name "node-chalk")
    (version "5.0.1")
    (source (origin
              (method git-fetch)
			  (uri (git-reference
			  (url "https://github.com/chalk/chalk")
			  (commit (string-append "v" version))))
              (sha256
               (base32
                "0czlv6l43l8zjc6vr4781r7spvin5c1mx81qmrbm9wil893vilgj"))))
    (build-system node-build-system)
    (home-page "https://github.com/chalk/chalk")
    (synopsis "Terminal string styling done right")
    (description "")
    (license license:expat)))
 
 (define-public wasi-sdk
  (package
    (name "wasi-sdk")
    (version "14")
    (source (origin
              (method git-fetch)
			  (uri (git-reference
			  (url "https://github.com/WebAssembly/wasi-sdk")
			  (commit (string-append "wasi-sdk-" version))))
              (sha256
               (base32
                "195qa7vlqzpcms7llp47z0w1s16ywvphw9020ghhym72k0s4gyr0"))))
    (build-system gnu-build-system)
    (arguments
     (list
	  ; #:tests? #f ;no test suite
       #:phases
       #~(modify-phases %standard-phases
        (delete 'configure)
		(add-after 'unpack 'fix-version
		 (lambda _
		     (mkdir-p "src/llvm-project/llvm")
		     (mkdir-p "src/llvm-project/clang")
              (invoke "tar" "xJf"
	          #$(origin (inherit (package-source llvm)))
			 "--strip-components=1" "-C" "src/llvm-project/llvm")
              (invoke "tar" "xJf"
	          #$(origin (inherit (package-source clang)))
			 "--strip-components=1" "-C" "src/llvm-project/clang")
	       (copy-recursively  #$(origin (method git-fetch)
             (uri (git-reference
	          (url "https://git.savannah.gnu.org/git/config.git")
			  (commit "191bcb948f7191c36eefe634336f5fc5c0c4c2be")))
             (sha256
              (base32
                "0z611h9m88ixj5zrb04k70wykxa5xj7yk1jzccm0kywmkkqkmy2c")))
		   "src/config")
		 (substitute* "Makefile"
		 (("VERSION:=.*") (string-append "VERSION=.*" #$(package-version wasi-sdk)
		 "\n"))))))))
	(native-inputs (list cmake clang ninja))
	(inputs (list wasi-libc))
    (home-page "https://github.com/WebAssembly/wasi-sdk")
    (synopsis "WASI-enabled WebAssembly C/C++ toolchain ")
    (description "")
    (license license:asl2.0)))

 (define-public python-glean-parser
  (package
    (name "python-glean-parser")
    (version "5.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "glean_parser" version))
        (sha256
          (base32 "078xmvgkmm9qpkyqd86yp0sh2qkvsz2kcvp9yhqbkr0nddl1p0zj"))))
    (build-system python-build-system)
    (arguments
	;; tests/test_validate_ping.py::test_validate_ping - network connection
     '(#:tests? #f
	   #:phases
       (modify-phases %standard-phases
         (add-before 'check 'setup-env
           (lambda _
             ;; XXX: A Python test fails when HOME=/homeless-shelter.
             (setenv "HOME" "/tmp"))))))
	(native-inputs (list python-wheel python-setuptools-scm 
 python-pytest-runner python-pytest))
    (propagated-inputs
      (list python-appdirs
            python-click
            python-diskcache
            python-jinja2
            python-jsonschema
            python-markupsafe
            python-pyyaml
            python-yamllint))
    (home-page "https://github.com/mozilla/glean_parser")
    (synopsis "Parser tools for Mozilla's Glean telemetry")
    (description "Parser tools for Mozilla's Glean telemetry")
    (license #f)))

(define-public python-glean-sdk
  (package
    (name "python-glean-sdk")
    (version "44.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "glean-sdk" version))
        (sha256
          (base32 "0afpdc9jcnv2vdmrm298phmbid8lm2gny14pgdfv3hmp183yqcl3"))))
    (build-system python-build-system)
    (arguments
	;; tests/test_validate_ping.py::test_validate_ping - network connection
     '(#:tests? #f
	   #:phases
       (modify-phases %standard-phases
         (add-before 'build 'setup-env
           (lambda _
             ;; XXX: A Cargo build fails when HOME=/homeless-shelter.
             (setenv "HOME" "/tmp"))))))
	(native-inputs (list python-wheel)); python-setuptools-scm 
; python-pytest-runner python-pytest))
    (inputs (list rust rust-cargo-0.53))
    (propagated-inputs (list python-cffi python-glean-parser))
    (home-page "https://github.com/mozilla/glean")
    (synopsis "Mozilla's Glean Telemetry SDK: The Machine that Goes 'Ping!'")
    (description
      "Mozilla's Glean Telemetry SDK: The Machine that Goes 'Ping!'")
    (license #f)))

 (define-public librewolf
  (package
    (name "librewolf")
    (version "102.0.1")
    (source (origin
              (method url-fetch)
			  (uri (string-append
			  "https://gitlab.com/librewolf-community/browser/source/-/archive/"
			  version "-1/source-" version "-1.tar.gz"))
			  ;(patches '("patches/librewolf-guix-patches.patch"))
              (sha256
               (base32
                "0ccq7mv9q4b524cqfyhyly75cm270x3301mdd6yixr0vzv1bgg6m"))))
    (build-system gnu-build-system)
    (arguments
     (list
	 ; Check Firefox
      ;#:configure-flags
      ;#~(let ((clang #$(this-package-native-input "clang"))
      ;        (wasi-sysroot #$(this-package-native-input "wasm32-wasi-clang-toolchain")))
	  #:tests? #f ;no test suite
	   #:make-flags '(list "build")
       #:phases
       #~(modify-phases %standard-phases
        (delete 'configure)
          (add-after 'unpack 'unpack-firefox
            (lambda _
			(let ((source_tarball_asc
              #$(origin (method url-fetch)
             (uri (string-append
			  "https://archive.mozilla.org/pub/firefox/releases/"
			  version "/source/firefox-"
			  version ".source.tar.xz.asc"))
             (sha256
              (base32
                "0bp4xm1kscfcjgd579xk87i61v57fmzva1w6jjjb8ablv85qbb2r"))))
			 (source_tarball 
	          #$(origin (method url-fetch)
             (uri (string-append
			  "https://archive.mozilla.org/pub/firefox/releases/"
			  version "/source/firefox-"
			  version ".source.tar.xz"))
             (sha256
              (base32
                "0w5fvn7vdv950sm7a88g2ppwkprhzbsm7952ib1xahlfdvynzfkv")))))

			;; Do not download the GPG key in run-time
		    (substitute* "Makefile"
			(("\\$\\(ff_source_tarball\\).asc") source_tarball_asc)
			(("\\$\\(ff_source_tarball\\)") source_tarball)
			(("wget.*") ""))
	         (invoke "cp" #$(origin (method url-fetch)
             (uri (string-append
			"https://keys.openpgp.org/vks/v1/by-fingerprint/14F26682D0916CDD81E37B6D61B7B526D98F0353"))
             (sha256
              (base32
                "1s9qdk29hksgibwy17vjmaslznpqxajl7l6b3mbwc0b1h9zymwy3")))
			 "public_key.asc")

             (substitute* "scripts/generate-locales.sh"
			 (("rm -rf browser/locales/l10n") "")
			 (("wget.*") "")
			 (("unzip.*") "")
			 (("mv browser/locales.*") "")
			 (("rm -f browser/locales") ""))
			 (mkdir-p "browser/locales/l10n")
			 ;; i10n
              (invoke "unzip" 
	          #$(origin (method url-fetch)
			  ;; TODO: use some commit
             (uri (string-append
	          "https://hg.mozilla.org/l10n-central/cs/archive/tip.zip"))
             (sha256
              (base32
                "08bzrnf4rapph99i1f0wjkcc9kwy28k68li9fkpq05mhv9nwsrcc")))
			 "-d" "browser/locales/l10n")
			;; remove leading directory since it cointains the commit hash
              (invoke "tar" "xzf"
	          #$(origin (method url-fetch)
             (uri (string-append
	          "https://gitlab.com/librewolf-community/settings/-/archive/0822d491d2b377b5cd7f0429cee5aa916538fa50/settings-0822d491d2b377b5cd7f0429cee5aa916538fa50.tar.gz"))
             (sha256
              (base32
                "0x4hhbk9z5q2c1kbngy0w6979h2qdxrjgbzs611a0pyx6pmcs0d4")))
			 "--strip-components=1" "-C" "submodules/settings")
              (invoke "tar" "xJf" source_tarball))))
    	(add-before 'build 'setup-build-dir
	     (lambda _
          (setenv "HOME" "/tmp")
	      (setenv "MOZBUILD_STATE_PATH" "/tmp"))))))
(inputs
      (list
        bzip2
        cairo
        cups
        dbus-glib
        freetype
        ffmpeg
        gdk-pixbuf
		gnupg
        glib
        gtk+
        gtk+-2
        hunspell
        icu4c-70
        jemalloc
        libcanberra
        libevent
        libffi
        libgnome
        libjpeg-turbo
        libnotify
        ;; libpng-apng
        libva
        libvpx
        libxcomposite
        libxft
        libxinerama
        libxscrnsaver
        libxt
        mesa
        mit-krb5
        ;; nspr
        ;; nss
        pango
        pixman
        pulseaudio
        startup-notification
        sqlite
        eudev
        unzip
        zip
        zlib))
    (native-inputs
      (list
        alsa-lib
        autoconf-2.13
        `(,rust "cargo")
        clang-12
        llvm-12
        wasm32-wasi-clang-toolchain
        m4
        nasm
        node
        perl
        pkg-config
		python-2
        python
		; python-glean-sdk  ;; telemetry do we need it ???
		python-psutil
		python-zstandard
        rust
        rust-cbindgen-0.19
        which
        yasm))

    (home-page "https://librewolf.net/")
    (synopsis "Fork of Firefox browser, focused on privacy, security and freedom")
    (description "")
    (license license:mpl2.0)))

 (define-public brave-browser
  (package
    (name "brave-browser")
    (version "1.43.29")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/brave/brave-browser/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "2rlk86xmc1gnjr57knd8nbpi5bh2qs2fqifsc9376bj8fz33ranc"))))
    (build-system node-build-system)
(native-inputs
     (list bison
           clang-13
           gn
           gperf
           lld-as-ld-wrapper
           ninja
           node-lts
           pkg-config
           which
           python-beautifulsoup4
           python-html5lib
           python-wrapper
           wayland))
    (inputs
     (list alsa-lib
           atk
           cups
           curl
           dbus
           expat
           flac
           ffmpeg
           fontconfig
           freetype
           gdk-pixbuf
           glib
           gtk+
           harfbuzz-3
           icu4c
           lcms
           libevent
           libffi
           libjpeg-turbo
           libpng
           libva
           libvpx
           libwebp
           libx11
           libxcb
           libxcomposite
           libxcursor
           libxdamage
           libxext
           libxfixes
           libxi
           libxml2
           libxrandr
           libxrender
           libxscrnsaver
           libxslt
           libxtst
           mesa
           minizip
           mit-krb5
           nss
           openh264
           openjpeg                     ;PDFium only
           ;opus+custom
           pango
           pciutils
           pipewire-0.3
           pulseaudio
           snappy
           speech-dispatcher
           eudev
           valgrind
           vulkan-headers
           vulkan-loader
           wayland
           xdg-utils))
		   (home-page "https://brave.com/")
    (synopsis "Fork of Chromium browser, focused on privacy, security and freedom")
    (description "")
    (license #f)))
