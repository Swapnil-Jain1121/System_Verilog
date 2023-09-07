class eth_pkt;
endclass

class my_pkt;
  rand int count;
  eth_pkt pkt = new();
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

  function void copy(output sample s);
    s = new this; //1st level of shallow copy
    s.pkt = new this.pkt(); //2nd level of shallow copy
    s.pkt.pkt= new this.pkt.pkt();  //3rd level of shallow copy

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
