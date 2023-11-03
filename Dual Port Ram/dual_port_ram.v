`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kishor Kumar
// 
// Create Date: 02.11.2023 20:06:08
// Design Name: Dual port ram design 
// Module Name: dual_port_ram
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


module dual_port_ram(
        input clock,
        input write_enable_A,
        input write_enable_B,
        input[7:0] data_in_A,
        input [7:0]data_in_B,
        input [7:0] address_A,
        input [7:0] address_B,
        output [7:0] data_out_A,
        output [7:0] data_out_B
        );
        
reg [7:0] mem [15:0];

/*always @ (posedge clock)
	begin
		if (write_enable_A) 
		begin
			mem[address_A] <= data_in_A;
			data_out_A <= data_in_A;
		end
		else 
		begin
			data_out_A <= mem[address_A];
		end
	end
	
	// Port B
	always @ (posedge clock)
	begin
		if (write_enable_B)
		begin
			mem[address_B] <= data_in_B;
			data_out_B <= data_in_B;
		end
		else
		begin
			data_out_B <= mem[address_B];
		end
	end
	
endmodule*/


always @(posedge clock) begin
    if(write_enable_A) begin
        mem[address_A]<= data_in_A;
    end
    if(write_enable_B) begin
        mem[address_B]<= data_in_B;
    end
end

assign data_out_A = mem[address_A];
assign data_out_B = mem[address_B];

endmodule
