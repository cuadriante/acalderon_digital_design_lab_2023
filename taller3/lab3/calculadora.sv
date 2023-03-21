module calculadora#(parameter N=4)(input [N-1:0] a, b,input boton, rst, output [N-1:0] resultado,
 output [3:0] operacion, output zero, neg, carr);

	logic [3:0] op_aux;
	counter cont(boton, rst, op_aux);
	alu calcu(a, b, op_aux, resultado, zero, neg, carr);
	assign operacion = op_aux;
	
endmodule 