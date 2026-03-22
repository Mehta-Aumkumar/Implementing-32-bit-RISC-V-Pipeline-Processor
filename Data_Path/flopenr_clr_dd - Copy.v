module flopenr_clr_dd (
	// Fetch --> Decode 32-bit Registers
    input wire clk,             // 1. Clock
    input wire reset,           // 2. Asynchronous Reset (Active High)
    input wire stallD,          // 3. Clock Enable (Active LOW load/stall)
    input wire FlushD,          // 4. Synchronous Clear/Flush (Active HIGH NOP)

    input wire [31:0] InstrF,   
    output reg [31:0] InstrD,   
    input wire [31:0] PCF,      
    output reg [31:0] PCD,      
    input wire [31:0] PCPlus4F, 
    output reg [31:0] PCPlus4D  
);

    always @(posedge clk or posedge reset) begin
        if (reset | FlushD) begin
            // Asynchronous Reset Clear all outputs
            InstrD      <= 32'h00000000; 
            PCD         <= 32'h00000000;
            PCPlus4D    <= 32'h00000000;
        end else if (!stallD) begin
            // Synchronous Load (Active LOW Enable): Load new data
            // When stallD is LOW, the pipeline moves forward.
            InstrD      <= InstrF;
            PCD         <= PCF;
            PCPlus4D    <= PCPlus4F;
        end
        // If (reset is low) AND (FlushD is low) AND (stallD is HIGH), 
        // the register holds its current value (STALL).
    end

endmodule
