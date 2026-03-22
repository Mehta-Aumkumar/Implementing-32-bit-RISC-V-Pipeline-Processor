module flopr_cwb (
    input wire clk,          // Memory --> Writeback Control Signals	
    input wire reset,       
    input wire RegWriteM,   
    output reg RegWriteW,   
    input wire [1:0] ResultSrcM,  
    output reg [1:0] ResultSrcW   
);
     
    always @(posedge clk) begin
        if (reset) begin
            RegWriteW   <= 1'b0;
            ResultSrcW  <= 2'b00;
        end else begin
            RegWriteW   <= RegWriteM;
            ResultSrcW  <= ResultSrcM;
        end
    end	

endmodule
