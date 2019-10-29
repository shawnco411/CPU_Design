`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:35 12/21/2017 
// Design Name: 
// Module Name:    newCopenent 
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
`define func 5:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define shamt 10:6
`define imm16 15:0
`define bit26 25:0
`define bkind 20:16

module register17(
	 input clk,
	 input clear,
	 input en,
	 input [31:0]in0,input [31:0]in1,input [31:0]in2,input [31:0]in3,
	 input [31:0]in4,input [31:0]in5,input [31:0]in6,input [31:0]in7,
	 input [31:0] in8,in9,in10,in11,in12,in13,in14,in15,in16,
    output reg [31:0]out0,output reg [31:0]out1,output reg [31:0]out2,output reg [31:0]out3,
	 output reg [31:0]out4,output reg [31:0]out5,output reg [31:0]out6,output reg [31:0]out7,
	 output reg [31:0] out8,out9,out10,out11,out12,out13,out14,out15,out16
	 );
	 initial begin
			out0<=0;out1<=0;out2<=0;out3<=0;
			out4<=0;out5<=0;out6<=0;out7<=0;
			out8<=0;out9<=0;
			out10<=0;out11<=0;out12<=0;out13<=0;out14<=0;out15<=0;out16<=0;
	 end
	 always @(posedge clk) begin
		if(clear)begin
			out0<=0;out1<=0;out2<=0;out3<=0;
			out4<=0;out5<=0;out6<=0;out7<=0;
			out8<=0;out9<=0;
			out10<=0;out11<=0;out12<=0;out13<=0;out14<=0;out15<=0;out16<=0;
		end
	   else if(en)begin
				out0<=in0;out1<=in1;out2<=in2;out3<=in3;
				out4<=in4;out5<=in5;out6<=in6;out7<=in7;
				out8<=in8;out9<=in9;
				out10<=in10;out11<=in11;out12<=in12;out13<=in13;out14<=in14;out15<=in15;out16<=in16;
		 end
		 else begin
				out0<=out0;out1<=out1;out2<=out2;out3<=out3;
				out4<=out4;out5<=out5;out6<=out6;out7<=out7;
				out8<=out8;out9<=out9;
				out10<=out10;out11<=out11;out12<=out12;out13<=out13;out14<=out14;out15<=out15;out16<=out16;
		 end
	end
endmodule

module checkInstr(
	input [31:0] instr,
	output reg cal_i,
	output reg cal_r,
	output reg load,
	output reg save,
	output reg b,
	output reg jal,
	output reg jr,
	output reg j,
	output reg zals,
	output reg zalr
	);
	parameter r_op=6'b000000;
	parameter addu_func=6'b100001;
	parameter subu_func=6'b100011;
	parameter sllv_func=6'b000100;
	parameter ori=6'b001101;
	parameter addi=6'b001000;
	parameter lw=6'b100011;
	parameter sw=6'b101011;
	parameter beq=6'b000100;
	parameter lui=6'b001111;
	parameter jalins=6'b000011;
	parameter jr_func=6'b001000;
	parameter jins=6'b000010;
	parameter bClass=6'b000001;
	parameter bgezK=5'b00001;//bkind
	parameter bgezalK=5'b10001;
	parameter mult_func=6'b011000;
	parameter zalsins=6'b111100;
	parameter seb=6'b011111;
	parameter zalrins=6'b111111;
	initial begin
		   cal_i<=0;
			cal_r<=0;
			load<=0;
			save<=0;
			b<=0;
			jal<=0;
			jr<=0;
			j<=0;
			zals<=0;
			zalr<=0;
	end
	always @(instr) begin
			cal_i<=0;
			cal_r<=0;
			load<=0;
			save<=0;
			b<=0;
			jal<=0;
			jr<=0;
			j<=0;
			zals<=0;
			zalr<=0;
			if((instr[`op]==ori)||(instr[`op]==lui)||(instr[`op]==addi)) //addi couled add/delete||(instr[`op]==lw)||(instr[`op]==sw)||(instr[`op]==beq)
				cal_i<=1;
			else if((instr[`op]==beq)||
				(instr[`op]==bClass&&
				(instr[`bkind]==bgezK||instr[`bkind]==bgezalK))) b<=1;
		   else if((instr[`op]==seb)||((instr[`op]==r_op)&&
						((instr[`func]==addu_func)
						||(instr[`func]==subu_func)
						||(instr[`func]==sllv_func)
						||(instr[`func]==mult_func))))
						cal_r<=1;		//delete||(instr[`func]==jr_func)
			else if(instr[`op]==lw) load<=1;
			else if(instr[`op]==sw) save<=1;
	
			else if(instr[`op]==jalins) jal<=1;
			else if(instr[`op]==r_op&&instr[`func]==jr_func) jr<=1;
			else if(instr[`op]==jins) j<=1;
			else if(instr[`op]==zalsins) zals<=1;
			else if(instr[`op]==zalrins) zalr<=1;
	end
