(define-module (expanse packages stacer)
  #:use-module (guix packages)
  #:use-module (gnu packages qt)
  #:use-module (guix git-download)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix license:))

;; Add RUNPATH to Qt
(define-public stacer
 (package
  (name "stacer")
  (version "1.1.0")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/oguzhaninan/Stacer")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0qndzzkbq6abapvwq202kva8j619jdn9977sbqmmfs9zkjz4mbsd"))))
  (build-system qt-build-system)
  (arguments
  `(#:tests? #f
    #:phases
  (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
		       (substitute* "stacer/stacer.pro"
	(("\\$\\$OUT_PWD/\\.\\./stacer-core") (string-append 
	(assoc-ref outputs "out") "/lib")))
		       (substitute*  "stacer-core/stacer-core.pro"
			   (("/usr") (assoc-ref outputs "out")))
               (invoke "qmake")))
         (add-before 'install 'install-bin
		 (lambda* (#:key outputs #:allow-other-keys)
		 (install-file "stacer/stacer" (string-append (assoc-ref outputs "out")
		 "/bin")))))))
  (native-inputs (list qttools))
  (inputs (list qtbase-5 qtcharts qtsvg))
  (synopsis "System Optimizer and Monitoring")
  (description "This package provides tool to optimize and monitor system.")
  (home-page "https://oguzhaninan.github.io/Stacer-Web/")
  (license license:gpl3+)))
