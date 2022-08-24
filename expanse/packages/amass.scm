(define-module (expanse packages amass)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-github-com-owasp-amass
  (package
    (name "go-github-com-owasp-amass")
    (version "2.6.0+incompatible")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/OWASP/Amass")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1dvg9sdslchbggb62p3sm7b445fy40jd2ml26wfvvwg2pd0in183"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/OWASP/Amass"))
    (home-page "https://github.com/OWASP/Amass")
    (synopsis #f)
    (description
      "The OWASP Amass tool obtains subdomain names by scraping data sources, recursive
brute forcing, crawling web archives, permuting/altering names and reverse DNS
sweeping.  Additionally, Amass uses the IP addresses obtained during resolution
to discover associated netblocks and ASNs.  All the information is then used to
build maps of the target networks.")
    (license license:asl2.0)))

