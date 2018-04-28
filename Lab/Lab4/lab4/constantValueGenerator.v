module constantValueGenerator 
	# (parameter W = 3, C = 9) (bus_out);
	
	output wire [W-1:0] bus_out;
	
	assign bus_out = C;
endmodule
