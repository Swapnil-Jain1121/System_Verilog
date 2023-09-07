class eth_ill_pkt extends eth_pkt;

  //properties
  static int count_ill;

  //methods
  function new();
    count_ill++;
  endfunction

  function void print(string name = "eth_ill_pkt");
    super.print(name);
    $display("count_ill=%0d", count_ill);
  endfunction

  constraint pkt_type_c {pkt_type == ILL;}
endclass
