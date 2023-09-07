class APB_tx;
  //properties of the class
  rand bit wr_rd;
  rand bit [7:0] addr;
  rand bit [31:0] data;
  rand bit [3:0] sel;

  //methods
  function void print(string name = "APB_tx");
    $display("printing APB tx %s fields", name);
    $display("\twr_rd = %0b", wr_rd);
    $display("\taddr = %0h", addr);
    $display("\tdata = %0h", data);
    $display("\tsel = %0b\n", sel);
  endfunction

  function bit compare(APB_tx tx);

    if (addr == tx.addr && data == tx.data && wr_rd == tx.wr_rd && sel == tx.sel) begin
      $display("tx fields are matching");
      return 1;
    end else begin
      $display("tx fields are mismatching");
      return 0;
    end
  endfunction

  //constraints
  constraint sel_c {sel inside {4'b0001, 4'b0010, 4'b0100, 4'b1000, 4'b0000};}

endclass


module top ();
  APB_tx tx_1;
  APB_tx tx_2;
  APB_tx tx_3;
  APB_tx tx_4;

  initial begin
    tx_1 = new();
    tx_2 = new();
    tx_3 = new();
    tx_4 = new();

    assert (tx_1.randomize());
    assert (tx_2.randomize());
    assert (tx_3.randomize());
    assert (tx_4.randomize());

    //comparing tx1 with tx2
    tx_1.compare(tx_2);
    tx_1.print("tx_1");
    tx_2.print("tx_1");

    //comparing tx3 with tx4
    tx_3.compare(tx_4);
    tx_3.print("tx_3");
    tx_4.print("tx_4");

  end

endmodule
