class my_pkt;
  rand int count;
endclass

class sample;
  randc bit [3:0] a, b;  //integer variable => non-object variable
  rand my_pkt pkt = new();  //object variable

  function void print(string name = "sample");
    $display("printing %s fields", name);
    $display("\ta=%0d", a);
    $display("\tb=%0d", b);
    $display("\tpkt=%p\n", pkt);
  endfunction

  function sample copy();
    sample s = new();
    s.a = a;
    s.b = b;
    // s1.pkt = pkt; this is how it works in shallow copy
    s.pkt = new();  //this is where deep copying is defering from shallow copying
    s.pkt.count = pkt.count;
    return s;
  endfunction
endclass

module top ();
  sample s1, s2;
  mailbox mbox = new();

  initial begin
    //putting packets in mbox
    s1 = new();

    repeat (5) begin
      s1.randomize();
      mbox.put(s1.copy());
    end

    //get packets from mbox
    repeat (5) begin
      mbox.get(s2);
      s2.print();
    end

  end

endmodule
