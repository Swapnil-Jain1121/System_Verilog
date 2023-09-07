typedef enum bit [1:0] {
  SMALL  = 2'b00,
  MEDIUM = 2'b01,
  LARGE  = 2'b10
} pkt_type_t;

class sample_pkt;

  //properties 
  rand bit [55:0] preamble;
  rand bit [47:0] sa;
  rand bit [47:0] da;
  rand bit [31:0] crc;
  rand bit [7:0] len;
  protected rand bit [8:0] payload[$];
  protected static int count;
  rand pkt_type_t pkt_type;
  static string testname;


  //methods 

  //new
  function new();
    count++;
    preamble = {28{2'b10}};
  endfunction

  function void pre_randomize();
    $display("##### printing %s #####", testname);
    case (testname)

      // "fixed_preamble": begin
      //   preamble.rand_mode(0);
      //   preamble = 56'h200;
      // end

      "fixed_sa": begin
        sa.rand_mode(0);
        sa_c.constraint_mode(0);
        sa = 48'h123;
      end

      //   "fixed_len": begin
      //     len.rand_mode(0);
      //     payload_c.constraint_mode(0);
      //     pkt_type_c.constraint_mode(0);
      //   end

    endcase
  endfunction

  function void post_randomize();
    crc = crc_cal();
  endfunction

  function bit [31:0] crc_cal();
    //do some crc calculation logic
    return 32'h1234_5678;
  endfunction

  //print
  function void print(string name = "sample_pkt");
    $display("Printing %s fields", name);
    $display("pkt_type = %s", pkt_type);
    $display("count= %0d", count);
    $display("preamble=%h", preamble);
    $display("sa=%0d", sa);
    $display("da=%0d", da);
    $display("crc=%0h", crc);
    $display("len=%0d", len);
    $display("payload=%p", payload);
  endfunction

  //copy
  function void copy(output sample_pkt pkt);
    pkt = new();
    pkt.pkt_type = pkt_type;
    pkt.preamble = preamble;
    pkt.sa = sa;
    pkt.len = len;
    pkt.payload = payload;
  endfunction

  //another way of using copy function
  // function APB_tx copy();
  //     APB_tx tx = new();  //creating variable and allocating memory, so that it can be copied
  //     tx.addr  = addr;
  //     tx.data  = data;
  //     tx.wr_rd = wr_rd;
  //     tx.sel   = sel;
  //     return tx;
  //   endfunction

  //compare
  function bit compare(sample_pkt pkt);
    if (preamble == pkt.preamble && 
    sa == pkt.sa && 
    len == pkt.len && 
    payload == pkt.payload && 
    pkt_type == pkt.pkt_type) begin
      $display("pkt fields are matching");
      return 1;
    end else begin
      $display("pkt fields are mismatching");
      return 0;
    end
  endfunction

  //pack
  function void pack(output byte byteQ[$]);
    byteQ = {>>byte{preamble, sa, len, payload}};
  endfunction


  //unpack
  //byteQ is the input for this function
  function void unpack(input byte byteQ[$]);
    preamble = {byteQ[0], byteQ[1], byteQ[2], byteQ[3], byteQ[4], byteQ[5], byteQ[6]};
    sa = {byteQ[7], byteQ[8], byteQ[9], byteQ[10], byteQ[11], byteQ[12]};
    len = {byteQ[13]};
    //payload has len no. of bytes
    for (int i = 0; i < len; i++) begin
      payload[i] = byteQ[14+i];
    end

    //update pkt_type based on len
    if (len inside {[1 : 20]}) pkt_type = SMALL;
    if (len inside {[21 : 100]}) pkt_type = MEDIUM;
    if (len inside {[101 : 251]}) pkt_type = LARGE;

  endfunction

  //constraints
  constraint sa_c {soft sa inside {[100 : 150]};}

  constraint payload_c {
    payload.size() == len;
    foreach (payload[i]) {payload[i] inside {8'h1F, 8'h5F}};
  }

  constraint pkt_type_c {
    //implication constraint
    (pkt_type == SMALL) -> (len inside {[1 : 20]});
    (pkt_type == MEDIUM) -> (len inside {[21 : 100]});
    (pkt_type == LARGE) -> (len inside {[101 : 255]});
  }


endclass
