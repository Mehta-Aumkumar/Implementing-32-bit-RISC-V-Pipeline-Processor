module flopenr_clr #(parameter WIDTH = 8)
(input clk, reset, en, clr,   // Reset + Enable + Clr
 input [WIDTH-1:0] d,
 output reg [WIDTH-1:0] q);
 
 always@ (posedge clk or posedge reset)
     if (reset | clr) q <= 0;
     else if (~en) q <= d;
 
endmodule

