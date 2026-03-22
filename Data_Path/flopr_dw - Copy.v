module flopr_dw (
	//Memory --> Writeback 32-bit Registers
    input wire clk,             
    input wire reset,           

    input wire [31:0] ALUResultM, 
    output reg [31:0] ALUResultW, 
    input wire [31:0] ReadDataM,  
    output reg [31:0] ReadDataW,  
    input wire [4:0] RdM,         
    output reg [4:0] RdW,         
    input wire [31:0] PCPlus4M,   
    output reg [31:0] PCPlus4W,   
    input wire [31:0] ImmExtM,  
    output reg [31:0] ImmExtW
);
	
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ALUResultW  <= 32'h0;
            ReadDataW   <= 32'h0;
            RdW         <= 5'h0;
            PCPlus4W    <= 32'h0;
            ImmExtW     <= 32'h0;
        end else begin            
            ALUResultW  <= ALUResultM;
            ReadDataW   <= ReadDataM;
            RdW         <= RdM;
            PCPlus4W    <= PCPlus4M;
            ImmExtW     <= ImmExtM;
        end
    end

endmodule
