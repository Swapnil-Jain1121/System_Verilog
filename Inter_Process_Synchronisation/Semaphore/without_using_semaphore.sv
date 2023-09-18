module top ();

  initial begin  ///process#1
    #5;
    $display("%t: process#1 is writing to memory", $time);
    write_mem();
    $display("%t: process#1 has completed writing to memory", $time);
  end

  initial begin  ///process#2
    #2;
    $display("%t: process#2 is writing to memory", $time);
    write_mem();
    $display("%t: process#2 has completed writing to memory", $time);
  end

  task write_mem();
    #20;  //time required to complete the write
  endtask
endmodule
