// //forward declaration of class
typedef class eth_pkt;
typedef class eth_good_pkt;
typedef class eth_bad_pkt;
typedef class eth_ill_pkt;
typedef class eth_gen;
typedef class eth_bfm;

`include "eth_common.sv"
`include "eth_pkt.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_gen.sv"
`include "eth_env.sv"
`include "eth_bfm.sv"

module top;
  event e;
  int seed_used;
  eth_env env = new();


  initial begin
    @(e);
    env.run();  //0 time
  end

  initial begin
    $value$plusargs("testcase=%s", eth_common::testcase);  //0 time
    ->e;
    #1;
    seed_used = $get_initial_random_seed;
    $display("seed_used=%0d", seed_used);
  end

endmodule
