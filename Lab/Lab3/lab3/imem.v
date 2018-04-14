module imem (input wire [31:0] adr,
					output wire [31:0] inst);
	reg [31:0] RAM[63:0];
	
	initial begin
		$readmemh("program.txt",RAM);
	end
	assign inst = RAM[adr[31:2]];
endmodule
