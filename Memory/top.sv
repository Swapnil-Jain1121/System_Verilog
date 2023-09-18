module top ();

  //declare clock and rest signals
  reg clk, rst;

  initial begin
    common::vif = pif;  //assiging pif handle to vif in mem_common
  end

  //clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  //tp=10ns
  end

  task reset_inputs();
    pif.addr_i  = 0;
    pif.wdata_i = 0;
    pif.wr_rd_i = 0;
    pif.valid_i = 0;
  endtask

  //rst logic, apply,hold, and release
  initial begin
    rst = 0;  //pressing rst

    //make all design inputs zero during rst
    reset_inputs();
    //what about desgin outputs? design will do this
    repeat (2) @(posedge clk_i);  //holding rst for 2 clock cycles 
    //enoough time for design to rst
    // #20;  //holding rst
    rst = 1;  //releasing rst

    //create env, run env
    env = new();
    env.run();  //starting the environment
  end

  //Interface
  mem_intf pif (
      clk,
      rst
  );  //this is where memory is getting allocated

  //DUT instantiation
  memory dut (
      .clk_i  (pif.clk_i),
      .rst_i  (pif.rst_i),
      .addr_i (pif.addr_i),
      .wdata_i(pif.wdata_i),
      .rdata_o(pif.rdata_o),
      .wr_rd_i(pif.wr_rd_i),
      .valid_i(pif.valid_i),
      .ready_o(pif.ready_o)
  );

  //Environment class
  mem_env env ();

  //logic to end the simulation
  initial begin
    #1000;
    $finish;
  end
endmodule
