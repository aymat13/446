module shifter( input wire[31:0] rb,rc,
						input wire lr,
						output reg[31:0] ra);

		always @* begin
			case(lr)
				1'b0: ra = rb << rc;
				1'b1:	ra = rb >> rc;
			endcase
		end
		
endmodule
