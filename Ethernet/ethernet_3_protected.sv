class eth_pkt;

  //properties
  local bit [55:0] preamble;  /*making it local so that it cant be update/viewed/modified 
  outside this class*/
  local bit [7:0] sof;
  rand protected bit [47:0] da;
  rand protected bit [47:0] sa;
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
    $display("\tsa = %0d", sa);
    $display("\tlen = %0d", len);
    foreach (payload[i]) $display("\tpayload[%0d] = %0h", i, payload[i]);
    $display("\tcrc = %0h", crc);
  endfunction

  function set_preamble(bit [55:0] preamble_t);
    $display("preamble is updated to %0h", preamble_t);
    preamble = preamble_t;
  endfunction

  function set_da(bit [47:0] da_t, string who = "top");
    $display("da is updated to %0h by %s", da_t, who);
    da = da_t;
  endfunction

  function get_da(output bit [55:0] da_t, input string who = "top");
    da_t = da;
    $display("da is returned to %0h by %s", da_t, who);
  endfunction

  //constraints
  //we can also merge the constraints
  constraint len_c {
    len inside {[5 : 10]};
    payload.size() == len;
  }

endclass

//inhertitance
class pth_ext_pkt extends eth_pkt;

  function new();
    sa = 100;
  endfunction

endclass


module top ();
  bit [47:0] da_val = 0;
  pth_ext_pkt pkt = new();

  initial begin
    pkt.print("pkt with new");
    pkt.randomize();
    pkt.print("pkt after randomizing");


    pkt.set_da(48'h123, "top");  //this is outside eth_pkt and pth_ext_pkt
    pkt.get_da(da_val, "top");
    $display("da_val = %0h", da_val);
    pkt.print("pkt after updating da value");

  end

endmodule
