

module game(input clk, rst, input logic [3:0] pushbutts, output derrota, victoria,output int arrayout [15:0], output logic [2:0] stateout);


logic [2:0] state, next_state;
logic revision;
logic direcciones;
logic limite;
//logic  [3:0]entradas;
int array[15:0];
int arraywork[15:0];
int irand;
int jrand;
logic randasign;


logic clk1; 
logic clk2;
logic clk3;
logic clk4;
logic check; 
logic limit_reach;
int limit;



game_manager U0(.clk1(clk1), .entradas(pushbutts), .arrayin(array), .arrayout(arraywork), .check(check));
limit_checker U1(.clk2(clk3), .limit(limit), .arrayin(array), .limit_reach(limit_reach));
loss_condition U2(.clk3(clk4), .arrayin(array), .can_play(revision));

//actual state logic
always_ff @ (posedge clk or posedge rst) begin
	if (rst) begin
		state = 3'b000;
		clk2 = 0;
		clk2 = 1;
	end else begin
		state = next_state;
		clk2 = 0;
		clk2 = 1;
	end
	stateout = state;
	
	
	
end
/*
always  @(posedge clk) begin
	
	if (pushbutts == 0) begin
		entradas = pushbutts; //El orden es de bits (más a menos significativo) es primero arriba, segundo abajo, tercero derecha, cuarto izquierda
	end
	
	

end		
*/
	
initial begin 

	for (int i=0; i<4; i = i+1) begin
		for (int j=0; j<4; j = j+1) begin
			array[4*i+j] = 0;

		end

	end
	limit = 8;
	clk4 = 0;


end
	
	
//next state logic
always @(posedge clk2) begin
		
		
		case (state)
		
			3'b000:begin
				for (int i=0; i<4; i = i+1) begin
					for (int j=0; j<4; j = j+1) begin
						array[4*i+j] = 0;
						/*
						if ((i%2 == 0) && (j%2 == 0)) begin
							array[4*i+j] = 2;
						end else if ((i%2 == 0) && (j%2 != 0)) begin
							array[4*i+j] = 1;
						end else if ((i%2 != 0) && (j%2 == 0)) begin
							array[4*i+j] = 1;
						end else if ((i%2 != 0) && (j%2 != 0)) begin
							array[4*i+j] = 2;
						end
						*/
					end

				end

				next_state = 3'b001;
				
			end
			3'b001: begin
				clk3 = 0;
				clk4 = 1;
				if(revision) begin 
					randasign = 0;
					for (int i =0; i<4; i=i+1) begin
						for (int j=0; j<4; j=j+1) begin
							if ((randasign == 0) && (array[4*i+j] == 0)) begin
								array[4*i+j] = 1;
								randasign = 1;
								
							end
							
						end
					
					end
						
						

					next_state = 3'b010; 
				end	
				
				else next_state = 3'b110; 
			end
			
			3'b010: begin 
				clk4 = 0;
				if(pushbutts != 0) next_state = 3'b011; //Revisa si hay entradas
				else next_state = 3'b010;
			end
			
			
			3'b011: begin 
				//Evalua la direccion en comparacion a los cuadrados
				clk1 = 1;
				
				if(check) next_state = 3'b100;
				else next_state = 3'b100;
				
			end
			
			3'b100: begin 
				clk1 = 0;
				for (int i =0; i<4; i=i+1) begin
					for (int j=0; j<4; j=j+1) begin
						array[4*i+j] = arraywork[4*i+j];
							
					end
					
				end
				clk3 = 1;
				//Revisa por cada cuadrado si alguno supera el limite
				if(limit_reach) next_state = 3'b101;
				else next_state = 3'b001;
			end
			
			
			3'b101: begin 
				next_state = 3'b101; //posible reinicio
			end
			
			
			3'b110: begin 
				next_state = 3'b110; //posible reinicio
			end
			
			
			default: next_state = 3'b000;
		
		endcase

end
//output logic
assign derrota = (state == 3'b101);
assign victoria = (state == 3'b110);
assign arrayout = array;		

endmodule


module loss_condition(input logic clk3, input int arrayin[15:0], output logic can_play);
	
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
				end

			end

		end
		
	end

endmodule


module limit_checker(input logic clk2, input int limit, input int arrayin[15:0], output logic limit_reach);
	always @ (posedge clk2) begin
	
		limit_reach = 0;
		for (int i=0; i<4; i = i+1) begin
			for (int j=0; j<4; j = j+1) begin
				
				if (arrayin[4*i+j] == limit) begin
					limit_reach = 1;
				
				end

			end

		end
		
	end
endmodule


module game_manager(input logic clk1, input logic[3:0] entradas, input int arrayin[15:0], output int arrayout[15:0], output logic check);

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


