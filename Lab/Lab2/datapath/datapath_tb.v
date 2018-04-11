module datapath_tb();
	reg err_in;
	reg R0_res;
	reg R0_we;
	reg R1_res;
	reg R1_we;
	reg err_rst;
	reg Q_lr;
	reg Q_ps;
	reg Q_res;
	reg AC_res;
	reg AC_ps;
	reg AC_lr;
	reg clk;
	reg E_input;
	reg [2:0] ALU_op;
	reg [1:0] Esrc_sel;
	reg [7:0] R0_in;
	reg [1:0] R0src_sel;
	reg [7:0] R1_in;
	reg [1:0] R1src_sel;
	reg [1:0] srcA_sel;
	reg [1:0] srcB_sel;
	wire OVF;
	wire N;
	wire Z;
	wire E;
	wire ERR;
	wire Q0;
	wire R0_sign;
	wire R1_sign;
	wire [7:0] R0_out;
	wire [7:0] R1_out;
	
	datapath DUT(
	.err_in(err_in),
	.R0_res(R0_res),
	.R0_we(R0_we),
	.R1_res(R1_res),
	.R1_we(R1_we),
	.err_rst(err_rst),
	.Q_lr(Q_lr),
	.Q_ps(Q_ps),
	.Q_res(Q_res),
	.AC_res(AC_res),
	.AC_ps(AC_ps),
	.AC_lr(AC_lr),
	.clk(clk),
	.E_input(E_input),
	.ALU_op(ALU_op),
	.Esrc_sel(Esrc_sel),
	.R0_in(R0_in),
	.R0src_sel(R0src_sel),
	.R1_in(R1_in),
	.R1src_sel(R1src_sel),
	.srcA_sel(srcA_sel),
	.srcB_sel(srcB_sel),
	.OVF(OVF),
	.N(N),
	.Z(Z),
	.E(E),
	.ERR(ERR),
	.Q0(Q0),
	.R0_sign(R0_sign),
	.R1_sign(R1_sign),
	.R0_out(R0_out),
	.R1_out(R1_out)
);

	
	initial begin
	
		err_in=0;
		R0_res=0;
		R0_we=1;
		R1_res=0;
		R1_we=1;
		err_rst=0;
		Q_lr=0;
		Q_ps=0;
		Q_res=0;
		AC_res=0;
		AC_ps=0;
		AC_lr=0;
		clk=0;
	end
	
	always @* begin
			for(j=0;j<100;j=j+1) begin
				clk = clk ^ 1'b1;
				#5;
				//For now the frequency is too high but it's just for simulation
			end
	end
	always@(posedge clk) begin
		srcA_sel=
		srcB_sel=
		R0src_sel=
		R1src_sel=
		
	end
endmodule
