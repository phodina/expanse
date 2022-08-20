(define-module (expanse packages grafana)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public grafana
(package
    (name "grafana")
    (version "8.3.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/grafana/grafana")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0j7cg43qj10r0ipad9jawiqqkiv0xxdc9n5b1g9zmnzlv1knnf6d"))))
    (build-system gnu-build-system)
	(arguments
	`(#:phases
	  (modify-phases %standard-phases
	   (add-after 'unpack 'tmp
	    (lambda* _
		 (setenv "HOME" "/tmp")))
	   (delete 'configure))))
	(inputs (list go go-github-com-drone-drone-cli))
;    (arguments '(#:import-path "github.com/grafana/grafana"))
;;;;cloud.google.com/go/storage v1.14.0
;;;;cuelang.org/go v0.4.0
;;;;github.com/Azure/azure-sdk-for-go v57.1.0+incompatible
;;;;github.com/Azure/azure-sdk-for-go/sdk/azcore v0.19.0
;;;;github.com/Azure/azure-sdk-for-go/sdk/azidentity v0.10.0
;;;;github.com/Azure/go-autorest/autorest v0.11.20
;;;;github.com/BurntSushi/toml v0.3.1
;;;;github.com/Masterminds/semver v1.5.0
;;;;github.com/VividCortex/mysqlerr v0.0.0-20170204212430-6c6b55f8796f
;;;;github.com/aws/aws-sdk-go v1.40.37
;;;;github.com/beevik/etree v1.1.0
;;;;github.com/benbjohnson/clock v1.1.0
;;;;github.com/bradfitz/gomemcache v0.0.0-20190913173617-a41fca850d0b
;;;;github.com/centrifugal/centrifuge v0.19.0
;;;;github.com/cortexproject/cortex v1.10.1-0.20211014125347-85c378182d0d
;;;;github.com/crewjam/saml v0.4.6-0.20210521115923-29c6295245bd
;;;;github.com/davecgh/go-spew v1.1.1
;;;;github.com/denisenkom/go-mssqldb v0.10.0
;;;;github.com/dop251/goja v0.0.0-20210804101310-32956a348b49
;;;;github.com/fatih/color v1.10.0
;;;;github.com/gchaincl/sqlhooks v1.3.0
;;;;github.com/getsentry/sentry-go v0.10.0
;;;;github.com/go-kit/kit v0.11.0 // indirect
;;;;github.com/go-openapi/strfmt v0.20.2
;;;;github.com/go-redis/redis/v8 v8.11.4
;;;;github.com/go-sourcemap/sourcemap v2.1.3+incompatible
;;;;github.com/go-sql-driver/mysql v1.6.0
;;;;github.com/go-stack/stack v1.8.0
;;;;github.com/gobwas/glob v0.2.3
;;;;github.com/gofrs/uuid v4.0.0+incompatible
;;;;github.com/gogo/protobuf v1.3.2
;;;;github.com/golang/mock v1.6.0
;;;;github.com/golang/snappy v0.0.4
;;;;github.com/google/go-cmp v0.5.7
;;;;github.com/google/uuid v1.3.0
;;;;github.com/google/wire v0.5.0
;;;;github.com/gorilla/websocket v1.4.2
;;;;github.com/gosimple/slug v1.9.0
;;;;github.com/grafana/cuetsy v0.0.0-20211119211437-8c25464cc9bf
;;;;github.com/grafana/grafana-aws-sdk v0.10.0
;;;;github.com/grafana/grafana-plugin-sdk-go v0.126.0
;;;;github.com/grafana/loki v1.6.2-0.20211015002020-7832783b1caa
;;;;github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
;;;;github.com/hashicorp/go-hclog v0.16.1
;;;;github.com/hashicorp/go-plugin v1.4.3
;;;;github.com/hashicorp/go-version v1.3.0
;;;;github.com/influxdata/influxdb-client-go/v2 v2.6.0
;;;;github.com/influxdata/line-protocol v0.0.0-20210311194329-9aa0e372d097
;;;;github.com/jmespath/go-jmespath v0.4.0
;;;;github.com/json-iterator/go v1.1.12
;;;;github.com/jung-kurt/gofpdf v1.16.2
;;;;github.com/laher/mergefs v0.1.1
;;;;github.com/lib/pq v1.10.0
;;;;github.com/linkedin/goavro/v2 v2.10.0
;;;;github.com/m3db/prometheus_remote_client_golang v0.4.4
;;;;github.com/magefile/mage v1.12.1
;;;;github.com/mattn/go-isatty v0.0.12
;;;;github.com/mattn/go-sqlite3 v1.14.7
;;;;github.com/matttproud/golang_protobuf_extensions v1.0.2-0.20181231171920-c182affec369
;;;;github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f
;;;;github.com/ohler55/ojg v1.12.9
;;;;github.com/opentracing/opentracing-go v1.2.0
;;;;github.com/patrickmn/go-cache v2.1.0+incompatible
;;;;github.com/pkg/browser v0.0.0-20210911075715-681adbf594b8 // indirect
;;;;github.com/pkg/errors v0.9.1
;;;;github.com/prometheus/alertmanager v0.23.1-0.20211116083607-e2a10119aaf7
;;;;github.com/prometheus/client_golang v1.12.1
;;;;github.com/prometheus/client_model v0.2.0
;;;;github.com/prometheus/common v0.32.1
;;;;github.com/prometheus/prometheus v1.8.2-0.20211011171444-354d8d2ecfac
;;;;github.com/robfig/cron v0.0.0-20180505203441-b41be1df6967
;;;;github.com/robfig/cron/v3 v3.0.1
;;;;github.com/russellhaering/goxmldsig v1.1.1
;;;;github.com/stretchr/testify v1.7.0
;;;;github.com/teris-io/shortid v0.0.0-20171029131806-771a37caa5cf
;;;;github.com/ua-parser/uap-go v0.0.0-20211112212520-00c877edfe0f
;;;;github.com/uber/jaeger-client-go v2.29.1+incompatible
;;;;github.com/unknwon/com v1.0.1
;;;;github.com/urfave/cli/v2 v2.3.0
;;;;github.com/vectordotdev/go-datemath v0.1.1-0.20220110192739-f9ce83ec349f
;;;;github.com/weaveworks/common v0.0.0-20210913144402-035033b78a78
;;;;github.com/xorcare/pointer v1.1.0
;;;;github.com/yudai/gojsondiff v1.0.0
;;;;go.opentelemetry.io/collector v0.31.0
;;;;go.opentelemetry.io/collector/model v0.31.0
;;;;go.opentelemetry.io/otel v1.2.0
;;;;go.opentelemetry.io/otel/exporters/jaeger v1.0.0
;;;;go.opentelemetry.io/otel/sdk v1.0.0
;;;;go.opentelemetry.io/otel/trace v1.2.0
;;;;golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e
;;;;golang.org/x/exp v0.0.0-20210220032938-85be41e4509f // indirect
;;;;golang.org/x/net v0.0.0-20211013171255-e13a2654a71e
;;;;golang.org/x/oauth2 v0.0.0-20210819190943-2bc19b11175f
;;;;golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
;;;;golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
;;;;golang.org/x/tools v0.1.5
;;;;gonum.org/v1/gonum v0.9.3
;;;;google.golang.org/api v0.58.0
;;;;google.golang.org/grpc v1.41.0
;;;;google.golang.org/protobuf v1.27.1
;;;;gopkg.in/alexcesaro/quotedprintable.v3 v3.0.0-20150716171945-2caba252f4dc // indirect
;;;;gopkg.in/ini.v1 v1.62.0
;;;;gopkg.in/ldap.v3 v3.1.0
;;;;gopkg.in/mail.v2 v2.3.1
;;;;gopkg.in/square/go-jose.v2 v2.5.1
;;;;gopkg.in/yaml.v2 v2.4.0
;;;;gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b
;;;;xorm.io/builder v0.3.6
;;;;xorm.io/core v0.7.3
;;;;xorm.io/xorm v0.8.2
    (home-page "https://github.com/grafana/grafana")
    (synopsis "")
    (description
      "@url{https://grafana.com,Website} | @url{https://twitter.com/grafana,Twitter} |
@url{https://community.grafana.com,Community & Forum}")
    (license license:asl2.0)))

(define-public go-github-com-drone-drone-cli
  (package
    (name "go-github-com-drone-drone-cli")
    (version "1.5.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/harness/drone-cli")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "070bmcp7sxdvvqps5n059k46180cvnkxvbj92j7c803b6llhcljc"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/drone/drone-cli"))
    (propagated-inputs
      `(("docker" ,docker)
        ("go-golang-org-x-oauth2" ,go-golang-org-x-oauth2)
        ("go-golang-org-x-net" ,go-golang-org-x-net)
        ("go-go-starlark-net" ,go-go-starlark-net)
        ("go-github-com-urfave-cli" ,go-github-com-urfave-cli)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-pkg-browser" ,go-github-com-pkg-browser)
        ("go-github-com-opencontainers-image-spec"
         ,go-github-com-opencontainers-image-spec)
        ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
        ("go-github-com-mattn-go-colorable" ,go-github-com-mattn-go-colorable)
        ("go-github-com-joho-godotenv" ,go-github-com-joho-godotenv)
        ("go-github-com-jackspirou-syscerts"
         ,go-github-com-jackspirou-syscerts)
        ("go-github-com-google-go-jsonnet" ,go-github-com-google-go-jsonnet)
        ("go-github-com-ghodss-yaml" ,go-github-com-ghodss-yaml)
        ("go-github-com-fatih-color" ,go-github-com-fatih-color)
        ("go-github-com-drone-signal" ,go-github-com-drone-signal)
        ("go-github-com-drone-funcmap" ,go-github-com-drone-funcmap)
        ("go-github-com-drone-envsubst" ,go-github-com-drone-envsubst)
        ("go-github-com-drone-drone-yaml" ,go-github-com-drone-drone-yaml)
        ("go-github-com-drone-drone-runtime"
         ,go-github-com-drone-drone-runtime)
        ("go-github-com-drone-drone-go" ,go-github-com-drone-drone-go)
        ("go-github-com-docker-go-units" ,go-github-com-docker-go-units)
        ("go-github-com-containerd-containerd"
         ,go-github-com-containerd-containerd)))
    (home-page "https://github.com/drone/drone-cli")
    (synopsis "drone-cli")
    (description
      "Command line client for the Drone continuous integration server.")
    (license license:asl2.0)))
