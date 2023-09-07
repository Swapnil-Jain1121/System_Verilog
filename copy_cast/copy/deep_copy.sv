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

  function void copy(output sample s);
    s = new();
    s.a = a;
    s.b = b;
    // s1.pkt = pkt; this is how it works in shallow copy
    s.pkt = new();  //this is where deep copying is defering from shallow copying
    s.pkt.count = pkt.count;

  endfunction
endclass

module top ();
  sample s1, s2;
  initial begin
    s1   = new();
    s2   = new();
    s2.a = 100;
    //   function void copy(output sample s);
    s2.copy(s1);
    // s1   = new s2;  //1st new memory will get allocated to s1, and then copy will happen to new memory location
    $display("s1=%p", s1);
    s2.a = 200;
    s2.b = 300;

    s2.pkt.count = 500;
    s1.print("s1");
    s2.print("s2");


    //again change s1.pkt.count = 600
    s1.pkt.count = 600;  //s2.pkt.count should not get updated due to this change 
    s1.a = 68;
    s1.b = 78;
    s1.print("s1");

    s2.print("s2");  //s1 and s2 content are completely independent
  end

endmodule
