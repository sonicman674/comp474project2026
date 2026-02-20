Github username: sonicman674


## PC Hardware Diagnostic Expert System
**Course:** COMP 474/6741: INTELLIGENT SYSTEMS  
**Term:** WINTER 2026  
**Team Members:** Robert Stacey, Victor Okoro, David Makary

### 1. Project Overview
This project involves the development of an expert system designed to diagnose common PC hardware failures. The system focuses on the "Personal Computer Hardware" knowledge useful for diagnosing technical issues.

**1.1 Knowledge Domain (D) - DELIVERABLE 1 TODO 1**
- D is the subset of Personal Computer Hardware Diagnostics covering:
- Power supply and motherboard behaviour (POST, power delivery, CMOS)
- Display output and graphics card failure modes
- Memory (RAM) detection, seating, and stability
- Storage device detection, connection, and health

D satisfies the requirements: 
- team members are interested in becoming experts in PC building/repair
- authoritative sources exist (vendor manuals, PC building guides, industry standards)
- experiential knowledge about how to diagnose and how not to replace parts prematurely is useful to many DIY builders.

**1.2 SMART Goal (G) - DELIVERABLE 1 TODO 2**

- S - Specific: Diagnose common PC hardware failures using a CLIPS expert system

- M - Measurable: Cover at least 15 failure scenarios with 10+ facts and 20+ rules

- A - Achievable: Scope limited to 3 well-defined modules across 3 team members

- R - Relevant: Directly addresses real diagnostic needs of hobbyist PC builders

- T - Time-bound: Completed by the Deliverable 1 deadline

To develop a functional expert system using the CLIPS programming language by the Deliverable 1 deadline that accurately diagnoses at least 15 distinct hardware failure scenarios for hobbyist PC builders, achieved through a non-trivial knowledge base of 10+ facts and 20+ rules across 3 well-defined modules distributed among 3 team members.

**1.3 Potential User (U) - DELIVERABLE 1 TODO 3**

The expert system is designed for a Home PC Builder and Hobbyist. This user typically has:

- Knowledge Level: Intermediate. They understand basic components (RAM, CPU, GPU) but don't have experience with obscure failures.
- Goal: To quickly identify faulty hardware in a new build or existing gaming rig without paying for professional repair services.
- Needs: Clear, step-by-step guidance to isolate components and rule out simple connection errors before replacing expensive parts.

**1.4 Knowledge Base (K) - DELIVERABLE 1 TODO 4**

K is the combination of F (facts.txt) and R (rules.txt), kept as separate files. F has 33 domain facts (15 symptom indicators, 15 failure scenarios, 3 component specs) and 8 deftemplates. R has 23 rules across 3 modules. 

Rules and facts use plain hyphenated names (ex: no-power-at-all, psu-failure) and every rule has a docstring. 

All rules are written out in Structured English and predicate logic in design.txt. 

Debugging is supported using CLIPS watch commands. 

We reviewed each other's modules and ran 29 test cases (all passed), documented in test-cases.txt.


### 2. Individual Contributions

- Robert Stacey: Responsible for the Power & Motherboard Diagnostics module. This includes designing the logic for Power Supply Unit (PSU) failures and Motherboard POST error codes.
- Victor: Responsible for the Display & Graphics module, focusing on GPU failures and monitor connectivity issues.
- David: Responsible for the Memory & Storage module, focusing on RAM parity errors and storage device detection logic.

### 3. Technical Implementation
- Logic Framework: The system utilizes Structured English for logic and semantics.
- Languages: The implementation uses the CLIPS language.
- Architecture: The Knowledge Base (K) is modular, and separate from the factbase (F) and the rulebase (R) in independent text files.
- Cloud: Github is used to store files in repository

**3.1 File Structure**

- facts.txt - Factbase (F): Deftemplates and domain facts (symptom indicators, failure scenarios, component specs)
- rules.txt - Rulebase (R): Defrules for diagnostic inference across all three modules
- driver.clp - Driver script for interactive menu-driven diagnosis
- design.txt - Design document: Structured English (syntax) and predicate logic (semantics) for K
- test-cases.txt - Validation & verification: 29 documented test cases with expected results

**3.2 Usage (CLIPS IDE / CLI)**

- (load "/path/to/facts.txt")
- (load "/path/to/rules.txt")
- (load "/path/to/driver.clp")
- (reset)
- (run-diagnosis)

A menu will appear. enter symptom numbers, then 0 to run the diagnosis.

**3.3 Valid Symptom IDs**
- Power/Motherboard: no-power-at-all, shutdown-under-load, post-beep-codes, intermittent-power, time-date-reset, system-freezes-under-load

- Display/Graphics: no-display-output, screen-artifacts, monitor-not-detected, driver-crash-recovery

- Memory/Storage: ram-not-in-bios, blue-screen-crashes, storage-not-detected, boot-device-not-found, slow-storage-access

**3.4 Debugging**
Enable watches before running:

- (watch facts)
- (watch rules)
- (watch activations)

**3.5 Knowledge Base Summary**
- Factbase (F): 33 domain facts across 3 modules (15 symptom indicators, 3 component specs, 15 failure scenarios); 8 deftemplates
- Rulebase (R): 23 rules (1 session-init, 15 single-symptom diagnostic, 3 multi-symptom diagnostic, 4 session/summary/utility)



### 4. References

1. CLIPS Reference Manual, Version 6.4. Interfaces Guide. Available at: https://www.clipsrules.net/documentation/v642/ig642.pdf
2. CLIPS 6.4 User’s Guide. CLIPS Rule Based Programming Language. Available at: https://www.clipsrules.net/documentation/v642/ug642.pdf
3. CLIPS Reference Manual, Version 6.4. Basic Programming Guide. Available at: https://www.clipsrules.net/documentation/v642/bpg642.pdf
4. Corsair. How to Test a PSU (Power Supply Unit) Available at: https://www.corsair.com/ca/en/explorer/diy-builder/power-supply-units/how-to-test-a-psu-power-supply-unit/?srsltid=AfmBOorw2poPsa2xrylx9dER60jnG0xP9v9yaM8HBx_MZT8U19JaHUei
5. Memtest86. MEMTEST86 TECHNICAL INFORMATION. Available at: https://www.memtest86.com/technical.htm
6. CrystalDiskInfo. Crystal Dew World - S.M.A.R.T. HDD/SSD Monitoring Utility. Available at: https://crystalmark.info/en/software/crystaldiskinfo/
7. HP. Troubleshooting Guide Business Desktops Available at: https://h10032.www1.hp.com/ctg/Manual/c00189283.pdf
8. Dell. Understanding Beep Codes on a Dell Desktops. Available at: https://www.dell.com/support/kbdoc/en-ca/000124349/understanding-beep-codes-on-a-dell-desktop-pc
9. Display Driver Uninstaller (DDU). Wagnardsoft - DDU. Available at: https://www.wagnardsoft.com/display-driver-uninstaller-DDU-
