class gen_bfm;
mem_tx tx;
virtual mem_intf vif;
  //but i dont want a dedicated memory allocation  here ? how do we ensure it ? by keeping it as virtual

  function new();
    vif = top.pif //vif = mem_common::vif; both are same
//     this mem_bfm.vif is pointing to the pif declared in the top module
//     mem_bfm.addr_i = 100 we do
//     that will reflect in top.pif.addr_i
//     whichever component is reffering to this interface handle,will see that addr_i update
//     THIS IS HOW WE ARE ABLE TO CONNECT tb WITH DUT
  endfunction

  task run();
    forever begin
        mem_common::gen2bfm.get(tx);
        drive_tx(tx);
    end
  endtask

  task drive_tx(mem_tx tx); //can be read or write
    @(posedge vif.clk_i);
    vif.addr_i = tx.addr;
    if(vif.wr_rd==1) vif.wdata_i= tx.data;
    vif.wr_rd_i = tx.wr_rd;
    vif.valid_i=1;
    wait (vif.ready_o == 1);
    @posedge (vif.clk_i);
    top.reset_inputs();
    // vif.addr_i = 0;
    // vif.wdata_i = 0;
    // vif.wr_rd_i = 0;
    // vif.valid_i = 0;
  endtask
endclass

