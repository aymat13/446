module TB_vga_driver ();

	wire r,g,b,hs,vs;
	reg clk_50;
	
vga_driver DUT (clk_50,hs,vs,r,g,b);

initial begin

	clk_50 = 0;
	
end

integer j;

always @* begin
	clk_50 = 0; #5; clk_50 = 1; #5;
end

endmodule
