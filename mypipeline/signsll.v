`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:39 01/12/2018
// Design Name:   sign_sll
// Module Name:   D:/ISE project/mypipeline/signsll.v
// Project Name:  mypipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_sll
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module signsll;

	// Inputs
	reg [3:0] a;

	// Outputs
	wire [3:0] b;

	// Instantiate the Unit Under Test (UUT)
	sign_sll uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 4'b1100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

