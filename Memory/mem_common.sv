class common;  //keeping all the common things in a TB, which will be shared by TB

  static virtual mem_intf vif;  //naming as vif to indication it as virtual interface handle 

  static mailbox gen2bfm = new();

endclass
