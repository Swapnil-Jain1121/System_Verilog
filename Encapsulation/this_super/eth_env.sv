class eth_env;

  eth_bfm bfm = new();
  eth_gen gen = new();

  task run();
    fork
      bfm.run();
      gen.run();
    join
  endtask

endclass
