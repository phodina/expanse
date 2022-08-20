(define-module (expanse packages trace)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix license:))

(define-public traceshark
  (package
    (name "traceshark")
    (version "0.9.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/cunctator/traceshark")
	   (commit (string-append "v" version "-beta"))))
       (sha256
        (base32
         "167isad5kfv8cv3k3z1hcpv3yc2i7wlabakr6ji0b17zhl68vn8h"))))
    (build-system qt-build-system)
	(arguments
   (list #:tests? #f
    #:phases
	   #~(modify-phases %standard-phases
	    (replace 'configure
		 (lambda* _
		  (substitute* "traceshark.pro"
		  (("/usr") #$output))
		  (invoke "qmake"))))))
	(inputs (list qtbase-5))
    (home-page
     "")
    (synopsis "Kernel ftrace and perf events visualization")
    (description "")
    (license license:gpl3+)))

(define-public trace-cmd
  (package
    (name "trace-cmd")
    (version "2.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/rostedt/trace-cmd")
	   (commit (string-append "trace-cmd-v" version))))
       (sha256
        (base32
         "1grpip7lywf98nsm7ql1d6bgc0ky0672savr8jz3a8hf9ny265nx"))))
    (build-system gnu-build-system)
	(arguments
	(list #:tests? #f
	      #:phases 
	 #~(modify-phases %standard-phases
	    (delete 'configure))))
;		(add-after 'unpack 'fix-makefile
;		(lambda* _
;		(substitute* "Makefile"
;		(("/usr/local") #$output)
;		(("\\$\\(shell which valgrind\\)") #$valgrind)
;		(("\\$\\(gcc\\)") #$(cc-for-target))
;		(("/bin/pwd") (which "pwd")))
;		(substitute* "scripts/utils.mk"
;		(("\\$\\(pkgconfig_dir\\)") (string-append #$output "/lib/pkgconfig"))
;		(("\\$\\(CC\\)") #$(cc-for-target))
;		(("/bin/pwd") (which "pwd"))))))))
	(native-inputs (list pkg-config)); which valgrind))
;	(inputs (list libtraceevent))
    (home-page
     "")
    (synopsis "")
    (description "")
    (license license:gpl3+)))
(define-public libtracefs
  (package
    (name "libtracefs")
    (version "1.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git")
	   (commit (string-append "libtracefs-" version))))
       (sha256
        (base32
         "1znx0fjyi47kpylgp082qdpv7xd4kjmja9asgs5mixzaffi76q8a"))))
    (build-system gnu-build-system)
	(arguments
	(list #:tests? #f
	      #:phases 
	 #~(modify-phases %standard-phases
	    (delete 'configure)
		(add-after 'unpack 'fix-makefile
		(lambda* _
		(substitute* "Makefile"
		(("/usr/local") #$output)
		(("\\$\\(shell which valgrind\\)") #$valgrind)
		(("\\$\\(gcc\\)") #$(cc-for-target))
		(("/bin/pwd") (which "pwd")))
		(substitute* "scripts/utils.mk"
		(("\\$\\(pkgconfig_dir\\)") (string-append #$output "/lib/pkgconfig"))
		(("\\$\\(CC\\)") #$(cc-for-target))
		(("/bin/pwd") (which "pwd"))))))))
	(native-inputs (list pkg-config which valgrind))
	(inputs (list libtraceevent))
    (home-page
     "")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

(define-public libtraceevent
  (package
    (name "libtraceevent")
    (version "1.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git")
	   (commit (string-append "libtraceevent-" version))))
       (sha256
        (base32
         "01wg5iikl5zpdwihm7dcgywvnjmx25pzs60pp5h45ld78anbdg48"))))
    (build-system gnu-build-system)
	(arguments
	(list #:tests? #f
	      #:phases 
	 #~(modify-phases %standard-phases
	    (delete 'configure)
		(add-after 'unpack 'fix-makefile
		(lambda* _
		(substitute* "Makefile"
		(("\\$\\(pkgconfig_dir\\)") (string-append #$output "/lib/pkgconfig"))
		(("/usr/local") #$output)
		(("/bin/pwd") (which "pwd")))
		(substitute* "scripts/utils.mk"
		(("/bin/pwd") (which "pwd"))))))))
	(native-inputs (list pkg-config which))
    (home-page
     "")
    (synopsis "Library to parse raw trace event formats")
    (description "")
    (license license:gpl3+)))

(define-public kernelshark
  (package
    (name "kernelshark")
    (version "2.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git")
	   (commit (string-append "kernelshark-v" version))))
       (sha256
        (base32
         "0jw9nngyarnasqrqgc3f5yzjjc7351ydvzavj737cc14f75zkkfl"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config))
	(inputs (list qtbase-5 libtracefs libtraceevent))
    (home-page
     "")
    (synopsis "Kernel ftrace and perf events visualization")
    (description "")
    (license license:gpl3+)))
