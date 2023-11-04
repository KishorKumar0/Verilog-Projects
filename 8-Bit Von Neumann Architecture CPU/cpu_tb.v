`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kishor Kumar
// 
// Create Date: 04.11.2023 02:20:01
// Design Name: 8-Bit Von Neumann Architecture CPU
// Module Name: cpu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module cpu_tb;

    reg clk;
    wire zero, negative;
    reg [7:0] datain;
    reg  [7:0] aluout, irvalue, pcin, imm, address;
    reg [1:0] dregsel, sregsel, aluop, regsel, addrsel;
    reg irload, imload, pcsel, pcload, readwrite, dwrite;

    // Instantiate the CPU module
    cpu uut (
        .clk(clk)
    );

    initial begin
        // Initialize signals
        clk = 0;
        datain = 8'b0;
        irvalue = 8'b0;
        imm = 8'b0;
        pcin = 8'b0;
        address = 8'b0;
        dregsel = 2'b00;
        sregsel = 2'b00;
        aluop = 2'b00;
        regsel = 2'b00;
        addrsel = 2'b00;
        irload = 0;
        imload = 0;
        pcsel = 0;
        pcload = 0;
        readwrite = 0;
        dwrite = 0;

        // Test case 1: Load an instruction into the instruction register
        irvalue = 8'b11001100;
        irload = 1;
        #10;

        // Test case 2: Perform an ADD operation
        irvalue = 8'b00000001;  // Assuming ADD instruction
        irload = 1;
        dregsel = 2'b00;        // Destination register
        sregsel = 2'b01;        // Source register
        datain = 8'b00001010;   // Input data for source register
        imload = 0;
        pcsel = 1;
        pcload = 1;
        readwrite = 1;
        dwrite = 1;
        #10;

        // Test case 3: Perform a logical AND operation
        irvalue = 8'b00000100;  // Assuming AND instruction
        irload = 1;
        dregsel = 2'b10;        // Destination register
        sregsel = 2'b11;        // Source register
        datain = 8'b11001100;   // Input data for source register
        imload = 0;
        pcsel = 1;
        pcload = 1;
        readwrite = 1;
        dwrite = 1;
        #10;

        // Add more test cases here to thoroughly test your CPU

        $finish;
    end

    always begin
        #5;
        clk = ~clk;
    end

endmodule

// Simulate the testbench
module tb;
    reg clk;
    initial begin
        clk = 0;
        // Simulate for 100 time units
        #100;
        $finish;
    end
    always begin
        #5;
        clk = ~clk;
    end
endmodule

