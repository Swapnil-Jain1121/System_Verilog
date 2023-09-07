class eth_bad_pkt extends eth_pkt;

  //properties
  static int count_bad;

  //methods
  function new();
    count_bad++;
  endfunction

  function void print(string name = "eth_bad_pkt");
    super.print(name);
    $display("count_bad=%0d", count_bad);
  endfunction

  constraint pkt_type_c {pkt_type == BAD;}

endclass
