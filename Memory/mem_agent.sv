class mem_agent;
  mem_gen gen = new();
  mem_bfm bfm = new();

  task run();
    fork
      bfm.run();
      gen.run();
    join
  endtask
endclass
