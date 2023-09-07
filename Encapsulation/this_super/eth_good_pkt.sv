class eth_good_pkt extends eth_pkt;

  //properties
  static int count_good;

  string count = "Good_Pkt_Name";

  //methods
  function new();
    count_good++;
  endfunction

  function void print(string name = "eth_good_pkt");
    super.print(name);
    $display("count_good=%0d", count_good);
    $display("this.count=%0d", this.count);
    $display("super.count=%0d", super.count);

  endfunction

  constraint pkt_type_c {pkt_type == GOOD;}


endclass
