class eth_env;
  mailbox gen2bfm = new();
  eth_bfm bfm = new(gen2bfm);
  eth_gen gen = new(gen2bfm);

  task run(string testcase, int count);
    fork
      bfm.run();  //bfm dont need testcase and count
      gen.run(testcase, count);
    join
  endtask

endclass
