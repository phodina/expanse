(define-module (expanse packages raytrace)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cornell-mcray
(let ((commit "0bee2e358f5deedee8561f75967a7452c2a3ff15")
      (revision "1"))
  (package
    (name "cornell-mcray")
    (version "")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
		(url "https://github.com/h3r2tic/cornell-mcray")
		(commit version)))
        (sha256
          (base32 "0jbvaz66x6m30v09nq2f8x2w26lbv1f0sz1zlfj3m3dwqac9hg1z"))))
    (build-system cargo-build-system)
    (home-page "https://github.com/h3r2tic/cornell-mcray")
    (synopsis "")
    (description "")
    (license (list license:expat license:asl2.0)))))
