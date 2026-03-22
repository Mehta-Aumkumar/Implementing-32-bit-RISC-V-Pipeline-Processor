 module stall_flush (
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
 
 // Stall --> lw instruction 
 // Flush --> Branch instruction
 
 
 // stall is done by turning off the enable to flop so turn off the enalbe when we want to stop the flush will handle 
 // by providing synchronous reset call that clear when we have to flush we assert that clear signal and that will put zeros 
 // into the registers and cause the instruction to do nothing because we turn off the right enalbles.