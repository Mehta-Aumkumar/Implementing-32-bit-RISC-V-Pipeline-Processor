module flopr_clr #(parameter WIDTH = 8)
(input clk, reset, clr,				// Reset + Clr
 input [WIDTH-1:0] d,
 output reg [WIDTH-1:0] q);
 
 always@ (posedge clk or posedge reset)
     if (reset | clr) q <= 0;
     else q <= d;
 
endmodule

