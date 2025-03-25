`timescale 1ps/1ps

module testbench;
    reg clk1, clk2;
    integer i;

    // Instantiate the DUT (Device Under Test)
    pipe_MIPS32 dut(clk1, clk2);

    // Generate Clocks
    initial begin
        clk1 = 0; clk2 = 0;
        forever begin
            #5 clk1 = ~clk1;  // Toggle clk1 every 5 time units
            #5 clk2 = ~clk2;  // Toggle clk2 every 5 time units
        end
    end

    // Initialize and run simulation
    initial begin
        // Enable VCD file dumping
        $dumpfile("dump.vcd");  // VCD file name
        $dumpvars(0, testbench); // Dump all signals in the testbench scope

        // Initialize Registers and Memory
        for (i = 0; i < 32; i = i + 1)
            dut.Reg[i] = i;  // Initialize registers with index values

        for (i = 0; i < 1024; i = i + 1)
            dut.Mem[i] = i;  // Initialize memory with index values

        // Provide some test instructions
        dut.Mem[0] = {6'b100010, 5'b00001, 5'b00010, 16'h000A}; // ADDI $2, $1, 10
        dut.Mem[1] = {6'b000000, 5'b00010, 5'b00011, 5'b00100, 5'b00000, 6'b000000}; // ADD $4, $2, $3
        dut.Mem[2] = {6'b111111, 26'b0}; // HLT

        dut.PC = 0;
        dut.HALTED = 0;
        dut.TAKEN_BRANCH = 0;

        // Run the simulation for a limited time
        #100000; // Run for enough time
        $finish;  // Stop simulation
    end
endmodule
