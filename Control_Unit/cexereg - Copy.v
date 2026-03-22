module flopr_clr_cexe (
    input wire clk,      // Decode --> Execute Control Signals   
    input wire reset,       
    input wire FlushE,      

    input wire RegWriteD,   
    output reg RegWriteE,   
    input wire [1:0] ResultSrcD,  
    output reg [1:0] ResultSrcE,  
    input wire MemWriteD,   
    output reg MemWriteE,   
    input wire JumpD,       
    output reg JumpE,       
    input wire BranchD,     
    output reg BranchE,     
    input wire [3:0] ALUControlD, 
    output reg [3:0] ALUControlE, 
    input wire ALUSrcD,     
    output reg ALUSrcE,     
    input AOperandD,
    output reg AOperandE,
    input ForwardValMuxD,
    output reg ForwardValMuxE
);

    always @(posedge clk) begin
        if (reset | FlushE) begin
            RegWriteE   <= 1'b0;
            ResultSrcE  <= 2'b00;
            MemWriteE   <= 1'b0;
            JumpE       <= 1'b0;
            BranchE     <= 1'b0;
            ALUControlE <= 3'b000;
            ALUSrcE     <= 1'b0;
            AOperandE   <= 1'b0;
            ForwardValMuxE <= 1'b0;
        end else begin
            RegWriteE   <= RegWriteD;
            ResultSrcE  <= ResultSrcD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUControlE <= ALUControlD;
            ALUSrcE     <= ALUSrcD;
            AOperandE   <= AOperandD;
            ForwardValMuxE <= ForwardValMuxD;
        end
    end

endmodule
