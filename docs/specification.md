# Specification - List Customers Example

## Purpose
Simple demonstration program that reads a sequential file with fixed width
customer records and prints the fields to standard output. The example
aims to illustrate the use of COPYBOOKs, FILE SECTION, and basic COBOL I/O.

## File layout
See `copybooks/LAYOUT-CUSTOMER.cpy` for the record layout.

## Notes
- In a z/OS environment, use the provided JCL members to compile and run.
- For local testing with GNU COBOL, adapt the ASSIGN clause or run the program
  with a wrapper that redirects input from `data/customers_in.txt`.
