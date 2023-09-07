class eth_pkt;
  static int count;
  typedef enum {
    GOOD = 2,
    BAD,
    ILL
  } pkt_type_t;
  class my_pkt;  //defining class, not instantiating
    class sample;
      static int count;
      typedef bit [5:0] bit_t;
      typedef enum {
        GOOD = 10,
        BAD,
        ILL
      } pkt_type_t;
      static pkt_type_t pkt_type;
      static function void set_count(int count_t);
        count = count_t;
      endfunction
    endclass  //sample
  endclass  //my_pkt
  extern static function void print();  //this is only prototype,
  //definitionis present outside (extern)

endclass  //eth_pkt;

function void eth_pkt::print();
endfunction


module top ();
  eth_pkt::my_pkt::sample s_obj;  //     = new();
  eth_pkt::pkt_type_t pkt_type;

  initial begin
    // s_obj = new();
    s_obj.pkt_type = eth_pkt::my_pkt::sample::GOOD;
    // $display("pkt_type=%0d", s_obj.pkt_type);
    // $display("pkt_type=%0d", eth_pkt::my_pkt::sample::GOOD);

    pkt_type = eth_pkt::BAD;
    $display("pkt_type=%0d", pkt_type);

  end

endmodule
