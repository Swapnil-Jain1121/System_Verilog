class eth_pkt;
  static int count;
  //properties
  local bit [55:0] preamble;  /*making it local so that it cant be update/viewed/modified 
  outside this class*/
  local bit [7:0] sof;
  rand bit [47:0] da;
  rand bit [47:0] sa;
  rand bit [15:0] len;
  rand bit [7:0] payload[$];  //queue of octets
  bit [31:0] crc;  //random but generated based on payload 


  //methods

  function new();  //you cant make constraint of the variable which are not of rand type, 
                   //so we are making function here
    count++; //a common shared count variable gets increamented. All the objects of eth_pkt will see this common value. 
    preamble = {28{2'b10}};
    sof = 8'b1010_1011;
  endfunction

  function void print(string name = "eth_pkt");
    $display("printing %s fields", name);
    $display("\tpreamble = %0h", preamble);
    $display("\tsof = %0h", sof);
    $display("\tcount = %0d", count);
    $display("\tda = %0h", da);
    $display("\tsa = %0h", sa);
    $display("\tlen = %0d", len);
    $display("\tpayload = %p", payload);

    // foreach (payload[i]) $display("\tpayload[%0d] = %0h", i, payload[i]);
    // $display("\tcrc = %0h", crc);
  endfunction

  function set_preamble(bit [55:0] preamble_t);
    $display("preamble is updated to %0d", preamble_t);
    preamble = preamble_t;
  endfunction

  //constraints
  //we can also merge the constraints
  constraint len_c {
    len inside {[5 : 7]};
    payload.size() == len;
  }

endclass

module top ();

  eth_pkt pkt;

  initial begin
    repeat (10) begin
      pkt = new();
      pkt.randomize();
      pkt.print("pkt after randomizing");

    end

  end

endmodule
