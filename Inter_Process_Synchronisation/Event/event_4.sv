
class gen;
  event e_p2_gen;
  task run();

    //through hierarchucal access
    @(top.e_p2_gen);
    $display("process:generator");
  endtask

endclass

module top ();
  //we want below process order by using events
  //P3->P1->P2->gen
  event e_p2_gen, e_p3_p1, e_p1_p2;

  gen gen_i;

  initial begin
    gen_i = new();
    gen_i.run();
  end

  initial begin
    @(e_p3_p1);
    $display("process#1");
    ->e_p1_p2;
  end

  initial begin
    @(e_p1_p2);
    $display("process#2");
    ->e_p2_gen;
  end

  initial begin
    $display("process#3");
    ->e_p3_p1;
  end

endmodule
