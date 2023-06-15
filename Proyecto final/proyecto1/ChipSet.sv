module ChipSet (input logic [17:0] addr,output logic [1:0] select,output logic [16:0] out_addr);


	logic [17:0] addr_assign;
	
	always @(*) begin
		
		if(addr >= 0 && addr < 18'd65535) begin
		
			select <= 2'b00;
			addr_assign <= addr;
		
		end else if(addr >= 18'd65535 && addr < 18'd131072) begin
			select <= 2'b01;
			addr_assign <= addr-18'd65535;
		
		end
		
	end

	assign out_addr = addr_assign;
	
endmodule

