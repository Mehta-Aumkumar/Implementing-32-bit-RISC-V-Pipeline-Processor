module flopr_dm (
    // Execute --> Memory  32-bit Resgisters
    input wire clk,             
    input wire reset,           

    input wire [31:0] ALUResultE, 
    output reg [31:0] ALUResultM, 
    input wire [31:0] WriteDataE, 
    output reg [31:0] WriteDataM, 
    input wire [4:0] RdE,        
    output reg [4:0] RdM,        
    input wire [31:0] PCPlus4E,   
    output reg [31:0] PCPlus4M,   
    input wire [31:0] ImmExtE,  
    output reg [31:0] ImmExtM, 
    input wire [2:0] Func3E,
    output reg [2:0] Func3M
);

    
    always @(posedge clk) begin
        if (reset) begin            
            ALUResultM  <= 32'h0;
            WriteDataM  <= 32'h0;
            RdM         <= 5'h0;
            PCPlus4M    <= 32'h0;
            ImmExtM     <= 32'h0;
            Func3M      <= 3'h0;
        end else begin
            ALUResultM  <= ALUResultE;
            WriteDataM  <= WriteDataE;
            RdM         <= RdE;
            PCPlus4M    <= PCPlus4E;
            ImmExtM     <= ImmExtE;
            Func3M      <= Func3E;
        end
    end

endmodule
