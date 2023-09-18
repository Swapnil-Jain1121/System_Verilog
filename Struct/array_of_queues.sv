`define ARRAY_SIZE 10
`define QUEUE_SIZE 7

typedef int arr[`ARRAY_SIZE-1:0];

class sample;
  rand arr q[$:`QUEUE_SIZE-1];
  static int i, j;

  constraint q_c {q.size() == `QUEUE_SIZE;}

  constraint no_repeat {unique {q};}

  constraint ran_val {
    foreach (q[i, j])
    q[i][j] inside {[5 : 200]};
  }

  function void print();
    $display("q=%p", q);
  endfunction
endclass

module top ();

  sample s = new();

  initial begin
    assert (s.randomize());
    s.print();
  end
endmodule
