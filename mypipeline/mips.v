`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:50:00 12/03/2017 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 wire [31:0] higher;//for get10_6
    //for register8s
	 wire [31:0] pc4F,pc4D,pc4E,pc4M,pc4W;
	 wire [31:0] instrF,instrD,instrE,instrM,instrW;
	 wire [31:0] pcvalueF,pcvalueD,pcvalueE,pcvalueM,pcvalueW;
	 wire [31:0] rdata1D,rdata1E,rdata1M,rdata1W;
	 wire [31:0] rdata2D,rdata2E,rdata2M,rdata2W;
	 wire [31:0] AOE,AOM,AOW;
	 wire [31:0] extD,extE,extM;
	 wire [31:0] rdataM,rdataW;
	 wire [31:0] wdataW;
	 wire [4:0] wregW;

	 
	 //for controler
	 wire [1:0] RegDst;
    wire [1:0] ALUSrc;
    wire [2:0] MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire [3:0] operation;
	 wire [2:0] pcsrc;
	 wire readHalf;
	 wire extWay;
	 wire Ework,Mwork,Wwork;
	 wire [1:0] subBsrc;
	//for IFU
	 wire [31:0] npc;
	 wire [31:0] pcvalue; 
	 wire [31:0] pc4;
	 //for ext
	 wire [31:0] signext;
	 wire [31:0] unsignext;
	 //wire [31:0] bsignextE,bsignextM,bsignextW;
	 //for GPF
	  wire [4:0] wreg;
    wire [31:0] wdata;
    wire [31:0] rdata1;
    wire [31:0] rdata2;
	 wire [31:0] result;
	 //for sub
	 wire [31:0] subB;
	 wire [31:0] a_b;
	 //for ALU
	 wire [1:0] ALUSrcA;
	 wire [31:0] A;
	 wire [31:0] B;
	 wire [31:0] loE,loM,loW;
	 wire [31:0] hiE,hiM,hiW;
	 //for dmAddr
	  wire [9:0]dmAddr;
	  //for rDM
	  wire [31:0] rdata; 
	  //for hazard
	  wire stall;
	  wire [2:0] frsd,frtd,frse,frte,frsm,frtm;
	  wire [31:0] oRSD,oRTD,oRSE,oRTE,oRSM,oRTM;
	  
	  //####################begin real stuff#############################
	  //............IF.................
	 IFU ifu(.clk(clk),.reset(reset),.en(!stall),.pcsrc(pcsrc),.npc(npc),.ir(instrF),.pc4(pc4F),.pcvalue(pcvalueF));
									//stall:keep PC(en)
	 
	 //.............ID................
    register17 IF_ID(.clk(clk),.clear(reset),.en(!stall),.in0(pcvalueF),.out0(pcvalueD),.in1(pc4F),.out1(pc4D),
							 .in2(instrF),.out2(instrD));//stall:freeze IF/ID(en)	
	 controler controlD(.op(instrD[31:26]),.func(instrD[5:0]),.bkind(instrD[20:16]),.pcsrc(pcsrc),.extWay(extWay),
							  .subBsrc(subBsrc) );
	
	 sign_ext signextend(instrD[15:0],signext);
	 
	 unsign_ext unsignextend(instrD[15:0],unsignext);
	 
	 mux2 extMux(.s0(extWay),.m0(signext),.m1(unsignext),.out(extD));
	 
	 mux4 subBmux(.select(subBsrc),.m0(oRTD),.m1(32'b0),.out(subB));
	 
	 sub compare(.a(oRSD),.b(subB),.a_b(a_b));
	 
	 newpc npcmaker(.ir(instrD),.pc4(pc4D),.a_b(a_b),.sra(oRSD),.oRTD(oRTD),.pcsrc(pcsrc),.npc(npc));
	 
	 GRF GRF(.pcvalue(pcvalueW),.clk(clk),.reset(reset),.regWrite(RegWrite),.reg1(instrD[25:21]),.reg2(instrD[20:16]),
						.wreg(wregW),.wdata(wdataW),.rdata1(rdata1D),.rdata2(rdata2D),.work(Wwork));
	 
	 
	 //.............EX.................
	 register17 ID_EX(.clk(clk),.clear(stall||reset),.en(1'b1),.in0(pcvalueD),.out0(pcvalueE),.in1(pc4D),.out1(pc4E),
							   .in2(instrD),.out2(instrE),.in3(extD),.out3(extE),.in4(oRSD),.out4(rdata1E),
								.in5(oRTD),.out5(rdata2E));  //stall:clear ID/EX(clear)
	 controler controlE(.op(instrE[31:26]),.func(instrE[5:0]),.bkind(instrE[20:16]),.ALUSrc(ALUSrc),.ALUSrcA(ALUSrcA),
								.rdata1(oRSE),.rdata2(oRTE),.operation(operation),.work(Ework));
	 mux4 muxAluA(.select(ALUSrcA),.m0(oRSE),.m1(32'd16),.out(A)); //16 for lui
	 mux4 muxAluB(.select(ALUSrc),.m0(oRTE),.m1(extE),.out(B));
	 ALU alu(.A(A),.B(B),.operation(operation),.result(AOE),.lo(loE),.hi(hiE));
	 
	 /*Bsign_ext byteSignext(.in(oRTE[7:0]),.out(bsignextE));*/
	 
	 //..............MEM..................
	 register17 EX_MEM(.clk(clk),.clear(reset),.en(1'b1),.in0(pcvalueE),.out0(pcvalueM),.in1(pc4E),.out1(pc4M),
							 .in2(instrE),.out2(instrM),.in3(oRSE),.out3(rdata1M),.in4(oRTE),.out4(rdata2M),
							 .in5(AOE),.out5(AOM),.in7(loE),.out7(loM),.in8(hiE),.out8(hiM));//.in6(bsignextE),.out6(bsignextM),
	 controler controlM(.op(instrM[31:26]),.func(instrM[5:0]),.bkind(instrM[20:16]),
								.rdata1(oRSM),.rdata2(oRTM),.MemRead(MemRead),
								.MemWrite(MemWrite),.readHalf(readHalf),.work(Mwork));
	 AlutoDmAddr getdmAddr(AOM,dmAddr);
	 
	 DM dm(clk,reset,MemRead,MemWrite,dmAddr,oRTM,pcvalueM,AOM,readHalf,rdataM);
	 
	 //...............WB.......................
	 register17 MEM_WB(.clk(clk),.clear(reset),.en(1'b1),.in0(pcvalueM),.out0(pcvalueW),.in1(pc4M),.out1(pc4W),
							 .in2(instrM),.out2(instrW),.in3(oRSM),.out3(rdata1W),.in4(oRTM),.out4(rdata2W),
							 .in5(rdataM),.out5(rdataW),.in6(AOM),.out6(AOW),
							 .in8(loM),.out8(loW),.in9(hiM),.out9(hiW));//.in7(bsignextM),.out7(bsignextW),
	 controler controlW(.op(instrW[31:26]),.func(instrW[5:0]),.RegDst(RegDst),.bkind(instrW[20:16]),
								.rdata1(rdata1W),.rdata2(rdata2W),.MemtoReg(MemtoReg),.RegWrite(RegWrite),.work(Wwork)
								); 
	 mux8 wdatamux(.select(MemtoReg),.m0(AOW),.m1(rdataW),.m2(pcvalueW+8),.out(wdataW));//.m3(bsignextW),
	 bit5mux4 wregmux(.select(RegDst),.m0(instrW[`rt]),.m1(instrW[`rd]),.m2(5'd31),.out(wregW));
	 
	 //..................hazard................
	 forward forward(.instrD(instrD),.instrE(instrE),.instrM(instrM),.instrW(instrW),.FRSD(frsd),.FRTD(frtd),
							.Ework(Ework),.Mwork(Mwork),.Wwork(Wwork),
							.FRSE(frse),.FRTE(frte),.FRSM(frsm),.FRTM(frtm));
	 stallmaker stallmaker(.instrD(instrD),.instrE(instrE),.instrM(instrM),.stall(stall));  //two row wdataWnotnec
	 mux8 MFRSD(.select(frsd),.m0(rdata1D),.m1(pcvalueE+8),.m2(AOM),.m3(pcvalueM+8),.m4(wdataW),.out(oRSD)); //.m4(wdataW),deleted
	 mux8 MFRTD(.select(frtd),.m0(rdata2D),.m1(pcvalueE+8),.m2(AOM),.m3(pcvalueM+8),.m4(wdataW),.out(oRTD));//.m4(wdataW),deleted
	 mux8 MFRSE(.select(frse),.m0(rdata1E),.m1(AOM),.m2(pcvalueM+8),.m3(wdataW),.out(oRSE));
	 mux8 MFRTE(.select(frte),.m0(rdata2E),.m1(AOM),.m2(pcvalueM+8),.m3(wdataW),.out(oRTE));
	 mux8 MFRSM(.select(frsm),.m0(rdata1M),.m1(wdataW),.out(oRSM));
	 mux8 MFRTM(.select(frtm),.m0(rdata2M),.m1(wdataW),.out(oRTM));
	 
	 
	 
	 

endmodule
