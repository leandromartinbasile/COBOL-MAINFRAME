# COBOL Matching Project

## 📌 Description
This project demonstrates a classic **COBOL batch program** for **file matching and balance update**.  
The program processes two input files:
- **Clients file** with customer data and balances.
- **Movements file** with transactions (deposits and withdrawals).

It updates client balances based on their movements and produces an **output file** with the new balances.

## File layout
See `copybooks/LAYOUT-Clients.cpy` and `copybooks/LAYOUT-Movements.cpy`  

## Notes
- In a z/OS environment, use the provided JCL members to compile and run.

