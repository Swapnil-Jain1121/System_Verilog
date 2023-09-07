class eth_good_pkt extends eth_pkt;

  //properties
  static int count_good;

  //methods
  function new();
    count_good++;
  endfunction

  function void print(string name = "eth_good_pkt");
    super.print(name);
    $display("count_good=%0d", count_good);
  endfunction

  constraint pkt_type_c {pkt_type == GOOD;}


endclass
