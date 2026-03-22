module control_unit(
    input clk, reset,
    input [6:0] op,
    input [2:0] funct3, func3E,
    input funct7,
    input Zero,
    input FlushE,
    
    output PCSrcE,
    output RegWriteM, RegWriteW,
    output [1:0] ResultSrcE, ResultSrcW,
    output MemWriteM,
    output [3:0] ALUControlE, 
    output ALUSrcE,
    output [2:0] ImmSrcD,
    output AOperandE,
    output ForwardValMuxM
    );
    
    wire [1:0] funct7b5;

    wire RegWriteD, RegWriteE;
    wire [1:0] ResultSrcD, ResultSrcM;
    wire MemWriteD, MemWriteE;
    wire JumpD, JumpE;
    wire BranchD, BranchE;
    wire [3:0] ALUControlD;
    wire ALUSrcD;
    wire [1:0] ALUOp;
    wire AOperandD;
    wire ForwardValMuxD, ForwardValMuxE;
    
    assign funct7b5 = {funct7, op[5]};
    
    main_decoder maindec(op, ResultSrcD, MemWriteD, BranchD, ALUSrcD, RegWriteD, JumpD, ImmSrcD, ALUOp, AOperandD, ForwardValMuxD);
    
    alu_decoder aludec(funct3, funct7b5, ALUOp, ALUControlD);

    Branch_Control Branch_con (BranchE, JumpE, Zero, func3E, PCSrcE);

    //Execute cycle reg
    flopr_clr_cexe cexereg(clk, reset, FlushE, RegWriteD, RegWriteE, ResultSrcD, ResultSrcE ,MemWriteD, MemWriteE, JumpD, JumpE,BranchD, BranchE, 
            ALUControlD, ALUControlE, ALUSrcD, ALUSrcE, AOperandD, AOperandE, ForwardValMuxD, ForwardValMuxE);
    //Memory cycle reg
    flopr_cmem cmemreg (clk, reset, RegWriteE, RegWriteM, ResultSrcE, ResultSrcM, MemWriteE, MemWriteM, ForwardValMuxE,
            ForwardValMuxM);
    //Write Back cycle reg
    flopr_cwb cwbreg (clk, reset, RegWriteM, RegWriteW, ResultSrcM, ResultSrcW);

endmodule
