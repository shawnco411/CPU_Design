`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:14 01/12/2018 
// Design Name: 
// Module Name:    slllcc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module slllcc(
	input [31:0] A,
	input [4:0] s,
	output [31:0]B
    );
	 wire [31:0] AA,BB;
	assign AA=A<<(31-s+1);
	assign BB=A>>s;
	assign B=AA|BB;
endmodule

module sign_sll(
	input [3:0]a,
	output [3:0]b
	);
	assign b=$signed(a)>>>2;
endmodule
