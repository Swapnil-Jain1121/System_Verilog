`include "sample_pkt_1.sv"

module top;
  string testname;
  sample_pkt pkt;

  //pre randomize 
  //inline constraints

  initial begin
    $display("##### printing %s #####", sample_pkt::testname);
    assert ($value$plusargs("testname=%s", sample_pkt::testname));
    pkt = new();
    if (sample_pkt::testname == "fixed_len") begin
      assert (pkt.randomize() with {len == 10;});
    end else if (sample_pkt::testname == "fixed_sa_50_da_20") begin
      assert (pkt.randomize() with {
        sa == 50;
        da == 20;
      });
    end else if (sample_pkt::testname == "fixed_preamble") begin
      assert (pkt.randomize() with {preamble == 56'h201;});
    end else if (sample_pkt::testname == "fixed_sa") begin
      assert (pkt.randomize() with {sa == 48'h123;});
    end else begin

      //pkt.pre_randomize(); automatically gets called
      assert (pkt.randomize());
      //pkt.post_randomize(); automatically gets called

    end

    pkt.print();

  end



endmodule
