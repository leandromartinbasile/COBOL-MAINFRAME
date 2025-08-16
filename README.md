# COBOL Project: Matching

This project demonstrates a classic **COBOL batch program** for **file matching and balance update**.  
The program processes two input files:
- **Clients file** with customer data and balances.
- **Movements file** with transactions (deposits and withdrawals).

## Project Structure

- `src/`       → COBOL source programs
- `copybooks/` → COPYBOOK definitions (layouts)
- `jcl/`       → JCL scripts for compile and execute (example placeholders)
- `data/`      → Sample input/output data files
- `docs/`      → Technical documentation
- `README.md`  → This file

## How to use

- If you have a z/OS environment, submit the JCL under `jcl/` to compile and run the COBOL program.
- For local testing with GNU COBOL (not a full mainframe environment), you can adapt the `src/matching.cbl`
  to read from a local file by changing the FILE-CONTROL ASSIGN clause or using a small wrapper script.
- The copybooks are located in `copybooks/`.




