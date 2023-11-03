`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kishor Kumar
// 
// Create Date: 02.11.2023 20:18:17
// Design Name: 
// Module Name: dual_port_tan_tb
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


module dual_port_tan_tb();

reg clock;
reg write_enable_A;
reg write_enable_B;
reg [7:0]data_in_A;
reg [7:0]data_in_B;
reg [7:0]address_A;
reg [7:0]address_B;
wire [7:0]data_out_A;
wire [7:0]data_out_B;

dual_port_ram dut(
    .clock(clock),
    .write_enable_A(write_enable_A),
    .write_enable_B(write_enable_B),
    .data_in_A(data_in_A),
    .data_in_B(data_in_B),
    .address_A(address_A),
    .address_B(address_B),
    .data_out_A(data_out_A),
    .data_out_B(data_out_B)
);
        
initial begin
    clock = 0;
    write_enable_A = 1;
    write_enable_B = 1;
    data_in_A = 4'hF;
    data_in_B = 4'h0;
    address_A = 4'h0;
    address_B = 4'hF;
    
    #10;
    write_enable_A = 0;
    write_enable_B = 0;
    
    #10;
    address_A = 4'h2;
    data_in_A = 4'h5;
    address_B = 4'hD;
    data_in_B = 4'hA;
    
    #10;
    write_enable_A = 1;
    write_enable_B = 1;
    address_A = 4'hF;
    address_B = 4'h0;
    
    #10;
    write_enable_A = 0;
    write_enable_B = 0;
    
    #10;
    address_A = 4'hF;
    address_B = 4'h0;
    
    $display("clock=%b, write_enable_A=%b, write_enable_B=%b, data_in_A=%h, data_in_B=%h, address_A=%h, address_B=%h, data_out_A=%h, data_out_B=%h", clock, write_enable_A, write_enable_B, data_in_A, data_in_B, address_A, address_B, data_out_A, data_out_B);
     #10;
    $finish;
end

always begin
    clock = 0;
    #5;
    clock = 1;
    #5;
end


endmodule
