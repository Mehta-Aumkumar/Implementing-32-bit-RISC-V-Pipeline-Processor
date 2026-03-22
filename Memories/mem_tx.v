module mem_transmitter (
	input [31:0] store_data,
	input [1:0] Addr2Lsb,
	input [2:0] Func3,

	output reg [3:0] w_mask, //4 bits for each byte
	output reg [31:0] mem_wdata
	);

	wire mem_byte_access = (Func3[1:0] == 2'b00);
	wire mem_half_access = (Func3[1:0] == 2'b01);

	always @(*) begin	
		if(mem_byte_access) 
			case (Addr2Lsb) 
				2'b00: w_mask = 4'b0001; 
				2'b01: w_mask = 4'b0010;
				2'b10: w_mask = 4'b0100;
				2'b11: w_mask = 4'b1000;
			endcase	
		else
		if(mem_half_access)	
			if(Addr2Lsb[1] == 0) w_mask = 4'b0011; 
			else 			     w_mask = 4'b1100;
		else w_mask = 4'b1111; 
	end	

	always @(*) begin
    if (mem_byte_access)
        mem_wdata = store_data << (8 * Addr2Lsb);
    else if (mem_half_access)
        mem_wdata = store_data << (16 * Addr2Lsb[1]);
    else
        mem_wdata = store_data;
end
endmodule
