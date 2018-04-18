module imem (input wire [31:0] adr,
					output wire [31:0] inst);
	reg [31:0] RAM[63:0];
	
	initial begin
		$readmemh("C:/Users/AhmetSalih/Documents/GitHub/446/Lab/Lab3/lab3/program.txt",RAM);
	end
	assign inst = RAM[adr[31:2]];
endmodule
