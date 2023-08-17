`include "APB_tx.sv"
module top ();
  APB_tx tx;  //dynamic data type "tx", instantiate, memory allocation

  initial begin
    tx = new();  //memory allocation
    //size of tx = size(wr_rd) + size(addr) + size(data) + size(sel)  
    tx.randomize; //any variable that is declared rand inside APB_tx class, gets allocated to a random value
    $display("tx = %p", tx);
  end

endmodule
