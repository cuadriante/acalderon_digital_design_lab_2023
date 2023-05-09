module game_tb();
	logic clk, clk_monitor;
	logic rst;
	logic [3:0] pushbutts;
	logic derrota;
	logic victoria;
	logic counter;
	int arrayout [15:0];
	logic [2:0] stateout;
	logic [6:0] d0;
	logic [6:0] d1;
	logic [6:0] d2;
	logic [6:0] d3;
	logic [6:0] d4;
	logic [7:0] r, g, b;
	logic H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK, clk_25;
	logic randasign;	
	game utt(clk, clk_monitor, rst, pushbutts, counter, derrota, victoria,stateout, d0, d1, d2, d3, d4, r,g,b,clk_25, H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK );
	

	initial begin
		counter = 0;
		rst = 1;
		#40
		rst = 0;
		pushbutts = 1; //derecha
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		clk = 0;
		#40
		clk = 1; //state 2
		#40
		clk = 0;
		#40
		clk = 1; //state 3
		#40
		clk = 0;
		#40
		clk = 1; //state 4
		pushbutts = 4; //abajo
		#40
		clk = 0;
		#40
		clk = 1; //state 0
		#40
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		clk = 0;
		#40
		clk = 1; //state 2
		#40
		clk = 0;
		#40
		clk = 1; //state 3
		#40
		clk = 0;
		#40
		clk = 1; //state 4
		#40
		pushbutts = 1; //derecha
		clk = 0;
		#40
		clk = 1; //state 0
		#40
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		clk = 0;
		
	end
endmodule

