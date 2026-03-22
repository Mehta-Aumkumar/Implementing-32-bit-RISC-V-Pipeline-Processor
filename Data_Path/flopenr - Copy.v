module flopenr #(parameter WIDTH = 8)
(input clk, reset, en,   // Reset + Enable
 input [WIDTH-1:0] d,
 output reg [WIDTH-1:0] q);
 
 always@ (posedge clk or posedge reset)
     if (reset) q <= 0;
     else if (~en) q <= d;
 
endmodule

// when pipeline stalls en = 1 pipeline stage freezes.
// StallD = 1 --> EN = 0 --> Load new data
// StallD = 0 --> EN = 1 --> Hold old data