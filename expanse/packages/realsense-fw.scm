commit f4875fba30e362f6aaa2302ac389cb02be72cb7d
Author: Petr Hodina <phodina@protonmail.com>
Date:   Mon Jul 19 16:49:38 2021 +0200

    Add firmware

diff --git a/expanse/packages/librealsense.scm b/expanse/packages/librealsense.scm
index ae35083..72470f3 100644
--- a/expanse/packages/librealsense.scm
+++ b/expanse/packages/librealsense.scm
@@ -27,54 +27,152 @@
   #:use-module (gnu packages pkg-config)
   #:use-module (gnu packages ninja)
   #:use-module (gnu packages version-control)
+  #:use-module (srfi srfi-1)
   #:use-module (guix git-download)
   #:use-module (guix build-system cmake)
+  #:use-module (guix build-system copy)
   #:use-module ((guix licenses) #:prefix license:))
 
+; (url "https://github.com/NVIDIA/nvidia-docker")
+(define (search-patch file-name)
+  "Search the patch FILE-NAME.  Raise an error if not found."
+  (or (search-path (%expanse-patch-path) file-name)
+      (raise (formatted-message (G_ "~a: patch not found")
+                                file-name))))
+
+(define-syntax-rule (search-patches file-name ...)
+		      "Return the list of absolute file names corresponding to each
+		    FILE-NAME found in %PATCH-PATH."
+		      (list (search-patch file-name) ...))
+
+(define %channel-root
+    (find (lambda (path)
+	              (file-exists? (string-append path "/expanse/packages/librealsense.scm")))
+	          %load-path))
+
+(define %expanse-patch-path
+  (make-parameter
+   (append
+    (list (string-append %channel-root "/expanse/packages/patches"))
+    (%patch-path))))
+
 (define-public librealsense
-(package
+ (package
   (name "librealsense")
-  (version "v2.45.0")
+  (version "2.47.0")
   (source (origin
-	    (method git-fetch)
-            (uri
-	      (git-reference
-		(url "https://github.com/IntelRealSense/librealsense")
-		(commit version)))
-	    ;(patches '("patches/py_pybind11_no_external_download.patch" "patches/py_sitepackage_dir.patch"))
+           (method git-fetch)
+           (uri (git-reference
+                 (url "https://github.com/IntelRealSense/librealsense")
+                 (commit (string-append "v" version))))
+           (patches
+            (search-patches "librealsense-remove-network-connectivity.patch"))
+            ;'("patches/librealsense-remove-network-connectivity.patch"))
+           (file-name (git-file-name name version))
+           (modules '((guix build utils)))
             (sha256
              (base32
-              "0aqf48zl7825v7x8c3x5w4d17m4qq377f1mn6xyqzf9b0dnk4i1j"))))
+              "1jshhcnvbaa3xm5jr1s5m6z62wn1cspb7wkfdc1w88kp9j02ss8w"))))
   (build-system cmake-build-system)
   (arguments
        `(#:tests? #f
-	 #:configure-flags '("-DBUILD_EXAMPLES=ON" "-DBUILD_GRAPHICAL_EXAMPLES=OFF" "-DBUILD_GLSL_EXTENSIONS=OFF")))
-  (native-inputs `(("git" ,git) ("pkg-config" ,pkg-config) ("curl" ,curl) ("ninja" ,ninja)))
-;           (method git-fetch)
-;           ;(let* ((RS4XX_VER 5.12.14.50)
-;                  ;(SR300_VER 3.26.1.0)
-;                  ;(TM2_VER 0.2.0.951)
-;                  ;(L5XX_VER 1.5.8.1))
-;            (uri (list
-;                 (git-reference
-;                  (url "https://github.com/IntelRealSense/librealsense")
-;                  (commit version))
-;                 (git-reference
-;                  (url "https://github.com/NVIDIA/nvidia-docker")
-;                  (commit version))
-;                (method url-fetch
-;                   (uri (string-append "https://librealsense.intel.com/Releases/RS4xx/FW/D4XX_FW_Image-" "_RS4XX_VER" ".bin")))
-;                (method url-fetch
-;                   (uri (string-append "https://librealsense.intel.com/Releases/SR300/FW/SR3XX_FW_Image-""_SR300_VER" ".bin")))
-;                (method url-fetch
-;                   (uri (string-append "https://librealsense.intel.com/Releases/TM2/FW/target/" "_TM2_VER" ".mvcmd")))
-;                (method url-fetch
-;                   (uri (string-append "https://librealsense.intel.com/Releases/L5xx/FW/L5XX_FW_Image-" "_L5XX_VER" ".bin")))
-;                 ))
-
-  (inputs `(("glfw" ,glfw) ("gtk+" ,gtk+) ("libusb" ,libusb) ("openssl" ,openssl)))
-  (outputs `("out" "dev"))
-  (synopsis "Intel® RealSense™ SDK")
-  (description "Intel® RealSense™ SDK 2.0 is a cross-platform library for Intel® RealSense™ depth cameras (D400 & L500 series and the SR300) and the T265 tracking camera.")
+         #:configure-flags (list "-DBUILD_EXAMPLES=ON"
+                                 "-DBUILD_GRAPHICAL_EXAMPLES=ON"
+                                 "-DINTERNET_CONNECTION=OFF"
+                                 "-DCHECK_FOR_UPDATES=OFF")
+         #:phases
+           (modify-phases %standard-phases
+            ;; more convenient than manually invoking setup_udev_rules.sh
+            ;; and substituting the path in the script
+            (add-after 'unpack 'copy-udev-rules
+              (lambda* (#:key outputs #:allow-other-keys)
+               (let ((out (string-append (assoc-ref outputs "out")
+                            "/etc/udev/rules.d")))
+               (mkdir-p (string-append out))
+               (copy-file "config/99-realsense-libusb.rules"
+                          (string-append out
+                           "/99-realsense-libusb.rules"))))))))
+  (native-inputs `(("pkg-config" ,pkg-config)
+                   ("ninja" ,ninja)))
+  (inputs `(("glfw" ,glfw)
+            ("gtk+" ,gtk+)
+            ("libusb" ,libusb)
+            ("glu" ,glu)))
+  (synopsis "Intel RealSense SDK")
+  (description "Intel RealSense SDK 2.0 is a cross-platform library for
+Intel RealSense depth cameras (D400 & L500 series and the SR300) and the
+T265 tracking camera.")
   (home-page "https://github.com/IntelRealSense/librealsense")
   (license license:gpl3)))
