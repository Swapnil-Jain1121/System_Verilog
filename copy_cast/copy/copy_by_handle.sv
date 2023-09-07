class sample;
  int a, b;
endclass

module top ();
  sample s1, s2;
  initial begin
    s1   = new();
    s2   = new();
    s2.a = 100;
    s1   = s2;  //existing s1 moemory gets deleted, it starts pointing to s2
    $display("s1=%p", s1);

    s2.a = 200;
    s2.b = 300;
    $display("s1=%p", s1);

    s1.a = 200;
    s1.b = 300;
    $display("s2=%p", s2);


  end

endmodule
