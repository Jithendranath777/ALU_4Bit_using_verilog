# 4-Bit ALU using Verilog

## Project Overview

This project implements a **4-bit Arithmetic Logic Unit (ALU)** in Verilog, capable of performing a wide range of arithmetic, logical, comparison, and shift/rotate operations. The ALU is designed for FPGA implementation and outputs an 8-bit result to accommodate operations like multiplication and power. It also includes basic flags for **Zero** and **Carry** detection.

This repository contains the complete code in the **master branch**.

---

## Features

### Arithmetic Operations

* **Addition** (`ALU_Sel = 00000`)
* **Subtraction** (`ALU_Sel = 00001`)
* **Multiplication** (`ALU_Sel = 00010`)
* **Division** (`ALU_Sel = 00011`) – Returns `8'hFF` if divided by zero
* **Modulus** (`ALU_Sel = 00100`) – Returns `8'hFF` if divided by zero
* **Exponentiation (Power)** (`ALU_Sel = 00101`)

### Logical Operations

* **AND** (`ALU_Sel = 01000`)
* **OR** (`ALU_Sel = 01001`)
* **XOR** (`ALU_Sel = 01010`)
* **XNOR** (`ALU_Sel = 01011`)
* **NAND** (`ALU_Sel = 01100`)
* **NOR** (`ALU_Sel = 01101`)
* **NOT A** (`ALU_Sel = 01110`)
* **NOT B** (`ALU_Sel = 01111`)

### Comparison Operations

* **Equal** (`ALU_Sel = 10000`)
* **Not Equal** (`ALU_Sel = 10001`)
* **Less Than** (`ALU_Sel = 10010`)
* **Greater Than** (`ALU_Sel = 10011`)
* **Less Than or Equal** (`ALU_Sel = 10100`)
* **Greater Than or Equal** (`ALU_Sel = 10101`)

### Shift and Rotate Operations

* **Logical Left Shift** (`ALU_Sel = 11000`)
* **Logical Right Shift** (`ALU_Sel = 11001`)
* **Arithmetic Left Shift** (`ALU_Sel = 11010`)
* **Arithmetic Right Shift** (`ALU_Sel = 11011`)
* **Rotate Left** (`ALU_Sel = 11100`)
* **Rotate Right** (`ALU_Sel = 11101`)

---

## Inputs and Outputs

| Signal    | Width | Description                                    |
| --------- | ----- | ---------------------------------------------- |
| `A`       | 4-bit | First input operand                            |
| `B`       | 4-bit | Second input operand                           |
| `ALU_Sel` | 5-bit | Select signal to choose ALU operation          |
| `ALU_Out` | 8-bit | Output of the ALU                              |
| `Zero`    | 1-bit | High when `ALU_Out` is zero                    |
| `Carry`   | 1-bit | High when addition results in carry (overflow) |

---

## Implementation Details

* The ALU uses a **combinational always block** triggered on any input change (`always @(*)`).
* Arithmetic operations handle common exceptions like division/modulus by zero.
* Logical and comparison operations return the expected results in 8-bit format.
* Shift and rotate operations are implemented for single-bit shifts.
* **Zero flag** is high if the output is zero.
* **Carry flag** is high only for addition overflow.

---

## Simulation

You can simulate the ALU using your preferred Verilog simulator (Vivado, ModelSim, or Icarus Verilog). Example testbench steps:

1. Instantiate the ALU module.
2. Apply various values of `A`, `B`, and `ALU_Sel`.
3. Monitor `ALU_Out`, `Zero`, and `Carry` signals.

---

## Usage

2. Navigate to the **master branch** to find the code:

```bash
git checkout master
```

3. Open the Verilog file in your FPGA tool or simulator to synthesize and test.

---

## Branch Information

> **Note:** All project code files are in the `master` branch. There is no `main` branch.

---

## Future Enhancements

* Implement multi-bit shifts/rotates.
* Include carry/borrow for subtraction and other operations.
* Optimize power operation for hardware efficiency.
* Expand ALU to 8-bit or 16-bit operations for more complex applications.

---

## Author

**Angam Jithendranath**

* Email: [jithendranathangam@gmail.com](mailto:jithendranathangam@gmail.com)
* Contact: +91-9908476598
* LinkedIn / GitHub: github.com/Jithendranath777
