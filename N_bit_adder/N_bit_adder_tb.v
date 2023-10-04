`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Kishor Kumar 
// 
// Create Date: 04.10.2023 20:08:44
// Design Name: N_bit_adder
// Module Name: tb_N_bit_adder
// Project Name: verilog mini project
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


module tb_N_bit_adder;
reg [31:0] input1;
reg [31:0] input2;
wire [31:0] answer;

N_bit_adder uut (
  .input1(input1), 
  .input2(input2), 
  .answer(answer)
 );

initial begin
  input1 = 1234;
  input2 = 1111;
  #100;
end
      
endmodule
