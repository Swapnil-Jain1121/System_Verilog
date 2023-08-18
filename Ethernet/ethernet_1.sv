class eth_pkt;

  //properties
  bit [55:0] preamble;
  bit [7:0] sof;
  rand bit [47:0] da;
  rand bit [47:0] sa;
  rand bit [15:0] len;
  rand bit [7:0] payload[$];  //queue of octets
  bit [31:0] crc;  //random but generated based on payload 


  //methods

  function new();  //you cant make constraint of the variable which are not of rand type, 
                   //so we are making function here
    preamble = {28{2'b10}};
    sof = 8'b1010_1011;
  endfunction

  function void print(string name = "eth_pkt");
    $display("printing %s fields", name);
    $display("\tpreamble = %0h", preamble);
    $display("\tsof = %0h", sof);
    $display("\tda = %0h", da);
    $display("\tsa = %0h", sa);
    $display("\tlen = %0d", len);
    foreach (payload[i]) $display("\tpayload[%0d] = %0h", i, payload[i]);
    $display("\tcrc = %0h", crc);
  endfunction

  //constraints
  constraint len_c {len inside {[42 : 1500]};}
  constraint payload_c {payload.size() == len;}
endclass

module top ();

  eth_pkt pkt = new();

  initial begin
    pkt.print("pkt with new");
    // new();
    pkt.randomize();
    pkt.print("pkt after randomizing");

  end

endmodule
