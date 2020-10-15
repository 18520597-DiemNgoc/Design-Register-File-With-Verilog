module RegisterFile(Out_A, Out_B, DataIn, WE, RE_A, RE_B, WA, RA_A, RA_B, CLK );
	parameter Dwidth = 32;	// Length of Data - 32 bit
	parameter Awidth = 5;	// Length of Address
	input WE, RE_A, RE_B, CLK;	// WE: write enable, RE_A: read enable port A, RE_B: read enable port B
	input[(Awidth - 1):0] WA, RA_A, RA_B;	// WA: write address, RA_A: read address port A, RA_B: read address port B
	input[(Dwidth - 1):0] DataIn;
	output[(Dwidth - 1):0] Out_A, Out_B;
	
	reg [(Dwidth - 1):0] array_reg [((2**Awidth) - 1):0];	// 2^Awidth arrays, A array has Dwidth bit
	reg [(Dwidth - 1):0] Out_regA, Out_regB;

	assign Out_A = Out_regA;
	assign Out_B = Out_regB;
	
	always @(posedge CLK) begin
		//Write to register file		
		if(WE) array_reg[WA] <= DataIn;	
		//Read from register file
		if(RE_A) Out_regA <= array_reg[RA_A];
		else Out_regA <= 32'dz;
		
		if(RE_B) Out_regB <= array_reg[RA_B];
		else Out_regB <= 32'dz;
	end	
	
	
endmodule

