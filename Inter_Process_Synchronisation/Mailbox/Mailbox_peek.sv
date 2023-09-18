class sample;
  int count = 8;
endclass

module top ();
  mailbox mbox = new(10);  //can accomodate 10 variables
  sample  s;
  int a, p;
  string b;
  real   r;

  initial begin
    s = new();
    mbox.put(10);
    mbox.put("Swapnil");
    mbox.put(10.7);
    mbox.put(s);
    mbox.put(s);
    mbox.put(s);
    mbox.put(s);
    mbox.put(s);
    mbox.put(s);
    mbox.put(s);

    mbox.peek(a);

    $display("size=%0d", mbox.num());
    $display("a=%0d", a);


    mbox.get(r);
    mbox.peek(a);
    $display("size=%0d", mbox.num());
    $display("a=%0d", a);

  end
endmodule
