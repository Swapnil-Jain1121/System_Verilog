class sample;
  int a, b;
endclass

module top ();
  sample s1, s2;
  initial begin
    s1 = new();
    s2 = new();
    s2.a = 100;
    s1   = new s2;  //1st new memory will get allocated to s1, and then copy will happen to new memory location
    $display("s1=%p", s1);

    s2.a = 200;
    s2.b = 300;
    $display("s1=%p", s1);

  end

endmodule
