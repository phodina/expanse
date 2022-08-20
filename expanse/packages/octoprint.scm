(define-module (expanse packages octoprint)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

; Marlin Calibration Tools
; https://github.com/SergiuToporjinschi/OctoPrint-CalibrationTools

; Bed cooldown
; https://github.com/rfinnie/OctoPrint-BedCooldown

; Matrix Notifier
; https://github.com/Cadair/octoprint-matrix-notifier-plugin

; Prusa MMU
; https://github.com/jukebox42/Octoprint-PrusaMMU

; mkswifisdcard
; https://github.com/om2804/octoprint_mkswifisdcard

; Autoprint
; https://github.com/chof747/octoprint-autoprint

; Persist Terminal
; https://github.com/nivekmai/OctoPrint-PersistTerminalCommandHistory

; CNC GCode Viewer
; https://github.com/vector76/cnc_gcodeviewer

; USB relay
; https://github.com/abudden/OctoPrint-USBRelayControl

; Emergency Stop Button
; https://github.com/Sebclem/OctoPrint-SimpleEmergencyStop

; Nav bar temperature
; https://github.com/imrahil/OctoPrint-NavbarTemp

; Themeify
; https://github.com/birkbjo/OctoPrint-Themeify

; Dashboard
; https://github.com/j7126/OctoPrint-Dashboard

; Bed Level Visualizer
; https://github.com/jneilliii/OctoPrint-BedLevelVisualizer

; Arc Welder
; https://github.com/FormerLurker/ArcWelderPlugin

; Firmware Updater
; https://github.com/OctoPrint/OctoPrint-FirmwareUpdater

; Octolapse
; https://github.com/FormerLurker/Octolapse

; OAuth2
; https://github.com/Hanyman8/OctoPrint-OAuth2

; Chituboard
; https://github.com/rudetrooper/Octoprint-Chituboard

; Mariner
; https://github.com/luizribeiro/mariner

;(define-public liborigin
;(let ((commit "a92f26f28e531f64684b66a2731dd617bea3cb45")
;      (revision "1"))
;  (package
;    (name "liborigin")
;    (version (git-version "3.0.0" revision commit))
;    (home-page "https://github.com/SciDAVis/liborigin")
;    (source
;     (origin
;       (method git-fetch)
;       (uri (git-reference
;	   (url home-page) 
;	   (commit (string-append "v" version))))
;       (sha256
;        (base32
;         "1yn6vifj8f4bk5ni6pjsadjiapmdzyfn7yc9j30sd0rixsr5k1n9"))))
;    (build-system cmake-build-system)
;    (synopsis
;     "library for reading OriginLab OPJ project files ")
;    (description "This package provides a library for reading OriginLab OPJ
;project files.")
;    (license license:gpl2+))))
