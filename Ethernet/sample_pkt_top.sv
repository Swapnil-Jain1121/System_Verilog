`include "sample_pkt.sv"

module top ();
  sample_pkt pkt, pkt1, pkt2;
  byte byteQ[$];

  initial begin
    pkt = new();
    assert (pkt.randomize());
    pkt.print();

    // pkt1 = new();
    pkt.copy(pkt1);
    assert (pkt.compare(pkt1));
    // pkt1.print("pkt1");

    // //pack pkt1 to byteQ
    pkt1.pack(byteQ);

    pkt2 = new();
    // unpack byteQ to pkt2
    pkt2.unpack(byteQ);

    // //compare ptk2 with pkt, they should match now
    assert (pkt.compare(pkt2));
    pkt2.print("pkt2");


  end
endmodule
