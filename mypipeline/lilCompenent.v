`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:54 12/07/2017 
// Design Name: 
// Module Name:    lilCompenent 
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




module adder(
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] result
    );
	 always @(A,B)begin
		 result=A+B;
	 end


endmodule

module get10_6(
    input [15:0] raw,
    output reg [31:0] higher
    );
	 always @(raw)begin
		higher={raw,16'd0};
	 end


endmodule

module pcForjal(
    input [31:0] pcvalue,
    input [25:0] bit26,
    output [31:0] n_pc
    );
	 assign n_pc={pcvalue[31:28],bit26,2'b0};


endmodule

module sign_ext(
    input [15:0] in,
    output reg [31:0] out
    );
	 always @(in)begin
		 if(in[15]==1)begin
			out={16'hffff,in};
		 end
		 else if(in[15]==0)begin
			 out={16'b0,in};
		 end
	  end


endmodule

/*module Bsign_ext(
		input [7:0] in,
		output [31:0] out
		);
		assign out={{24{in[7]}},in};
endmodule
*/
module unsign_ext(
    input [15:0] in,
    output [31:0] out
    );
	 assign out={16'b0,in};



endmodule

module PctoImAddr(
    input [31:0] pcvalue,
    output [31:0] addr
    );
	 assign addr=(pcvalue-32'h00003000)/4;
	 
	


endmodule

module AlutoDmAddr(
    input [31:0] ALUin,
    output [9:0] Addr
    );
	 wire [19:0] zero1;
	 wire [1:0] zero2;
	 assign zero1=20'b0;
	 assign zero2=2'b0;
	 assign {zero1,Addr,zero2}=ALUin;
endmodule




