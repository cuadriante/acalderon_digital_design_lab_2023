module game_tb();
	logic clk;
	logic rst;
	logic [3:0] pushbutts;
	logic derrota;
	logic victoria;
	int arrayout [15:0];
	logic [2:0] stateout;
									 
	game utt(clk, rst, pushbutts, derrota, victoria, arrayout, stateout);
	

	initial begin
		rst = 1;
		#40
		rst = 0;
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 4; //abajo
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 4; //abajo
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 1; //derecha
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 1; //derecha
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 4; //abajo
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 2; //izquierda
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
		clk = 0;
		#40
		clk = 1; //state 1
		#40
		pushbutts = 8; //arriba
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
		clk = 0;
		#40
		clk = 1; //state 6
		#40
		clk = 0;

	
	end
endmodule

