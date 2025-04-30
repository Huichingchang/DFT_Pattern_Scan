`timescale 1ns/1ps
module tb_top_pattern_scan;

	//宣告測試用變數
	reg clk;
	reg rst;
	reg scan_enable;
	wire [3:0] q;
	
	//實例化待測模組
	top_pattern_scan uut(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_enable),
		.q(q)
	);
	
	//時脈產生:10ns週期(50MHz)
	always #5 clk = ~clk;
	
	initial begin
		//初始設定
		clk = 0;
		rst =1;
		scan_enable =0;
		
		//重置保持一段時間
		#20 rst =0;
		
		//===正常模式運作3個clock=======
		scan_enable =0;
		#30;
		
		//===回到正常模式===
		scan_enable =1;
		#40;
		
		$stop;
	end
endmodule