module top ();
  //P1->P2->P3->P4

  initial begin
    $display("process#1");
  end

  initial begin
    $display("process#2");
  end

  initial begin
    #0;  //delta delay, there is no actual delay, just delaying a statement by delay time
    $display("process#4");
  end

  initial begin
    $display("process#3");
  end

endmodule
