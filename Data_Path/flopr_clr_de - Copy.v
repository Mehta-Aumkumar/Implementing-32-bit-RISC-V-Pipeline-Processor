module flopr_clr_de (
	// Decode --> Execute 32-bit registers
    input wire clk,             
    input wire reset,           
    input wire FlushE,          // Synchronous Clock Enable (Active High load)
    input wire [31:0] RD1D,    
    output reg [31:0] RD1E,    
    input wire [31:0] RD2D,     
    output reg [31:0] RD2E,     
    input wire [31:0] PCD,      
    output reg [31:0] PCE,      
    input wire [4:0] Rs1D,      
    output reg [4:0] Rs1E,      
    input wire [4:0] Rs2D,      
    output reg [4:0] Rs2E,      
    input wire [4:0] RdD,       
    output reg [4:0] RdE,    
    input wire [31:0] ImmExtD, 
    output reg [31:0] ImmExtE, 
    input wire [31:0] PCPlus4D, 
    output reg [31:0] PCPlus4E, 
    input wire [2:0] Func3D,
    output reg [2:0] Func3E
);

    
    always @(posedge clk) begin
        if (reset | FlushE) begin
            RD1E        <= 32'h0;
            RD2E        <= 32'h0;
            PCE         <= 32'h0;
            Rs1E        <= 5'h0;
            Rs2E        <= 5'h0;
            RdE         <= 5'h0;
            ImmExtE     <= 32'h0;
            Func3E      <= 3'h0;
        end else begin
            RD1E        <= RD1D;
            RD2E        <= RD2D;
            PCE         <= PCD;
            Rs1E        <= Rs1D;
            Rs2E        <= Rs2D;
            RdE         <= RdD;
            ImmExtE     <= ImmExtD;
            PCPlus4E    <= PCPlus4D;
            Func3E      <= Func3D;
        end
        // If (reset is low) AND (FlushE is low), the register holds its current value (stalls).
    end

endmodule
