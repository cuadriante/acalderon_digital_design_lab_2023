

module game(input clk, clk_monitor, rst, input logic [3:0] pushbutts, input logic counter, output derrota, victoria, output logic [2:0] stateout, 
output logic [6:0] d0, output logic [6:0] d1, output logic [6:0] d2, output logic [6:0] d3, output logic [6:0] d4, output logic  [7:0]r,g,b, output logic clk_25,
				output  logic H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK);


logic [2:0] state, next_state;
logic revision;
logic direcciones;
logic limite;
//logic  [3:0]entradas;
int array[15:0];
int arraywork[15:0];
int arrayassig[15:0];
//int arrayout[15:0];
int irand;
int jrand;
logic randasign;
logic assig_work;

logic clk1; 
logic clk2;
logic clk3;
logic clk4;
logic clk5;
logic clk6;
logic check; 
logic limit_reach;
int limit; // RECORDAR QUE EL LIMITE DEBE SER INPUT

int numberj[3:0];
int numberi;
int count;
int i_new;
int j_new;

logic [9:0] cuentaX,cuentaY;

game_manager U0(.clk1(clk1), .entradas(pushbutts), .arrayin(array), .arrayout(arraywork), .check(check));
limit_checker U1(.clk2(clk3), .limit(limit), .arrayin(arraywork), .limit_reach(limit_reach));
loss_condition U2(.clk3(clk4), .arrayin(arraywork),.can_play(revision));
//new_nums_assign U3(.arrayin(arraywork), .clk5(clk5), .can_play(revision), .arrayout(arrayassig));
new_nums_assign U3(.arrayin(arraywork), .clk5(clk5), .i_new(i_new), .j_new(j_new));

display_interface D0(.numberI(array[3]), .disp(d0));
display_interface D1(.numberI(array[2]), .disp(d1));
display_interface D2(.numberI(array[1]), .disp(d2));
display_interface D3(.numberI(array[0]), .disp(d3));

//--------------Instancia del divisor de clock-------------------------//
	
	divisorClock DV(clk_monitor,clk_25);

//--------------Instancia del controlador VGA--------------------------//		
	
	controladorVGA CNTVGA(clk_25,H_SYNC,V_SYNC,SYNC_B,SYNC_BLANK, cuentaX,cuentaY);
	
	
	videocontroller VC(clk_25, victoria, derrota, array,
							  cuentaX,cuentaY, 
							  r,g,b);

//actual state logic
always_ff @ (posedge clk or posedge rst) begin
	if (rst) begin
		state = 3'b000;
	end else begin
		state = next_state;
	end
	//stateout = state;
	
	
	
end



/*
always  @(posedge clk) begin
	
	if (pushbutts == 0) begin
		entradas = pushbutts; //El orden es de bits (más a menos significativo) es primero arriba, segundo abajo, tercero izquierda, cuarto derecha
	end
	
	

end		
*/




initial begin 

	for (int i=0; i<4; i = i+1) begin
		for (int j=0; j<4; j = j+1) begin
			arraywork[4*i+j] = 0;

		end

	end;
	limit = 8;
	count = 0;

end



always @(posedge clk6) begin


	//array = arrayassig;
	for (int i =0; i<4; i=i+1) begin
		for (int j=0; j<4; j=j+1) begin
			if ((i==i_new) && (j==j_new)) begin
				array[4*i+j] = 2;
				
			end else if ((arraywork[4*i+j] == 0)) begin
			
				array[4*i+j] = 0;
				
			end else if (arraywork[4*i+j] == 2) begin
			
				array[4*i+j] = 2;
				
			end else if (arraywork[4*i+j] == 4) begin
				array[4*i+j] = 4;
				
			end else if (arraywork[4*i+j] == 8) begin
				array[4*i+j] = 8;
				
			end else if (arraywork[4*i+j] == 16) begin
				array[4*i+j] = 16;
				
			end else if (arraywork[4*i+j] == 32) begin
				array[4*i+j] = 32;
				
			end else if (arraywork[4*i+j] == 64) begin
				array[4*i+j] = 64;
				
			end else if (arraywork[4*i+j] == 128) begin
				array[4*i+j] = 128;
				
			end else if (arraywork[4*i+j] == 256) begin
				array[4*i+j] = 256;
				
			end else if (arraywork[4*i+j] == 512) begin
				array[4*i+j] = 512;
				
			end else if (arraywork[4*i+j] == 1024) begin
				array[4*i+j] = 1024;
				
			end else if (arraywork[4*i+j] == 2048) begin
				array[4*i+j] = 2048;
				
			end else begin
				array[4*i+j] = 0;
			end
			
			 
			
		end
	
	end
	
	
