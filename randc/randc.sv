class sample;
  randc bit [2:0] a;
  rand bit  [2:0] b;

endclass

module top ();
  sample s = new();

  initial begin
    repeat (20) begin
      s.randomize();
      $display("s = %p", s);
    end
  end

endmodule
