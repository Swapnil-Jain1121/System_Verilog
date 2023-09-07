class eth_pkt;

  //properties
  static int count;
  rand bit [9:0] len;
  rand bit [7:0] payload[$];
  //   rand bit [1:0] pkt_type;
  rand pkt_type_t pkt_type;

  //methods
  function new();
    count++;
  endfunction

  virtual function void print(string name = "eth_pkt");
    $display("printing %s fields", name);
    $display("count = %0d", count);
    $display("len = %0d", len);
    $display("payload = %p", payload);
  endfunction

  //constraints
  constraint len_c {len inside {[15 : 25]};}
  constraint payload_c {payload.size() == len;}

endclass
