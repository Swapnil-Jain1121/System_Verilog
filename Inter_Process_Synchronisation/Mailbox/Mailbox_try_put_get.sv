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

    assert (mbox.try_put(s));
    assert (mbox.try_put(s));
    assert (mbox.try_put(s));

    mbox.get(a);
    mbox.get(b);
    mbox.get(r);
    mbox.get(s);

    // mbox.get();

    $display("a=%0d, b = %s, r = %f, sample.count = %p", a, b, r, s);
    $display("size=%0d", mbox.num());
    mbox.peek(p);

  end
endmodule
