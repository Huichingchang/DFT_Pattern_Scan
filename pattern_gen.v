module pattern_gen(
	input wire clk,
	input wire rst,
	output reg [3:0] pattern
);

	always @(posedge clk or posedge rst) begin
		if(rst) 
			pattern <= 4'b0000;
		else
			pattern <= pattern + 1;
	end
endmodule
	