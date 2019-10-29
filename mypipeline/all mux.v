`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:18 12/07/2017 
// Design Name: 
// Module Name:    Allcopenent 
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
module mux4(
    input [1:0] select,
    input [31:0] m0,
    input [31:0] m1,
    input [31:0] m2,
    input [31:0] m3,
    output reg [31:0] out
    );
	 always @(select,m3,m2,m1,m0)begin
		case(select)
			2'b00:out=m0;
			2'b01:out=m1;
			2'b10:out=m2;
			2'b11:out=m3;
		endcase
	 end

endmodule

module mux2(
	 input s0,
    input [31:0] m0,
    input [31:0] m1,
    output reg [31:0] out
    );
	 always @(s0,m0,m1)begin
		case(s0)
		1'b0:out=m0;
		1'b1:out=m1;

		endcase
	 end
endmodule

module mux8(
	input [2:0] select,
	input [31:0] m0,input [31:0] m1,
	input [31:0] m2,input [31:0] m3,
	input [31:0] m4,input [31:0] m5,
	input [31:0] m6,input [31:0] m7,
	output reg [31:0] out
	);
	always @(select,m0,m1,m2,m3,m4,m5,m6,m7)begin
		case(select)
		0:out<=m0;
		1:out<=m1;
		2:out<=m2;
		3:out<=m3;
		4:out<=m4;
		5:out<=m5;
		6:out<=m6;
		7:out<=m7;
		endcase
	end
endmodule

module bit5mux4(
  input [1:0] select,
    input [4:0] m0,
    input [4:0] m1,
    input [4:0] m2,
    input [4:0] m3,
    output reg [4:0] out
    );
	 always @* begin
		case(select)
			2'b00:out<=m0;
			2'b01:out<=m1;
			2'b10:out<=m2;
			2'b11:out<=m3;
		endcase
	 end
endmodule

module bit16mux2(
	 input s0,
    input [15:0] m0,
    input [15:0] m1,
    output reg [15:0] out
    );
	 always @(s0,m0,m1)begin
		case(s0)
		1'b0:out=m0;
		1'b1:out=m1;
		endcase
	 end
endmodule
