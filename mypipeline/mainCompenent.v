`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:45 12/07/2017 
// Design Name: 
// Module Name:    mainCompenent 
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
`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define shamt 10:6
`define func 5:0
`define imm16 15:0
`define bit26 25:0
module controler(
	 input [4:0] bkind,
	 inout [31:0] rdata1,rdata2,
    input [5:0] op,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg [1:0] ALUSrc,
	 output reg [1:0] ALUSrcA,
    output reg [2:0] MemtoReg,
    output reg [2:0] pcsrc,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [3:0] operation,
	 output reg readHalf,
	 output reg [1:0] subBsrc,
	 output reg extWay,
	 output reg work
    );
	always @* begin
		RegWrite<=0;
		MemRead<=0;
		MemWrite<=0;
		pcsrc<=0;	//normally choose pc+4
		readHalf<=0;
		subBsrc<=0;
		ALUSrcA<=0;
		extWay<=0;
		work<=0; //show whether the pipeline part is working
		case(op)
			6'b000000:begin
						RegDst<=2'b01;
						ALUSrc<=2'b00;
						MemtoReg<=0;
						 case(func)
							 6'b100001:begin  operation<=4'b0000;
													RegWrite<=1;
										  end//addu
							 6'b100011:begin operation<=4'b0001;
													RegWrite<=1;
										  end//subu
							 6'b001000:begin 
													pcsrc<=3;
										  end//jr
							 6'b000100:begin
											ALUSrc<=0;
											operation<=4;
											RegWrite<=1;
										  end //sllv
							 6'b011000:begin
											operation<=5;
										  end//mult
						 endcase
					 end
			6'b001101:begin
					 RegDst<=2'b00;
					 ALUSrc<=1;
					 MemtoReg<=0;
					 RegWrite<=1;
					 operation<=2;
					 extWay<=1;
					 end//ori
			6'b100011:begin
					  RegDst<=2'b00;
					  ALUSrc<=1;
					  MemtoReg<=1;
					  RegWrite<=1;
					  MemRead<=1;
					  operation<=0;
					  end//lw
			6'b101011:begin
					 ALUSrc<=1;
					 MemWrite<=1;
					 operation<=0;
					 end//sw
			6'b000100:begin
					  ALUSrc<=0;
					  pcsrc<=1;
					  end//beq
			6'b001111:begin
					  RegDst<=2'b00;
					  MemtoReg<=0;
					  operation<=4; //shift left
					  RegWrite<=1;
					  ALUSrcA<=1; //chose to left shif 16
					  ALUSrc<=1;
					  extWay<=1;
					  end//lui
			6'b000011:begin
					  RegDst<=2'b10;
					  RegWrite<=1;
					  MemtoReg<=2;
					  pcsrc<=2;
					  end//jal
			6'b100101:begin
					  readHalf<=1;
					  operation<=0;
					  RegWrite<=1;
					  MemtoReg<=1;
					  MemRead<=1;
					  ALUSrc<=1;
					  RegDst<=0;
					  end //lhu
			6'b000001:begin					//all btype
					  case(bkind)
							5'b00001:begin
								pcsrc<=4;
								subBsrc<=1;		//bgez 
							end
							5'b10001:begin
								pcsrc<=4;
								subBsrc<=1;	//choose 0
								RegDst<=2; //choose $31
								MemtoReg<=2;	//choose pcW+4
								if($signed(rdata1)>=0)	work<=1;
							end 					//bgezal
					  endcase
					  end
			6'b000010:begin
						pcsrc<=2;
						end //j
			6'b011111:begin
					RegWrite<=1;
					RegDst<=1;
					MemtoReg<=0;
					ALUSrc<=0;
					operation<=6;
						end	//seb
			6'b001000:begin
					RegWrite<=1;
					extWay<=0;
					ALUSrc<=1;
					RegDst<=0;
					MemtoReg<=0;
					operation<=0;
					end//addi
			6'b111100:begin
					RegWrite<=1;
					pcsrc<=4;
					subBsrc<=1;
					RegDst<=2;
					MemtoReg<=2;
					end //bgezals
			6'b111111:begin
					RegWrite<=1;
					pcsrc<=5;
					subBsrc<=1;
					RegDst<=1;
					MemtoReg<=2;
					end //bgezalr
		endcase
	end
endmodule

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] operation,
    output reg [31:0] result,
	 output reg [31:0] lo,
	 output reg [31:0] hi
    );
	 reg [63:0] mult;
	 initial result<=0;
	 always @(*)begin
		case(operation)
		4'b0000:result=A+B;//0
		4'b0001:result=A-B;//1
		4'b0010:result=A|B;//2
		4'b0011:result=A*B;//3
		4'b0100:result=B<<A[4:0];//4
	   4'b0101:begin
				  mult=$signed(A)*$signed(B);
				  {hi,lo}=mult;
				  end //mult(5)
		4'b0110:begin
				  result={{24{B[7]}},B[7:0]};	
				  end  //byte_signext(6)
		endcase
	 end
	 
endmodule

module sub(
	input [31:0] a,
	input [31:0] b,
	output [31:0] a_b
	);
	assign a_b=a-b;
endmodule

module newpc(
	input [31:0] ir,
	input [31:0] pc4,
	input [31:0] a_b,
	input [31:0] sra,
	input [31:0] oRTD,
	input [2:0] pcsrc,
	output reg [31:0] npc
	);
	always @* begin

		case(pcsrc)
			3'd0:npc<=pc4;  //regular
			3'd1:begin	
					if(a_b==0) npc<=pc4+{{14{ir[15]}},ir[`imm16],2'b0};
					else npc<=pc4+4;
				end			//beq		
			3'd2:npc<={ir[31:28],ir[`bit26],2'b0}; //jal
			3'd3:npc<=sra;//jr
			3'd4:begin 
					if($signed(a_b)>=0) npc<=pc4+{{14{ir[15]}},ir[`imm16],2'b0};//bgez
				   else npc<=pc4+4; //bgez&bgezal
				 end
			3'd5:begin
					if($signed(a_b)>=0) npc<=oRTD;
					else npc<=pc4+4;// bgezalr
				  end
		endcase
	end
	
endmodule
	

module PC(
    input clk,
    input reset,
	 input en,
    input [31:0] n_pc,
	 input  [2:0] pcsrc,
    output reg [31:0] pc_value
    
	 );
	 initial pc_value=32'h00003000;
	 always @(posedge clk)begin
		 if(reset)begin
			 pc_value<=32'h00003000;
		 end
		 else if(en)begin
			if(pcsrc==3'b0)
				pc_value<=pc_value+4;
			else
				pc_value<=n_pc;
		 end
		 else pc_value<=pc_value;//keep previous pcvalue
	 end
endmodule

module IM(
    input [31:0] Addr,
    output reg [31:0] Data
    );
	 reg [31:0] im [1023:0];
	 initial begin
		$readmemh("code.txt",im);
	 end
	 always @(*)begin
			Data<=im[Addr];
	 end
endmodule

module IFU(
	input clk,
	input reset,
	input en,
	input [2:0] pcsrc,
	input [31:0] npc,
	output  [31:0] ir,
	output  [31:0] pc4,
	output  [31:0] pcvalue
	);
	wire [31:0] addr;
	PC pc(.clk(clk),.reset(reset),.en(en),.pcsrc(pcsrc),.n_pc(npc),.pc_value(pcvalue));
	PctoImAddr getImaddr(pcvalue,addr);
	IM im(addr,ir);
	assign pc4=pcvalue+4;
endmodule

/*module IFU(
    input clk,
    input reset,
    input [1:0] pcsrc,
    input [31:0] sign_ext,
	 input [31:0] Rdata1,
    output [31:0] instr,
	 output [31:0] pcvalue, //for grf print
	 output [31:0] pcadd4
    );
    wire [31:0] n_pc;
    wire [31:0] pc_value; //for PC
	 wire[31:0] Addr; //for IM
	 wire [31:0] pc0,pc1,pc2,pc3;// diffrent pc value
	 wire [31:0] shifted;
	 assign shifted=sign_ext<<2;
	 
 	 PC pc(clk,reset,n_pc,pc_value);
	 PctoImAddr IMAddr(pc_value,Addr); //get right addr
	 IM im(Addr,instr);
	 adder add4(pc_value,32'd4,pc0);//pc0=PC+4
	 adder add_beq(pc0,shifted,pc1);//pc1=pc+4+signext(imm16)<<2
	 pcForjal pc4jal(pc_value,instr[25:0],pc2);//pc2=pc[31:28]||26bit||00
	 assign pc3=Rdata1;
	 mux4 pcmux(pcsrc,pc0,pc1,pc2,pc3,n_pc);//get ritht n_pc
	 
	assign pcvalue=pc_value;
	assign pcadd4=pc0;
endmodule
*/


module DM(
    input clk,
    input reset,
    input memRead,
    input memWrite,
    input [9:0] addr,
    input [31:0] wdata,
	 input [31:0] pcvalue,//for print
	 input [31:0] realaddr,
	 input readHalf,
    output [31:0] rdata
    );
	 reg [31:0] dm [0:1023];
	 integer i;
	 initial begin
	 				for(i=0;i<=1023;i=i+1) dm[i]=0;
	 end
	wire [15:0] half;
	wire [31:0] data;
	wire [31:0] toOut;
	bit16mux2 halfmux(realaddr[1],dm[addr][15:0],dm[addr][31:16],half);
	unsign_ext unsignext(half,data);
	mux2 outmux(readHalf,dm[addr],data,toOut);
	
	assign rdata=(memRead==1)?toOut:0;
	 always @(posedge clk)begin
			if(reset)begin
				for(i=0;i<=1023;i=i+1)begin
					dm[i]=0;
				end
			end
			else begin
				if(memWrite)begin
				dm[addr]=wdata;
				$display("%d@%h: *%h <= %h",$time,pcvalue, realaddr,wdata);
				end
			end
	 end
endmodule

module GRF(
	 input [31:0] pcvalue,
    input clk,
    input reset,
    input regWrite,
    input [4:0] reg1,
    input [4:0] reg2,
    input [4:0] wreg,
    input [31:0] wdata,
	 input work,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
    );
	 reg [31:0] data [31:0];
	 integer i; 
	 initial begin
			for(i=0;i<=31;i=i+1) data[i]<=0;
	 end
	always @* begin
		rdata1<=data[reg1];
		rdata2<=data[reg2];
		if(regWrite||work)begin
			if((wreg==reg1)&&(wreg!=0))
				rdata1<=wdata;
			if((wreg==reg2)&&(wreg!=0))
				rdata2<=wdata;
		end
	end
	 always @(posedge clk)begin
		if(reset)begin
			for(i=0;i<=31;i=i+1)begin
				data[i]=0;
			end
		end
			else if(regWrite||work)begin
					data[wreg] =(wreg==0)?0:wdata;
					$display("%d@%h: $%d <= %h",$time,pcvalue, wreg,wdata);
			end
	 end
	 
endmodule
