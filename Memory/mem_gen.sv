class mem_gen;
  mem_tx tx;

  task run();
    //write to a location
    tx = new();
    tx.randomize() with {
      wr_rd_i == 1;
    };
    mem_common::mem2bfm.put(tx);

    //read from location
    tx = new();
    tx.randomize() with {
      wr_rd_i == 0;
    };
    mem_common::mem2bfm.put(tx);
  endtask


endclass
