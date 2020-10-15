`timescale 1ns/1ns

module TestBench(); 
  parameter Dwidth = 32;
  parameter Awidth = 5;
  parameter t = 20;
  reg WE_tb, RE_A_tb, RE_B_tb, CLK_tb;
  reg [(Awidth - 1):0] WA_tb, RA_A_tb, RA_B_tb;
  reg [(Dwidth - 1):0] DataIn_tb;

  wire [(Dwidth - 1):0] Out_A_tb, Out_B_tb;

  initial begin
	CLK_tb = 0;
	WE_tb = 1;
	RE_B_tb = 1;
	RE_A_tb = 0;
	// write data to register file and read Out_B[1] = 30
	#t WA_tb = 5'd0; DataIn_tb = 32'd20; RA_B_tb = 5'd1; // A[0] = 20; Out_B[1] = z
	#t WA_tb = 5'd1; DataIn_tb = 32'd30; // A[1] = 30; Out_B[1] = 0;
	#t WA_tb = 5'd2; DataIn_tb = 32'd40; // A[2] = 40; Out_B[1] = 30
	#t WA_tb = 5'd3; DataIn_tb = 32'd50; // A[3] = 50
	#t WA_tb = 5'd4; DataIn_tb = 32'd60; // A[4] = 60
	#t WA_tb = 5'd5; DataIn_tb = 32'd70; // A[5] = 70
	// read out_A and out_B
	#t RE_A_tb = 1; RA_A_tb = 5'd0; // Out_A[0] = 20, Out_B[1] = 30
	#t RA_A_tb = 5'd1; RA_B_tb = 5'd7; //Out_A[1] = 30, Out_B[7] = x;
	#t RA_A_tb = 5'd2; RE_B_tb = 0; RA_B_tb = 5'd8; //Out_A[2] = 40, Out_B[8] = z;
	#t RA_A_tb = 5'd3; RA_B_tb = 5'd9; //Out_A[3] = 50, Out_B[9] = z;
	#t RA_A_tb = 5'd4; RE_B_tb = 1; RA_B_tb = 5'd0; //Out_A[4] = 60, Out_B[0] = 20
	#t RA_A_tb = 5'd5; RA_B_tb = 5'd1; //Out_A[5] = 70, Out_B[1] = 30;
	#t RA_A_tb = 5'd6; RA_B_tb = 5'd2; //Out_A[6] = x, Out_B[2] = 40;
	#t $finish;
     
  end
  
  always @(CLK_tb)
    #10 CLK_tb <= ~CLK_tb;
  
  RegisterFile DUT(.Out_A(Out_A_tb), .Out_B(Out_B_tb), .DataIn(DataIn_tb), .WE(WE_tb), .RE_A(RE_A_tb), .RE_B(RE_B_tb), .WA(WA_tb), .RA_A(RA_A_tb), .RA_B(RA_B_tb), .CLK(CLK_tb) );
  
endmodule

    
    
    
