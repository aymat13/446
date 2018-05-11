module TB_datapath_lab4 begin();
	reg	PCWrite;
	reg	clk;
	reg	IRWrite;
	reg	LRWrite;
	reg	reset;
	reg	AddrSrc;
	reg	RegWrite;
	reg	ALUSrcA;
	reg	[2:0] ALUControl;
	reg	[1:0] ALUSrcB;
	reg	[1:0] PCSrc;
	reg	[15:0] ReadData;
	reg	[1:0] RegSrc;
	reg	[1:0] ResultSrc;
	reg	[2:0] sh;
	wire	[7:0] addr;
	wire	[3:0] Flags;
	wire	[15:0] Instr;
	wire	[7:0] LR_data;
	wire	[7:0] write_data;
	
	datapath DUT(PCWrite,clk,IRWrite,LRWrite,reset,AddrSrc,RegWrite,ALUSrcA,
						ALUControl,ALUSrcB,PCSrc,ReadData,RegSrc,ResultSrc,sh,addr,Flags,Instr,
						LR_data,write_data);
						
	initial begin
		clk = 0;
		reset = 0; #22; reset = 1;
	end
	
	always @* begin
		clk=1; #5; clk=0; #5;
	end
	
	always @*(posedge clk) begin
		
	end
endmodule
