module vga_driver (clk_50,hs,vs,r,g,b);

input wire clk_50; //50MHz input clock
output reg hs,vs;
output reg [7:0] r,g,b; //Outputs


reg clk_v = 0;
reg clk = 0;
reg [9:0] counter_clk = 0;
reg [9:0] counter_v = 0;
reg [9:0] counter_H = 0;
reg v_sync_ready = 0;
reg h_sync_ready = 0;

reg [17:0] count_ram = 0;
reg [7:0] temp_reg;

//clk is assumed to be 25Mhz
//We need a 25MHz clock for horizontal sync signals
//and 1/32MHz clock for vertical sync signals
//clk_H ticks 400 times before clk_V changes its value.
//clk_H is directly used as clk.

reg [7:0] ram [307199:0];

initial begin
	r = 0;
	g = 0;
	b = 0;
	hs = 1'b1;
	vs = 1'b1;
	$readmemh("C:/Users/aymat/Documents/GitHub/446/ismail/hex.txt", ram);
end

always @(posedge clk_50) begin
	clk = clk ^ 1'b1;
end

always @(posedge clk) begin //clk_V Generator Process
	if(counter_clk == 800) begin
		clk_v = clk_v ^ 1'b1; //clk_V changes its value
		counter_clk = 0; //Reset counter_clk
	end
	counter_clk = counter_clk + 1;
end

always @(posedge clk_v) begin //Vertical Sync Signal Process
	if(counter_v < 2) begin //V-sync signal begins
		vs = 0;
	end
	else if(counter_v == 2) begin  //End of v-sync
		vs = 1;
	end 
	else if(counter_v == 35) begin //Back Porch(V)
		v_sync_ready = 1;
	end
	else if(counter_v == 515) begin //Video Signal(One Frame)
		v_sync_ready = 0;
	end
	else if(counter_v > 524) begin //Front Porch(V)
		vs = 1;
		counter_v = 600; //Stop counter from incrementing and overflowing.
	end
	counter_v = counter_v + 1;	
end

always @(posedge clk) begin //Horizontal Sync Signal Process
	if(v_sync_ready) begin
		if(counter_H<96) begin //H-sync
			hs = 0;
		end
		else if(counter_H == 96) begin //End of h-sync
			hs = 1;
		end
		else if(counter_H == 144) begin //Back Porch(H)
			h_sync_ready = 1;
		end
		else if(counter_H == 784) begin //Video Signal(One Line)
			h_sync_ready = 0;
		end
		else if(counter_H == 800) begin //Front Porch(H)
			counter_H = 0;
		end
		
		if(counter_H < 800)
			counter_H = counter_H + 1;
	end 
	else begin
		h_sync_ready = 0;
	end
end

always @(posedge clk) begin //RGB Transmission Process
	if(h_sync_ready) begin
		temp_reg = ram[count_ram];
		r = temp_reg;
		g = temp_reg;
		b = temp_reg;
		count_ram = count_ram + 1;
		
	end
end
endmodule
