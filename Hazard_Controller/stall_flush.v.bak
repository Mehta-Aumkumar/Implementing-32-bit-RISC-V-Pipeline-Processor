 module stall_flush 
 	(
	input [4:0] Rs1D, Rs2D, 
	input [4:0] RdE, 
	input PCSrcE, 
	input [1:0] ResultSrcE,

	output StallF, StallD,
	output FlushD, FlushE
	);

 	wire lwStall;

 	assign lwStall = (ResultSrcE == 2'b01 ) & ((Rs1D == RdE) | (Rs2D == RdE));
 	
    assign StallF = lwStall;
    assign StallD = lwStall;

    assign FlushD = PCSrcE;
    assign FlushE = lwStall | PCSrcE;

 endmodule 