endmodule


module stallmaker(
	input [31:0] instrD,instrE,instrM,
	output stall
	);
	wire cal_iD,cal_iE,cal_iM,cal_rD,cal_rE,cal_rM;
	wire loadD,loadE,loadM,saveD,saveE,saveM;
	wire bD,bE,bM,jalD,jalE,jalM;
	wire jrD,jrE,jrM,jD,jE,jM;
	wire zalsD,zalsE,zalsM;
	wire zalrD,zalrE,zalrM;
	wire stall_cal_i,stall_cal_r,stall_load,stall_save;
	wire stall_jr1,stall_jr2,stall_jr3,stall_jr4;
	wire stall_b1,stall_b2,stall_b3,stall_b4;
	wire stall_zals1,stall_zals2,stall_zals3,stall_zals4;
	wire stall_zalr1,stall_zalr2,stall_zalr3,stall_zalr4;
	/*parameter r_op=6'b000000,
				 addu_func=6'b100001,
				 subu_func=6'b100011,
				 ori=6'b001101,
				 lw=6'b100011,
				 sw=6'b101011,
				 beq=6'b000100,
				 lui=6'b001111,
				 jal=6'b000011,
				 jr_func=6'b001000,
				 j=6'b000010;*/
	checkInstr checkinstrDs(.instr(instrD),.cal_i(cal_iD),.cal_r(cal_rD),.load(loadD),
								  .save(saveD),.b(bD),.jal(jalD),.jr(jrD),.j(jD),.zals(zalsD),
								  .zalr(zalrD));
	checkInstr checkinstrEs(.instr(instrE),.cal_i(cal_iE),.cal_r(cal_rE),.load(loadE),
								  .save(saveE),.b(bE),.jal(jalE),.jr(jrE),.j(jE),.zals(zalsE),
								  .zalr(zalrE));
	checkInstr checkinstrMs(.instr(instrM),.cal_i(cal_iM),.cal_r(cal_rM),.load(loadM),
								  .save(saveM),.b(bM),.jal(jalM),.jr(jrM),.j(jM),.zals(zalsM),
								  .zalr(zalrM));
	 
	assign stall_cal_i=(instrE[`rt]!=0)&&cal_iD&&loadE&&(instrD[`rs]==instrE[`rt]);
	assign stall_cal_r=(instrE[`rt]!=0)&&cal_rD&&loadE&&(instrD[`rs]==instrE[`rt]||instrD[`rt]==instrE[`rt]);
	assign stall_load=(instrE[`rt]!=0)&&loadD&&loadE&&(instrD[`rs]==instrE[`rt]);
	assign stall_save=(instrE[`rt]!=0)&&saveD&&loadE&&(instrD[`rs]==instrE[`rt]);
	assign stall_jr1=(instrE[`rd]!=0)&&(jrD&&cal_rE&&(instrD[`rs]==instrE[`rd]));
	assign stall_jr2=(instrE[`rt]!=0)&&(jrD&&cal_iE&&(instrD[`rs]==instrE[`rt]));
	assign stall_jr3=(instrE[`rt]!=0)&&(jrD&&loadE&&(instrD[`rs]==instrE[`rt]));
	assign stall_jr4=(instrM[`rt]!=0)&&(jrD&&loadM&&(instrD[`rs]==instrM[`rt]));
	assign stall_b1=(instrE[`rd]!=0)&&((bD||zalrD)&&cal_rE&&((instrD[`rs]==instrE[`rd])||(instrD[`rt]==instrE[`rd])));
	assign stall_b2=(instrE[`rt]!=0)&&((bD||zalrD)&&cal_iE&&((instrD[`rs]==instrE[`rt])||(instrD[`rt]==instrE[`rt])));
	assign stall_b3=(instrE[`rt]!=0)&&((bD||zalrD)&&loadE&&((instrD[`rs]==instrE[`rt])||(instrD[`rt]==instrE[`rt])));
	assign stall_b4=(instrM[`rt]!=0)&&((bD||zalrD)&&loadM&&((instrD[`rs]==instrM[`rt])||(instrD[`rt]==instrM[`rt])));
	assign stall_zals1=(instrE[`rd]!=0)&&(zalsD&&cal_rE&&((instrD[`rs]==instrE[`rd])));
	assign stall_zals2=(instrE[`rt]!=0)&&(zalsD&&cal_iE&&((instrD[`rs]==instrE[`rt])));
	assign stall_zals3=(instrE[`rt]!=0)&&(zalsD&&loadE&&((instrD[`rs]==instrE[`rt])));
	assign stall_zals4=(instrM[`rt]!=0)&&(zalsD&&loadM&&((instrD[`rs]==instrM[`rt])));
	assign stall=stall_cal_i||stall_cal_r||stall_load||stall_save||stall_jr1||stall_jr2||
			 stall_jr3||stall_jr4||stall_b1||stall_b2||stall_b3||stall_b4||stall_zals1||stall_zals2
			 ||stall_zals3||stall_zals4;
