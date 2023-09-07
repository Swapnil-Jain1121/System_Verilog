function void print();
  $display("global function print");  //global function
endfunction

task run();
  $display("global task print");  //global task
endtask

class sample;
  int count;
  function void print();
    $display("sample :: function print");  //global function
  endfunction
endclass

class eth_pkt;
  sample s_inst = new();
endclass

module sub_module ();
  initial begin : P2
    int count = 300;
  end
endmodule


module top ();
  eth_pkt pkt = new();

  initial begin : P1
    int count = 100;
  end

  function void print();
    $display("top module function print");  //global function
  endfunction
  initial begin
    pkt.s_inst.count = 10;
    $display("count = %0d", pkt.s_inst.count);
    print();

    //to print global 
    $unit::print();
    run();

    //to print sample scope print function
    pkt.s_inst.print();

    $display("P1.count = %0d", P1.count);
    $display("sub_module.P1.count = %0d", sub_module.P2.count);

  end
endmodule
