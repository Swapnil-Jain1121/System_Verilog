class APB_tx;
  //properties of the class
  rand bit wr_rd;
  rand bit [7:0] addr;
  rand bit [31:0] data;
  rand bit [3:0] sel;

  //methods
  function void print();
    $display("printing APB tx fields");
    $display("\twr_rd = %0b", wr_rd);
    $display("\taddr = %0h", addr);
    $display("\tdata = %0h", data);
    $display("\tsel = %0b\n", sel);
  endfunction

  //constraints
  constraint sel_c {sel inside {4'b0001, 4'b0010, 4'b0100, 4'b1000, 4'b0000};}
  constraint sel_c_1 {sel inside {4'b1111};}
  ;

endclass


module top ();
  APB_tx tx;  //dynamic data type "tx", instantiate, memory allocation

  initial begin
    tx = new();  //memory allocation
    tx.print();
    assert (tx.randomize);  //randomize returns 1 on success, and 0 on failure
    tx.print();
  end

endmodule
