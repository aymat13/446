module shifter( input wire[7:0] rd,
						input wire [2:0] sh,
						output reg[7:0] ra);

		always @* begin
			case(sh)
				3'b000: ra = {rd[6:0],rd[7]};		 //ROL
				3'b001: ra = {rd[0],rd[7:1]};		 //ROR
				3'b010: ra = rd << 1; 				 //LSL
				3'b011: ra = {rd[7],rd[7:1]};		 //ASR
				3'b100: ra = rd >> 1; 				 //LSR
				3'b111: ra = rd; //NO SHIFT
				default: ra = rd;
			endcase
		end
		
endmodule
