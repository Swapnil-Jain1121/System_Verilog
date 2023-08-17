class APB_bfm;

  APB_tx tx;

  task run();
    repeat (10) begin
      tx = new();
      assert (tx.randomize);
      mbox.get(tx);
    end
  endtask

endclass
