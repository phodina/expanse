(define-module (expanse packages allwinner)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages pth)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public xfel-new
  (package
    (inherit xfel)
	(name "xfel")
    (version "1.2.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/xboot/xfel")
	   (commit version)))
       (sha256
        (base32
         "0q5y1qwz3ykqa11jz0cqzw7r9h2fg6cwb1v711jj0x1c4hg19i8r"))))))

(define-public openixcard
  (package
    (name "openixcard")
    (version "1.0.2")
    (home-page "https://github.com/YuzukiTsuru/OpenixCard")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "1d7aj5dz53qvajamx37rjgc4nfpmvmqfwc4r69pk1dl499bc5ap8"))))
    (build-system cmake-build-system)
	(arguments
	(list #:phases
     #~(modify-phases %standard-phases
	    (add-after 'unpack 'unbundle-libs
		(lambda* _
		 (let ((genimage #$(origin
       (method url-fetch)
       (uri "https://github.com/pengutronix/genimage/releases/download/v15/genimage-15.tar.xz")
       (sha256
        (base32
         "0gh05pkmqn9ck79mwvl2812ssh0fb0xbq72iwh7b641ki2zj9jlv"))))
		 (dir "third-party/genimage"))
		 (mkdir-p dir)
		 (install-file genimage dir)
		 (substitute* "CMakeLists.txt"
		  (("include\\(CMake/genimage.cmake\\)") "")
		  (("lib/ColorCout/includes") (string-append #$colorcout
		  "/include"))
		  (("lib/argparse/include") (string-append #$argparse "/include/argparse"))
		  (("lib/inicpp/include") (string-append #$inicpp "/include/inicpp"))
		  (("lib/cpp-subprocess") (string-append #$cpp-subprocess
		  "/include/cpp-subprocess/"))
		  (("add_subdirectory\\(src/OpenixIMG\\)") "")
		  (("add_subdirectory\\(lib/inicpp EXCLUDE_FROM_ALL\\)") "")
		  (("add_subdirectory\\(lib/argparse EXCLUDE_FROM_ALL\\)") "")
		  (("add_subdirectory\\(lib/ftxui EXCLUDE_FROM_ALL\\)")
		  ""))))))))
	(inputs (list argparse colorcout cpp-subprocess ftxui inicpp))
    (synopsis "Dump, Unpack, Flash Allwinner IMG Files")
    (description
     "This package provides tool to dump, unpack and flash Allwinner IMG
files.")
    (license license:gpl2+)))

(define-public colorcout
(let ((commit "e64ffc5da038082c7cd35f4fce7b0580e2fe26fc")
      (revision "1"))
  (package
    (name "colorcout")
    (version "")
    (home-page "https://github.com/YuzukiTsuru/ColorCout")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "0q5y1qwz3ykqa06jz0cqzw7r9h2fg6cwb1v711jj0x1c4hg19i8r"))))
    (build-system cmake-build-system)
	(arguments
	(list #:tests? #f ; no test suite
	  #:phases
	  #~(modify-phases %standard-phases
	   (replace 'install
	   (lambda* _
	   (let ((inc (string-append #$output "/include")))
	   (mkdir-p inc)
	   (invoke "ls" "-al")
	   (install-file (string-append #$source "/includes/ColorCout.hpp") inc)))))))
    (synopsis "Simple colored terminal text in C++")
    (description
     "This package provides simple colored terminal text in C++.")
    (license license:wtfpl2))))

(define-public argparse
(let ((commit "234f0cde822abb67d3158089883598cfcb9473d5")
      (revision "1"))
  (package
    (name "argparse")
    (version "")
    (home-page "https://github.com/p-ranav/argparse")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "0wjmbmcw1nn6lagxp957rdhm4zmzdz0178wmlhgg4wy98qqy29gs"))))
    (build-system cmake-build-system)
	(arguments
	(list #:configure-flags #~(list
	"-DARGPARSE_BUILD_TESTS=ON")))
    (synopsis "Argument parser for modern C++")
    (description
     "This package provides argument parser for modern C++.")
    (license license:expat))))

(define-public cpp-subprocess
(let ((commit "bf4289c1a065e4967b64cf4f200ec66592e7b936")
      (revision "1"))
  (package
    (name "cpp-subprocess")
    (version "")
    (home-page "https://github.com/arun11299/cpp-subprocess")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "08hmlykx60shr61vxxjsg7rvya981pdv2gznvvzh9rv5szrcdlrh"))))
    (build-system cmake-build-system)
	(arguments
	(list #:configure-flags #~(list "-DBUILD_TESTING=ON"
	"-DCMAKE_EXE_LINKER_FLAGS=-lpthread")))
    (synopsis "Subprocessing with modern C++")
    (description
     "This package provides subprocessing with modern C++.")
    (license license:expat))))

(define-public ftxui
(let ((commit "219daf46fffc9c434d1c0f5665a4c773f44d82f3")
      (revision "1"))
  (package
    (name "ftxui")
    (version "")
    (home-page "https://github.com/ArthurSonzogni/FTXUI")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1hyrhvsy8ggm6w572b574w51zi5kvfgs3842yxxjhsfma5zb1g6j"))))
    (build-system cmake-build-system)
	(arguments
	(list ;#:configure-flags #~(list "-DFTXUI_BUILD_TESTS=ON")
#:tests? #f
#:phases
#~(modify-phases %standard-phases
	(add-after 'unpack 'unbundle-googletest
	(lambda* _
	(substitute* "cmake/ftxui_test.cmake"
	(("NOT googletest_POPULATED") "false"))
	(substitute* "cmake/ftxui_benchmark.cmake"
	(("NOT googlebenchmark_POPULATED") "false")))))))
	(native-inputs (list googletest googlebenchmark pkg-config))
    (synopsis "C++ Functional Terminal User Interface.")
    (description
     "This package provides subprocessing with modern C++.")
    (license license:expat))))

(define-public inicpp
(let ((commit "702dbfd1daa59adacc7548a77845bc0b18ef4aa3")
      (revision "1"))
  (package
    (name "inicpp")
    (version "")
    (home-page "https://github.com/SemaiCZE/inicpp")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "0zjlf9jp4ln5vscjiz9dn81bcil4gixl97d5p11d7vi6bdi1zgrw"))))
    (build-system cmake-build-system)
	(arguments
	(list #:configure-flags #~(list "-DINICPP_BUILD_TESTS=ON")
#:phases
#~(modify-phases %standard-phases
	(add-after 'unpack 'unbundle-googletest
	(lambda* _
	(substitute* "CMakeLists.txt"
	(("NOT \\$\\{NO_GOOGLE_TEST\\}") "false")))))))
	(native-inputs (list googletest pkg-config))
    (synopsis "C++ Functional Terminal User Interface.")
    (description
     "This package provides subprocessing with modern C++.")
    (license license:expat))))
