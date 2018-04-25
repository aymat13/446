module extend (input wire [11:0] Instr,
					output reg [31:0] ExtImm);

	always @* begin
		ExtImm = {20'b0,Instr[11:0]};//12 bit unsigned imm
	end
endmodule
