module top ();
  //we want below process order by using events
  //P4->P3->P1->P2
  event e_p4_p3, e_p3_p1, e_p1_p2;

  initial begin
    @(e_p3_p1);
    $display("process#1");
    ->e_p1_p2;
  end

  initial begin
    @(e_p1_p2);
    $display("process#2");
  end

  initial begin
    @(e_p4_p3);
    $display("process#3");
    ->e_p3_p1;
  end

  initial begin
    $display("process#4");
    ->e_p4_p3;
  end

endmodule
