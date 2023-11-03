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


module cpu_tb();

 reg clk;

    //Instantiate the CPU module
    cpu CPU(clk);
    //VerilogDM_210_235 CPU(clk);

    initial
        begin
            $dumpfile("cpu_tb5.vcd");
            $dumpvars(0,cpu_tb);
            $display("8-Bit Von Neumann CPU");
            $display("Loading from RAM.....");
            $display("Loading Complete - 100%");
            $display("CPU simulation started .....");      
            //Initialize the clock      
            clk <= 1'b0;

        end
    initial
        forever
        #5 clk = ~clk;

    initial
        begin
            // Total time
            #100;          
            $finish;
        end

endmodule
