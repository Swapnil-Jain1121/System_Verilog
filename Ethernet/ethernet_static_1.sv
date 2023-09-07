class sample;
  static int a;
  int b;  //anything not declared as static, is by default automatic
endclass


module top ();

  sample s = new();
  sample s1 = new();
  sample s2 = new();

  initial begin
    s.a = 100;
    s.b = 200;
    $display("s1.a = %0d", s1.a);
    $display("s1.b =%0d ", s1.b);

    s1.a = 100;
    s1.b = 300;
    $display("s.a = %0d, s.b =%0d", s.a, s.b);

  end


endmodule
