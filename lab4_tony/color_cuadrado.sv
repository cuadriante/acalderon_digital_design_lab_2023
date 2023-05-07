module color_cuadrado(input int valueAt, output logic [23:0] out_mux);
	
	always @ (*) begin
		if (valueAt == 0) begin
					
			out_mux <= 24'b000000000000000000000000;
		end else if (valueAt == 1) begin
			
			out_mux <= 24'b111011101111111100010110;
			
		end else if (valueAt == 2) begin
			out_mux <= 24'b111100011011010000010011;
			
		end else if (valueAt == 4) begin
			out_mux <= 24'b111100010011010100010011;
		
		end else if (valueAt == 8) begin
			out_mux <= 24'b111100010011010100010011;
		
		end else if (valueAt == 16) begin
			out_mux <= 24'b000100111111000111110001;
			
		end else if (valueAt == 32) begin
			out_mux <= 24'b000100111111000111110001;
		
		end else if (valueAt == 64) begin
			out_mux <= 24'b000100111111000111110001;
		
		end else if (valueAt == 128) begin
			out_mux <= 24'b 000100111000001011110001;
			
		end else if (valueAt == 256) begin
			out_mux <= 24'b 000100111000001011110001;
			
		end else if (valueAt == 512) begin
			out_mux <= 24'b011111010010011010101111;
			
		end else if (valueAt == 1024) begin
			out_mux <= 24'b110010000100100010110111;
			
		end else if (valueAt == 2048) begin
			out_mux <= 24'b111111110000000011001101;
		end else begin
			out_mux <= 24'b000000000000000000000000;
			
		end 
	end
	
endmodule