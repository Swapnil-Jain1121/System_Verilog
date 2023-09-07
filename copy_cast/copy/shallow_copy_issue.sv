class my_pkt;
  int count;
endclass

class sample;
  int a, b;  //integer variable => non-object variable
  my_pkt pkt = new();  //object variable

  function void print(string name = "sample");
    $display("printing %s fields", name);
    $display("a=%0d", a);
    $display("b=%0d", b);
    $display("pkt=%p", pkt);

  endfunction
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

    s2.pkt.count = 500;
    s1.print("s1");
    s2.print("s2");


    //again change s1.pkt.count = 600
    s1.pkt.count = 600;
    s1.a = 68;
    s1.b = 78;
    s2.print("s2");
    // s2.print("s2");
  end

endmodule
