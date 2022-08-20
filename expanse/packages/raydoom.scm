(define-module (expanse packages raydoom)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public vulkan-headers-new
 (package
  (inherit vulkan-headers)
  (name "vulkan-headers")
  (version "1.3.212")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/KhronosGroup/Vulkan-Headers")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1kj7gn34afwp0vfwd3c7853r3ca57010d3bykw3fbizv9as7aav5"))))))


(define-public vulkan-loader-new
 (package
  (inherit vulkan-loader)
  (name "vulkan-loader")
  (version "1.3.212")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/KhronosGroup/Vulkan-Loader")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0gmjcf2ijjvsv6hkai6kvis66jqc3rr7rbm79qd538pywkldfd47"))))
    (inputs
     (list vulkan-headers-new))
    (arguments
     `(#:tests? #f ;; strange
	   #:configure-flags
       ,#~(list
           (string-append "-DVULKAN_HEADERS_INSTALL_DIR="
                          #$(this-package-input "vulkan-headers"))
           (string-append "-DCMAKE_INSTALL_INCLUDEDIR="
                          #$(this-package-input "vulkan-headers")
                          "/include"))
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'unpack-googletest
                    (lambda* (#:key inputs #:allow-other-keys)
                      (let ((gtest (assoc-ref inputs "googletest:source")))
                        (when gtest
                          (copy-recursively gtest "external/googletest"))
                        #t))))))))

(define-public raytracedgl1
(let ((commit "fdca400fc055b90a1bb6aa3165230e57c16e81ca")
      (revision "1"))
  (package
    (name "rtgl1")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/sultim-t/RayTracedGL1" )
	   (commit commit)))
       (sha256
        (base32
         "0ps5b1n7wcj7c5gpgc7svgpvn58s617q04j5sl2624ywaar3cyl7"))))
    (build-system cmake-build-system)
	(arguments
     `(#:configure-flags (list
	 "-DRG_WITH_SURFACE_WAYLAND=ON")))
;	`(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
;	  #:phases
;	  (modify-phases %standard-phases
;	   (delete 'configure)
;       (replace 'check
;         (lambda* (#:key tests? #:allow-other-keys)
;           (when tests?
;		     (chdir "tests")
;			 (system "Xvfb :1 &")
;             (setenv "DISPLAY" ":1")
;			 ;(substitute* "run.sh"
;			 ;(("check_deps\n") ""))
;             (invoke "./run.sh")))))))
	(native-inputs (list pkg-config))
	(inputs (list mesa vulkan-loader-new vulkan-headers-new wayland))
    (home-page
     "https://github.com/sultim-t/RayTracedGL1")
    (synopsis
     "Library that simplifies porting apps to real-time path tracing")
    (description
     "")
    (license license:expat))))
