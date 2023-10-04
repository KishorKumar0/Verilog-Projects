`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 20:07:00
// Design Name: 
// Module Name: N_bit_adder
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

module N_bit_adder(input1, input2, answer);
parameter N = 32;
input [N-1:0] input1, input2;
output [N-1:0] answer;
wire carry_out;
wire [N-1:0] carry;
genvar i;
generate
   for (i = 0; i < N; i = i + 1)
     begin: generate_N_bit_Adder
        if (i == 0)
          half_adder f(input1[0], input2[0], answer[0], carry[0]);
        else
          full_adder f(input1[i], input2[i], carry[i-1], answer[i], carry[i]);
     end
  assign carry_out = carry[N-1];
endgenerate
endmodule

module half_adder(x, y, s, c);
input x, y;
output s, c;
assign s = x ^ y;
assign c = x & y;
endmodule

module full_adder(x, y, c_in, s, c_out);
input x, y, c_in;
output s, c_out;
assign s = (x ^ y) ^ c_in;
assign c_out = (y & c_in) | (x & y) | (x & c_in);
endmodule
