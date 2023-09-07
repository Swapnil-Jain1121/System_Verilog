`include "sample_pkt.sv"
module top ();
  sample_pkt pktA[10];

  initial begin
    foreach (pktA[i]) begin
      pktA[i] = new();
      assert (pktA[i].randomize());
      pktA[i].print();
    end
  end
endmodule