end

//next state logic
always_comb begin
		
		
		case (state)
			/*
			3'b000:begin
				for (int i=0; i<4; i = i+1) begin
					for (int j=0; j<4; j = j+1) begin
						array[4*i+j] = 0;
						
						if ((i%2 == 0) && (j%2 == 0)) begin
							array[4*i+j] = 2;
						end else if ((i%2 == 0) && (j%2 != 0)) begin
							array[4*i+j] = 1;
						end else if ((i%2 != 0) && (j%2 == 0)) begin
							array[4*i+j] = 1;
						end else if ((i%2 != 0) && (j%2 != 0)) begin
							array[4*i+j] = 2;
						end
						
					end

				end

				next_state = 3'b001;
				
			end*/
			
			3'b000: begin
				if(revision) begin 

					next_state = 3'b001; 
				end	
				
				else next_state = 3'b110; 
			end
			
			3'b001: begin
				/*
				array = arraywork;

				randasign = 0;
				for (int i =0; i<4; i=i+1) begin
					for (int j=0; j<4; j=j+1) begin
						if ((randasign == 0) && (array[4*i+j] == 0)) begin
							array[4*i+j] = 2;
							randasign = 1;
						end
					
					end
			
				end
				*/
				
				next_state = 3'b010;
			end
			
			3'b010: begin 
				
				if(pushbutts != 4'b0000) next_state = 3'b011; //Revisa si hay entradas
				else next_state = 3'b010;
			end
			
			
			3'b011: begin 
				//Evalua la direccion en comparacion a los cuadrados
				if(check) next_state = 3'b100;
				else next_state = 3'b100;
				
			end
			
			3'b100: begin 
				//Revisa por cada cuadrado si alguno supera el limite
				if(limit_reach) next_state = 3'b110;
				else next_state = 3'b000;
			end
			
			
			3'b101: begin 
				next_state = 3'b101; //posible reinicio
			end
			
			
			3'b110: begin 
				next_state = 3'b110; //posible reinicio
			end
			
			
			default: begin 
				next_state = 3'b000;
			end
		
		endcase

end
//output logic
assign derrota = (state == 3'b101);
assign victoria = (state == 3'b110);
assign clk3 = (state == 3'b100);
assign clk4 = (state == 3'b000);
assign clk1 = (state == 3'b011);
assign clk5 = (state == 3'b001);
assign clk6 = (state == 3'b010);
//assign arrayout = array;
assign stateout = state;		
endmodule


module loss_condition(input logic clk3, input int arrayin[15:0], output logic can_play);
	logic randasign;
	always @ (posedge clk3) begin
		can_play = 0;
		for (int i=0; i<4; i = i+1) begin
			for (int j=0; j<4; j = j+1) begin
				
				if (i-1 > -1) begin
					if ((arrayin[(4*i)-1+j] == 0) || (arrayin[(4*i)-1+j] == arrayin[4*i+j])) begin
						can_play = 1;
					end
				end else if (j-1 > -1) begin 
					if ((arrayin[4*i+(j-1)] == 0) || (arrayin[4*i+(j-1)] == arrayin[4*i+j])) begin
						can_play = 1;
					end
				end else if (i+1 < 4) begin
					if ((arrayin[(4*i)+1+j] == 0) || (arrayin[(4*i)+1+j] == arrayin[4*i+j])) begin
						can_play = 1;
					end
				end else if (j+1 < 4) begin
					if ((arrayin[4*i+(j+1)] == 0) || (arrayin[4*i+(j+1)] == arrayin[4*i+j])) begin
						can_play = 1;
					end
				end else if (arrayin[i][j] == 0) begin
					can_play = 1;
				end

			end

		end
	end

endmodule


module new_nums_assign(input int arrayin[15:0], input logic clk5, output int i_new, output int j_new);
	
	
	always @(posedge clk5) begin
		//logic randas;
		//randas = 0;
		//if (can_play) begin
		for (int i =3; i>-1; i=i-1) begin
			for (int j=3; j>-1; j=j-1) begin
				if (arrayin[4*i+j] == 0) begin
					i_new = i;
					j_new = j;
					//randas = 1;
						
				end 
				
			end
		
		end
		//end
	
	end

endmodule


module limit_checker(input logic clk2, input int limit, input int arrayin[15:0], output logic limit_reach);
	logic randasign;
	always @ (posedge clk2) begin
	
		limit_reach = 0;
		for (int i=0; i<4; i = i+1) begin
			for (int j=0; j<4; j = j+1) begin
				
				if (arrayin[4*i+j] == limit) begin
					limit_reach = 1;
				
				end

			end

		end
		
		/*
		arrayout = arrayin;
		randasign = 0;
		for (int i =0; i<4; i=i+1) begin
			for (int j=0; j<4; j=j+1) begin
				if ((randasign == 0) && (arrayin[4*i+j] == 0)) begin
					arrayout[4*i+j] = 2;
					randasign = 1;
				end
			
			end
	
		end
		*/
		
	end
endmodule


module game_manager(input logic clk1, input logic[3:0] entradas, input int arrayin[15:0],output int arrayout[15:0], output logic check);

	int restante;
	logic continue_check;
	int current_value;
	int last_i;
	int last_j;
	int var_new;
	logic local_check;
	int array[15:0];
	int arraywork[15:0];
	
	
	

	
	always @ (posedge clk1) begin
		
		
		check = 0;
		array = arrayin;
		arraywork = array;
		
		for (int i=0; i<4; i=i+1) begin 

			for (int j=0; j<4; j=j+1) begin
				
				continue_check = 1;
				local_check = 0;
				
				if (array[4*i+j] != 0) begin
					
					//Revisa arriba
					if (entradas == 4'b1000) begin
						last_i = i;
						last_j = j;
						restante = i-1;
						if (restante > 0) begin
							for (int x=3; x>-1; x=x-1) begin
								if (x <= restante) begin
									if ((array[4*i+j] == array[4*x+j]) && (continue_check == 1) && (array[4*i+j] != 0)) begin
										check = 1;
										arraywork[4*i+j] = 0;
										arraywork[4*x+j] = 2*array[4*x+j];
										array[4*x+j] = 0;
										array[4*i+j] = 0;
										continue_check = 0;
									
									end 
									else if ((continue_check == 1) && (array[4*x+j] != array[4*i+j]) && (array[4*x+j] != 0)) begin
										continue_check = 0;
										arraywork[4*x+j] = array[4*x+j];
										
									end else if ((continue_check == 1) && (arraywork[4*x+j] == 0)) begin
										last_i = x;
										local_check = 1;
										arraywork[4*x+j] = array[4*x+j];
										
									end else begin
										arraywork[4*x+j] = array[4*x+j];
										
									end
								end else begin
									arraywork[4*x+j] = array[4*x+j];
									
								end
							end
						end
					
					end
					//Revisa abajo
					if (entradas == 4'b0100) begin
						last_i = i;
						last_j = j;
						restante = i+1;
						if (restante < 3) begin
							for (int x=0; x<4; x=x+1) begin
								if (x >= restante) begin
									if ((array[4*i+j] == array[4*x+j]) && (continue_check == 1) && (array[4*i+j] != 0)) begin
										check = 1;
										arraywork[4*i+j] = 0;
										arraywork[4*x+j] = 2*array[4*x+j];
										array[4*x+j] = 0;
										array[4*i+j] = 0;
										continue_check = 0;
									
									end else if ((continue_check == 1) && (array[4*x+j] != array[4*i+j]) && (array[4*x+j] != 0)) begin
										continue_check = 0;
										arraywork[4*x+j] = array[4*x+j];
									
									end else if ((continue_check == 1) && (array[4*x+j] == 0)) begin
										last_i = x;
										local_check = 1;
										arraywork[4*x+j] = array[4*x+j];
										
									end else begin 
										arraywork[4*x+j] = array[4*x+j];
										
									end
								end else begin
									arraywork[4*x+j] = array[4*x+j];
								end
							end
						end
					
					end
					//Revisa izquierda
					if (entradas == 4'b0010) begin
						last_i = i;
						last_j = j;
						restante = j-1;
						if (restante >0) begin
							for (int x=3; x>-1; x=x-1) begin
								if (x <= restante) begin
									if ((array[4*i+j] == array[4*i+x])&& (continue_check == 1) && (array[4*i+j] != 0)) begin
										check = 1;
										arraywork[4*i+j] = 0;
										arraywork[4*i+x] = 2*array[4*i+x];
										array[4*i+x] = 0;
										array[4*i+j] = 0;
										continue_check = 0;
									
									end else if ((continue_check == 1) && (array[4*i+x] != array[4*i+j]) && (array[4*i+x] != 0)) begin
										continue_check = 0;
										arraywork[4*i+x] = array[4*i+x];
									
									end else if ((continue_check == 1) && (array[4*i+x] == 0)) begin
										arraywork[4*i+x] = array[4*i+x];
										last_j = x;
										local_check = 1;
									end else begin 
										arraywork[4*i+x] = array[4*i+x];
										
									end
								end else begin
									arraywork[4*i+x] = array[4*i+x];
								end
							end
						end
					
					end
					
					//Revisa derecha
					if (entradas == 4'b0001) begin
						last_i = i;
						last_j = j;
						restante = j+1;
						if (restante < 3) begin
							for (int x=0; x<4; x=x+1) begin
								if (x >= restante) begin
									if ((array[4*i+j] == array[4*i+x]) && (continue_check == 1) && (array[4*i+j] != 0)) begin
										check = 1;
										arraywork[4*i+j] = 0;
										arraywork[4*i+x] = 2*array[4*i+x];
										array[4*i+x] = 0;
										array[4*i+j] = 0;
										continue_check = 0;
									
									end else if ((continue_check == 1) && (array[4*i+x] != array[4*i+j]) && (array[4*i+x] != 0)) begin
										continue_check = 0;
										arraywork[4*i+x] = array[4*i+x];
										
									end else if ((continue_check == 1) && (array[4*i+x] == 0)) begin
										arraywork[4*i+x] = array[4*i+x];
										last_j = x;
										local_check = 1;
										
									end else begin
										arraywork[4*i+x] = array[4*i+x];
									end
								end else begin
									arraywork[4*i+x] = array[4*i+x];
								end
							
							end
							
						end
					
					end
					
					if (local_check == 1) begin //local check

						var_new = array[4*i+j];
						arraywork[4*i+j] = 0;
						arraywork[4*last_i+last_j] = var_new;
						
					end
				
				end
				
			end
		
		end
	end
	
	
	
	
	assign arrayout = arraywork;
		
endmodule


module display_interface(input logic [3:0] numberI, output logic[6:0] disp);
	
	logic [3:0] answerp ;
	
	
	always @(*) begin
	
		case (numberI)
			0 :      	//Hexadecimal 0
			disp = 7'b0000001; 
			1 :    		//Hexadecimal 1
			disp = 7'b1001111  ; 
			2:  		// Hexadecimal 2
			disp = 7'b0010010 ; 
			3 : 		// Hexadecimal 3
			disp = 7'b0000110 ; 
			4 :		// Hexadecimal 4
			disp = 7'b1001100 ; 
			5 :		// Hexadecimal 5
			disp = 7'b0100100 ;  
			6 :		// Hexadecimal 6
			disp = 7'b0100000 ; 
			7 :		// Hexadecimal 7
			disp = 7'b0001111; 
			8 :     		 //Hexadecimal 8
			disp = 7'b0000000;
			9 :    		//Hexadecimal 9
			disp = 7'b0000100 ; 
			10 :  		// Hexadecimal A
			disp = 7'b0001000 ; 
			11 : 		// Hexadecimal B
			disp = 7'b1100000;
			12 :		// Hexadecimal C
			disp = 7'b0110001 ;  
			13 :		// Hexadecimal D
			disp = 7'b1000010 ;  
			14:		// Hexadecimal E
			disp = 7'b0110000 ; 
			15 :		// Hexadecimal F
			disp = 7'b0111000 ; 
			default:
			disp = 7'b0000000 ; 
		endcase
	
	end

endmodule
