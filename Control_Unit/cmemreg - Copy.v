module flopr_cmem (
    input wire clk,          // Execute --> Memory Control Signals
    input wire reset,      
    input wire RegWriteE,  
    output reg RegWriteM,  
    input wire [1:0] ResultSrcE,  
    output reg [1:0] ResultSrcM,  
    input wire MemWriteE,  
    output reg MemWriteM,    
    input ForwardValMuxE,
    output reg ForwardValMuxM
);

    always @(posedge clk) begin
        if (reset) begin
            RegWriteM   <= 1'b0;
            ResultSrcM  <= 2'b00;
            MemWriteM   <= 1'b0;
            ForwardValMuxM <= 1'b0;
        end else begin
            RegWriteM   <= RegWriteE;
            ResultSrcM  <= ResultSrcE;
            MemWriteM   <= MemWriteE;
            ForwardValMuxM <= ForwardValMuxE;
        end
    end

endmodule
