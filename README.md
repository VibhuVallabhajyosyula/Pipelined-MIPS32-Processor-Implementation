# Pipelined-MIPS32-Processor-Implementation
This Verilog module implements a pipelined MIPS-32 processor using a five-stage pipeline:

- Instruction Fetch (IF)

- Instruction Decode (ID)

- Execution (EX)

- Memory Access (MEM)

- Write-Back (WB)

Pipeline Stages Breakdown:
1. Instruction Fetch (IF)
Fetches instruction from memory using PC.

Handles branch prediction to adjust the PC accordingly.

2. Instruction Decode (ID)
Decodes instruction opcode and operand registers.

Computes immediate values and determines instruction type.

3. Execution (EX)
Performs arithmetic/logical operations for R-type and I-type instructions.

Calculates memory addresses for load/store instructions.

Evaluates branch conditions.

4. Memory Access (MEM)
Reads/writes memory for load/store instructions.

Determines branch taken/not-taken.

5. Write-Back (WB)
Writes results back to registers.

Stops execution when HLT instruction is encountered.

This module efficiently handles MIPS-32 operations in a pipelined manner, improving performance by executing multiple instructions simultaneously across different stages.
