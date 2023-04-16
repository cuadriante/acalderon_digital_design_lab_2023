module 2048 (input btnDown, btnUp, btnLeft, 
									   btnRight, clk, rst, start,
										output pts, [N*N:0] mtx);

	// parametros
	localparam 
	SIZE = 16,
	WIN_CONDITION = 2048;
	NEW_VALUE = 2;
	logic [1:0] WON = 0;
	logic [1:0] LOST = 0;
	
	// estados
	localparam
	I = 3'b001, // inicio/reset
	L = 3'b010, // derrota
	W = 3'b011, // victoria
	MOVE = 3'b100, // mover hacia un lado
	MERGE = 3'b101, // combinar celdas
	END = 3'b110, // fin del juego
	CONT = 3'b111; // continua el juego
 
 //NxN grid
 
 rand int MTX[SIZE];

// L : check game over
	
	 for(i=0; i<SIZE; i= i+1) 
		begin
			if (MTX[i] != 0)
				begin
					WON <= 1;
					LOST <= 0;
					//state <= L;
				end 
		end	

// W : check win

	
	 for(i=0; i<SIZE; i= i+1) 
		begin
			if (MTX[i] == WIN_CONDITION)
				begin
					WON <= 0;
					LOST <= 1;
					//state <= W;
				end 
		end	

// I : reset 

always @ (posedge clk, posedge rst)
	begin
		if (rst)
			begin
				state <= I;
					 for(i=0; i<SIZE; i= i+1) 
							begin
								MTX[i] <= 0;
							end	
			end 
		else 
			begin
				case (state)
				I:
					begin
						for(i=0; i<SIZE; i= i+1) 
							begin
								MTX[i] <= 0;
							end	
						if (start) // crea bloque random inicial
							begin
								state <= CONT;
							end
					end
				CONT:
					begin
						pos = $urandom & 15; // aqui falta verificar que no exista algo en el bloque
						if (WON||LOST)
							begin
								state <= END;
							end
						else 
							begin
								MTX[pos] = NEW_VALUE;
								state <= MOVE;
							end
					end
				MOVE:
					begin
					// chequear si se combinan
						state <= MERGE;
					// si no state <= CONT 
					end 
				MERGE:
					// momento magico 
					state <= CONT;
				END: 
					state <= I;
			end
	end
	


endmodule 