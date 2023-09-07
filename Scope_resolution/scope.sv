class eth_pkt;
  static int count;
  typedef int intA_t[3:0];
  //intA reprents a data type of int array of size 4

endclass

module top ();
  //intA intA1; this is wrong without scope resolution
  eth_pkt::intA_t intA1;
  initial begin
    $display("intA1=%p", intA1);
  end
endmodule
