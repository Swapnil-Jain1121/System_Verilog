class eth_pkt;
  //nested class
  class sample;
    static protected int count;
    typedef int intA_t[3:0];
    //intA reprents a data type of int array of size 4
    static function void set_count(int count_t);
      count = count_t;
    endfunction

    static function int get_count();
      return count;
    endfunction
  endclass
endclass

module top ();
  //intA intA1; this is wrong without scope resolution
  eth_pkt::sample::intA_t intA1;
  initial begin
    $display("intA1=%p", intA1);
    eth_pkt::sample::set_count(100);
    $display("count=%0d", eth_pkt::sample::get_count());
  end
endmodule
