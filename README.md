# COBOL Project: List Customers

This repository contains a sample COBOL project designed for demonstration and learning purposes.
It simulates a typical Mainframe environment structure with COBOL sources, COPYBOOKS, JCL job scripts,
test data and basic documentation.

## Project Structure

- `src/`       → COBOL source programs
- `copybooks/` → COPYBOOK definitions (layouts)
- `jcl/`       → JCL scripts for compile and execute (example placeholders)
- `data/`      → Sample input/output data files
- `docs/`      → Technical documentation
- `README.md`  → This file

## How to use

- If you have a z/OS environment, submit the JCL under `jcl/` to compile and run the COBOL program.
- For local testing with GNU COBOL (not a full mainframe environment), you can adapt the `src/LIST-CUSTOMERS.cbl`
  to read from a local file by changing the FILE-CONTROL ASSIGN clause or using a small wrapper script.
- The copybooks are located in `copybooks/` and are included in the source via `COPY 'copybooks/LAYOUT-CUSTOMER.cpy'`.

## Example files

- `src/LIST-CUSTOMERS.cbl` — COBOL program that reads a sequential customer file and prints each record.
- `copybooks/LAYOUT-CUSTOMER.cpy` — COPYBOOK with the customer record layout.
- `jcl/` contains placeholder JCL members for compile and execute in a traditional z/OS dataset structure.
- `data/customers_in.txt` — sample input file.

## Author
Leandro Basile

## License
MIT (feel free to change)
