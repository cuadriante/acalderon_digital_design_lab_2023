
module PCLogic(input logic [3:0] Rd, input logic branch, regW, output logic pcs);

	assign pcs = ((Rd == 15)&(regW))| branch;

endmodule 