+
+
+(define-public librealsense-fw
+ (let ((RS4XX "fw-rs4xx-5")
+       (SR300 "fw-sr3xx-3")
+       (TM2 "fw-tm2")
+       (L5XX "fw-l5xx-1")
+       (url "https://librealsense.intel.com/Releases/"))
+  (package
+   (inherit librealsense)
+   (name "librealsense-fw")
+   (arguments
+       `(#:tests? #f
+         #:configure-flags (list "-DBUILD_EXAMPLES=ON"
+                                 "-DBUILD_GRAPHICAL_EXAMPLES=ON"
+                                 "-DINTERNET_CONNECTION=OFF"
+                                 "-DBUILD_WITH_TM2=true"
+                                 "-DBUILD_WITH_OPENMP=on"
+                                 "-DCHECK_FOR_UPDATES=OFF")
+       #:phases
+        (modify-phases %standard-phases
+         (add-after 'unpack 'install-fw
+           (lambda (#:key outputs #:allow-other-keys)
+            (let ((rs4xx-fw (string-append "DXX_FW_Image-" RS4XX ".bin"))
+                  (sr3xx-fw (string-append "SR3XX_FW_Image-" SR300 ".bin"))
+                  (tm2-fw (string-append TM2 ".mvcmd"))
+                  (l5xx-fw (string-append "L5XX_FW_Image-" L5xx ".bin")))
+             (with-directory-excursion "common/fw"
+              (copy-file
+                (string-append (assoc-ref inputs "fw-rs4xx-5") rs4xx-fw)
+                rs4xx-fw)
+              (copy-file
+                (string-append (assoc-ref inputs "fw-sr3xx-3") sr3xx-fw)
+                sr3xx-fw)
+              (copy-file
+                (string-append (assoc-ref inputs "fw-tm2") tm2-fw)
+                tm2-fw)
+              (copy-file
+                (string-append (assoc-ref inputs "fw-l5xx-1") l5xx-fw)
+                l5xx-fw))))))))
+   (inputs `((RS4XX ,(origin (method git-fetch)
+              (uri (git-reference
+               (url (string-append url "RS4xx/FW/D4XX_FW_Image-" version ".bin"))
+               (commit version)))
+              (file-name (git-file-name name version))
+              (sha256
+               (base32
+                "0k2yhvbfyw2rzqk85xd0m6bg8ily0lz5jzh2ysyhm3hr0m9v62s0"))))
+             (SR300 ,(origin (method git-fetch)
+              (uri (git-reference
+               (url (string-append url "SR300/FW/SR3XX_FW_Image-" version ".bin"))
+               (commit version)))
+              (file-name (git-file-name name version))
+              (sha256
+               (base32
+                "6k2yhvbfyw5rzqk85xd0m6bg8ily0lz5jzh2ysyhm3hr0m9v62s0"))))
+             (TM2 ,(origin (method git-fetch)
+              (uri (git-reference
+               (url (string-append url "TM2/FW/target/" version ".mvcmd"))
+               (commit version)))
+               (file-name (git-file-name name version))
+              (sha256
+               (base32
+                "0k2yhvbfyw1rzqk62xd0m6bg8ily0lz5jzh2ysyhm3hr0m9v62s0"))))
+             (L5xx ,(origin (method git-fetch)
+              (uri (git-reference
+               (url (string-append url "L5xx/FW/L5XX_FW_Image-" version ".bin"))
+               (commit version)))
+               (file-name (git-file-name name version))
+              (sha256
+               (base32
+                "0k8yhvbfyw1rzqk85xd0m6bg8ily0lz5jzh2ysyhm3hr0m9v62s0")))))))))
