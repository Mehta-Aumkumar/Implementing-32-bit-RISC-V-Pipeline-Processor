module top_tb(

    input   clk, reset,
    output  [31:0] WriteDataM, ALUResultM,
    output  MemWriteM);
    
    wire [31:0] PCF, InsrF, ReadDataM;
    wire [2:0] Func3M;
    // instantiate processor and memories
    riscv_main rvsingle(clk, reset, ReadDataM, InsrF, PCF, MemWriteM, ALUResultM, WriteDataM, Func3M);

    imem_tb imem(PCF, InsrF);
      
    data_memory_unit mem_unit(.clk(clk), .en_write(MemWriteM), .address(ALUResultM), .store_data(WriteDataM), .Func3(Func3M),
         .load_data(ReadDataM)); 
endmodule

