module top_pattern_scan(
	input wire clk,
	input wire rst,
	input wire scan_enable,
	input wire scan_in,
	output wire [3:0] q,
	output wire [3:0] pattern
);

	//測試向量產生器
	pattern_gen u_gen(
		.clk(clk),
		.rst(rst),
		.pattern(pattern)
	);
	
	//Scan Chain (使用測試向量 pattern 當作輸入)
	scan_chain u_chain(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.scan_in(scan_in),
		.d(pattern),
		.q(q)
	);
endmodule