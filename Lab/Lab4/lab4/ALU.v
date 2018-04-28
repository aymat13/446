module ALU
	#(parameter W = 5) (SrcA, SrcB, Control, Result, CO, OVF, N, Z);
	
	//W-bit Inputs
	input wire [W-1:0] SrcA, SrcB;
	//3 bit Control Signal
	input [2:0] Control;
	//N-bit Result
	output reg [W-1:0] Result;
	//Status Flags
	output reg CO, OVF, N, Z;

	reg [W-1:0] temp_add;
	
	
	always @(*) begin
		case(Control)
			3'b000: begin //Addition
						{CO,Result} = {1'b0,SrcA} + {1'b0,SrcB};
						if((SrcA[W-1] == SrcB[W-1]) && (Result[W-1]!=SrcA[W-1])) OVF=1'b1;
						else OVF=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						N = N & (~OVF); //When OVF=1 N should be 0
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
			end//End of Addition case
			3'b001: begin //SubtractionAB
						{CO,Result} = {1'b0,SrcA} - {1'b0,SrcB};
						if((SrcA[W-1] == ~SrcB[W-1]) && (Result[W-1]!=SrcA[W-1])) OVF=1'b1;
						else OVF=1'b0;
						//If Result is a different sign then the inputs then overflow.
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						N = N & (~OVF); //When OVF=1 N should be 0
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
			end // End of SubtractionAB
			3'b010: begin //SubtractionBA
						{CO,Result} = {1'b0,SrcB} - {1'b0,SrcA};
						if((~SrcA[W-1] == SrcB[W-1]) && (Result[W-1]!=SrcB[W-1])) OVF=1'b1;
						else OVF=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						N = N & (~OVF); //When OVF=1 N should be 0
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
			end // End of SubtractionBA
			3'b011: begin //BitClear
						Result = SrcA & (~SrcB);
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						CO=1'b0;
						OVF=1'b0;
			end//End of BitClear
			3'b100: begin //AND
						Result = SrcA & SrcB;
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						CO=1'b0;
						OVF=1'b0;
			end // End of AND
			3'b101: begin //OR
						Result = SrcA | SrcB;
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						CO=1'b0;
						OVF=1'b0;
			end // End of OR
			3'b110: begin //EXOR
						Result = SrcA ^ SrcB;
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						CO=1'b0;
						OVF=1'b0;
			end //End of EXOR
			3'b111: begin //EXNOR
						Result = ~(SrcA ^ SrcB);
						if(Result == 0) Z=1'b1;
						else Z=1'b0;
						if(Result[W-1] == 1'b1) N=1'b1;
						else N=1'b0; //Negative flag
						CO=1'b0;
						OVF=1'b0;
			end //End of EXNOR
			endcase
	end
	
endmodule
