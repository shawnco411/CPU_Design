`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:32:31 01/12/2018
// Design Name:   slllcc
// Module Name:   D:/ISE project/mypipeline/slllT.v
// Project Name:  mypipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: slllcc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module slllT;

	// Inputs
	reg [31:0] A;
	reg [4:0] s;

	// Outputs
	wire [31:0] B;

	// Instantiate the Unit Under Test (UUT)
	slllcc uut (
		.A(A), 
		.s(s), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		A = 32'h3ff98732;
		s = 8;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

