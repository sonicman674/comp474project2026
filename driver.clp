
;;; PC HARDWARE DIAGNOSTIC EXPERT SYSTEM - DRIVER / TEST SCRIPT

;;; Load order: facts.txt, rules.txt, then this driver.
;;; Then: (reset) and (run-diagnosis) for interactive menu.


(deffunction run-diagnosis ()
  "Interactive menu: user selects symptoms, then system runs diagnosis"
  (printout t crlf "========================================" crlf)
  (printout t "  PC HARDWARE DIAGNOSTIC EXPERT SYSTEM" crlf)
  (printout t "========================================" crlf)
  (printout t crlf "Select the symptoms you are experiencing (enter numbers separated by spaces)." crlf)
  (printout t "Enter 0 when done." crlf crlf)
  (printout t "  POWER & MOTHERBOARD:" crlf)
  (printout t "    1.  No power at all" crlf)
  (printout t "    2.  Shutdown under load" crlf)
  (printout t "    3.  POST beep codes" crlf)
  (printout t "    4.  Intermittent power" crlf)
  (printout t "    5.  Time/date resets" crlf)
  (printout t "    6.  System freezes under load" crlf)
  (printout t "  DISPLAY & GRAPHICS:" crlf)
  (printout t "    7.  No display output" crlf)
  (printout t "    8.  Screen artifacts" crlf)
  (printout t "    9.  Monitor not detected" crlf)
  (printout t "   10.  Driver crash/recovery" crlf)
  (printout t "  MEMORY & STORAGE:" crlf)
  (printout t "   11.  RAM not in BIOS" crlf)
  (printout t "   12.  Blue screen crashes" crlf)
  (printout t "   13.  Storage not detected" crlf)
  (printout t "   14.  Boot device not found" crlf)
  (printout t "   15.  Slow storage access" crlf)
  (printout t crlf "Enter symptom number (1 3 11) or 0 to run: ")
  (bind ?symptoms (create$ no-power-at-all shutdown-under-load post-beep-codes
    intermittent-power time-date-reset system-freezes-under-load no-display-output
    screen-artifacts monitor-not-detected driver-crash-recovery ram-not-in-bios
    blue-screen-crashes storage-not-detected boot-device-not-found slow-storage-access))
  (bind ?choice (read))
  (while (neq ?choice 0)
    (if (and (>= ?choice 1) (<= ?choice 15)) then
      (bind ?sid (nth$ ?choice ?symptoms))
      (assert (reported-symptom (symptom-id ?sid) (observed yes)))
      (printout t "  Added: " ?sid crlf))
    (printout t "Next (or 0 to run diagnosis): ")
    (bind ?choice (read)))
  (printout t crlf)
  (run)
  (printout t crlf))
