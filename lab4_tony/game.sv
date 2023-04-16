

module game(input clk, rst, input logic [3:0] pushbutts, output derrota, victoria);

logic [2:0] state, next_state;
logic revision;
logic direcciones;
logic limite;
logic [3:0] entradas;

//actual state logic
always_ff @ (posedge clk or posedge rst)
	if (rst) state = 3'b000;
	else
		state = next_state;
		
		


		

//next state logic
always @ (*)
		case (state)
			3'b000: begin
				revision = 1'b1; //revisar si hay condición de juego
				if(revision) next_state = 3'b001; 
				else next_state = 3'b101; 
			end
			3'b001: begin 
				entradas = 1'b1; //Evalua si hay entradas
				if(entradas) next_state = 3'b010;
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