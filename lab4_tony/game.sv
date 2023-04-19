

module game(input clk, rst, input logic [3:0] pushbutts, output derrota, victoria);


logic [2:0] state, next_state;
logic revision;
logic direcciones;
logic limite;
logic [3:0] entradas;
int array[15:0][15:0];
int irand;
int jrand;
logic randasign;


//actual state logic
always_ff @ (posedge clk or posedge rst)
	if (rst) state = 3'b000;
	else
		state = next_state;
		
		

always @ (pushbutts)
	if (pushbutts == 4'b0000) begin
		entradas = pushbutts; //El orden es de bits (más a menos significativo) es primero arriba, segundo abajo, tercero derecha, cuarto izquierda
	end  
	

		

//next state logic
always @ (*)
		case (state)
			3'b000: begin
				revision = 1'b1; //revisar si hay condición de juego
				if(revision) begin 
					randasign = 0;
					irand = 0;
					jrand = 0;
					for (int i =0; i<15; i=i+1) begin
						for (int j=0; j<15; j=j+1) begin
							
							if ((array[i][j] == 0) && (randasign == 0)) begin
								randasign = 1;
								array[i][j] = 1;
							end
							
						end
					
					end
						
						

					next_state = 3'b001; 
				end	
				
				else next_state = 3'b101; 
			end
			3'b001: begin 
				if(entradas != 4'b0000) next_state = 3'b010; //Revisa si hay entradas
				else next_state = 3'b001;
			end
			3'b010: begin 
				direcciones = 1'b1; //Evalua la direccion en comparacion a los cuadrados
				if(direcciones) next_state = 3'b011;
				else next_state = 3'b000;
			end
			
			3'b011: begin 
				limite = 1'b1; //Revisa por cada cuadrado si alguno supera el limite
				if(limite) next_state = 3'b100;
				else next_state = 3'b000;
			end
			3'b100: begin 
				next_state = 3'b100; //posible reinicio
			end
			3'b101: begin 
				next_state = 3'b101; //posible reinicio
			end
			default: next_state = 3'b000;
		endcase

//output logic
assign derrota = (state == 3'b101);
assign victoria = (state == 3'b11);		

endmodule



module direction_check(input int arrayin[15:0][15:0], input logic [3:0] direction, output int arrayout[15:0][15:0], output logic check);
	
	
	int restante;
	assign check = 0;
	int arraywork[15:0][15:0];
	assign arraywork = arrayin;
	always @(*)
	for (int i = 0; i <15; i=i+1) begin 
		
		for (int j=0; j<15; j=j+1) begin
			
			//Revisa arriba
			if (direction == 4'b1000) begin
				restante = i-1;
				if (restante >0) begin
					for (int x=restante; x>-1; x=x-1) begin
					
						if (arraywork[i][j] == arraywork[x][j]) begin
							check = 1;
							arraywork[i][j] = 0;
							arraywork[x][j] = 2*arraywork[x][j];
						
						end 
							
					end
				end
			
			end
			//Revisa abajo
			if (direction == 4'b0100) begin
				restante = i+1;
				if (restante < 15) begin
					for (int x=restante; x<15; x=x+1) begin
					
						if (arraywork[i][j] == arraywork[x][j]) begin
							check = 1;
							arraywork[i][j] = 0;
							arraywork[x][j] = 2*arraywork[x][j];
						
						end 
						
					end
				end
			
			end
			//Revisa derecha
			if (direction == 4'b0010) begin
				restante = j-1;
				if (restante >0) begin
					for (int x=restante; x>-1; x=x-1) begin
					
						if (arraywork[i][j] == arraywork[i][x]) begin
							check = 1;
							arraywork[i][j] = 0;
							arraywork[i][x] = 2*arraywork[x][j];
						
						end 
							
					end
				end
			
			end
			//Revisa izquierda
			if (direction == 4'b0001) begin
				restante = j+1;
				if (restante < 15) begin
					for (int x=restante; x<15; x=x+1) begin
					
						if (arraywork[i][j] == arraywork[i][x]) begin
							check = 1;
							arraywork[i][j] = 0;
							arraywork[i][x] = 2*arraywork[x][j];
						
						end 
						
					end
				end
			
			end
		
		end
		
	end
	assign arrayout = arraywork;


endmodule 