endmodule 

 
 module forward( 
		input Ework,Mwork,Wwork,
		input [31:0] instrD,instrE,instrM,instrW,
		output [2:0] FRSD,FRTD,FRSE,FRTE,FRSM,FRTM
		);
		wire cal_iD,cal_iE,cal_iM,cal_iW;
		wire cal_rD,cal_rE,cal_rM,cal_rW;
		wire loadD,loadE,loadM,loadW;
		wire saveD,saveE,saveM,saveW;
		wire bD,bE,bM,bW;
		wire jalD,jalE,jalM,jalW;
		wire jrD,jrE,jrM,jrW;
		wire jD,jE,jM,jW;
		wire zalsD,zalsE,zalsM,zalsW;
		wire zalrD,zalrE,zalrM,zalrW;
		checkInstr checkinstrDf(.instr(instrD),.cal_i(cal_iD),.cal_r(cal_rD),.load(loadD),
								  .save(saveD),.b(bD),.jal(jalD),.jr(jrD),.j(jD),.zals(zalsD),
								  .zalr(zalrD));
		checkInstr checkinstrEf(.instr(instrE),.cal_i(cal_iE),.cal_r(cal_rE),.load(loadE),
								  .save(saveE),.b(bE),.jal(jalE),.jr(jrE),.j(jE),.zals(zalsE),
								  .zalr(zalrE));
		checkInstr checkinstrMf(.instr(instrM),.cal_i(cal_iM),.cal_r(cal_rM),.load(loadM),
								  .save(saveM),.b(bM),.jal(jalM),.jr(jrM),.j(jM),.zals(zalsM),
								  .zalr(zalrM));
		checkInstr checkinstrWf(.instr(instrW),.cal_i(cal_iW),.cal_r(cal_rW),.load(loadW),
								  .save(saveW),.b(bW),.jal(jalW),.jr(jrW),.j(jW),.zals(zalsW),
								  .zalr(zalrW));
		assign FRSD=((!jrD&&!bD&&!zalsD&&!zalrD)||(instrD[`rs]==0))?3'd0: //0 choose RFRD1D
				 ((jalE||zalsE)&&(instrD[`rs]==5'd31))?3'd1:				//1 choose PCE+8
				 (zalrE&&(instrD[`rs]==instrE[`rd]))?3'd1:
				 
				 (bE&&Ework&&(instrD[`rs]==5'd31))?3'd1:
				 ((cal_rM&&(instrD[`rs]==instrM[`rd]))||
				 (cal_iM&&(instrD[`rs]==instrM[`rt])))?3'd2: //2 choose AOM
				 ((jalM||zalsM)&&(instrD[`rs]==5'd31))?3'd3:				//3 choose PCM+8
				 (zalrM&&(instrD[`rs]==instrM[`rd]))?3'd3:
				 
				 (bM&&Mwork&&(instrD[`rs]==5'd31))?3'd3:									
				 ((cal_rW&&(instrD[`rs]==instrW[`rd]))||
				 (cal_iW&&(instrD[`rs]==instrW[`rt]))||
				 (loadW&&(instrD[`rs]==instrW[`rt]))|| 
				 ((jalW||zalsW)&&(instrD[`rs]==5'd31)))?3'd4: // 4 choose WdataW
				 (zalrW&&(instrD[`rs]==instrW[`rd]))?3'd4:
				 
				 (bW&&Wwork&&(instrD[`rs]==5'd31))?3'd4:
																3'd0; 
						
		assign FRTD=((!bD&&!zalrD)||(instrD[`rt]==0))?3'd0:    //0 choose RFRD2D ###(!bD)||###
				 ((jalE||zalsE)&&(instrD[`rt]==5'd31))?3'd1:		 //1 choose PCE+8
				 (zalrE&&(instrD[`rt]==instrE[`rd]))?3'd1:
				 
				 (bE&&Ework&&(instrD[`rt]==5'd31))?3'd1:
				 ((cal_rM&&(instrD[`rt]==instrM[`rd]))||
				 (cal_iM&&(instrD[`rt]==instrM[`rt])))?3'd2: //2choose AOM
				 ((jalM||zalsM)&&(instrD[`rt]==5'd31))?3'd3:				//3 choose PCM+8
				 (zalrM&&(instrD[`rt]==instrM[`rd]))?3'd3:
				 
				 (bM&&Mwork&&(instrD[`rt]==5'd31))?3'd3:									
				 ((cal_rW&&(instrD[`rt]==instrW[`rd]))||
				 (cal_iW&&(instrD[`rt]==instrW[`rt]))||
				 (loadW&&(instrD[`rt]==instrW[`rt]))|| 
				 ((jalW||zalsW)&&(instrD[`rt]==5'd31)))?3'd4: // 4 choose WdataW
				 (zalrW&&(instrD[`rt]==instrW[`rd]))?3'd4:
				 
				 (bW&&Wwork&&(instrD[`rt]==5'd31))?3'd4:
														    3'd0; 		//#the two W notnec
 
		assign FRSE=((!cal_rE&&!cal_iE&&!loadE&&!saveE)||instrE[`rs]==0)?3'd0://0 choose RFRD1E
						((cal_rM&&(instrE[`rs]==instrM[`rd]))||
						(cal_iM&&(instrE[`rs]==instrM[`rt])))?3'd1: //1 choose AOM
						((jalM||zalsM)&&(instrE[`rs]==5'd31))?3'd2:			  //2 choose PCM+8
						(zalrM&&(instrE[`rs]==instrM[`rd]))?3'd2:
						
						(bM&&Mwork&&(instrE[`rs]==5'd31))?3'd2:
						((cal_rW&&(instrE[`rs]==instrW[`rd]))||
						(cal_iW&&(instrE[`rs]==instrW[`rt]))||
						(loadW&&(instrE[`rs]==instrW[`rt]))||
						((jalW||zalsW)&&(instrE[`rs]==5'd31)))?3'd3:			 //3 choose
						(zalrW&&(instrE[`rs]==instrW[`rd]))?3'd3:
						
						(bW&&Wwork&&(instrE[`rs]==5'd31))?3'd3:
																3'd0;
		assign FRTE=((!cal_rE&&!saveE)||instrE[`rt]==0)?3'd0: //0 choose RFRD2E
						((cal_rM&&(instrE[`rt]==instrM[`rd]))||
						(cal_iM&&(instrE[`rt]==instrM[`rt])))?3'd1: //choose AOM
						((jalM||zalsM)&&(instrE[`rt]==5'd31))?3'd2:
						(zalrM&&(instrE[`rt]==instrM[`rd]))?3'd2:
						
						(bM&&Mwork&&(instrE[`rt]==5'd31))?3'd2:
						((cal_rW&&(instrE[`rt]==instrW[`rd]))||
						(cal_iW&&(instrE[`rt]==instrW[`rt]))||
						(loadW&&(instrE[`rt]==instrW[`rt]))||
						((jalW||zalsW)&&(instrE[`rt]==5'd31)))?3'd3:
						(zalrW&&(instrE[`rt]==instrW[`rd]))?3'd3:
						
						(bW&&Wwork&&(instrE[`rt]==5'd31))?3'd3:
									 							3'd0;
	   assign FRSM=3'd0;									//choose RFRD1M, no instrument involved so far #cyy
						
		assign FRTM=(!saveM||instrM[`rt]==0)?3'd0:             //0  choose RFRD2M
						((cal_rW&&(instrM[`rt]==instrW[`rd]))||
						(cal_iW&&(instrM[`rt]==instrW[`rt]))||
						(loadW&&(instrM[`rt]==instrW[`rt]))||
						((jalW||zalsW)&&(instrM[`rt]==5'd31)))?3'd1:	
						(zalrW&&(instrM[`rt]==instrW[`rd]))?3'd1:			//1 choose WdataW
						(bW&&Wwork&&(instrM[`rt]==5'd31))?3'd1:
																3'd0;
																
						

		
endmodule
