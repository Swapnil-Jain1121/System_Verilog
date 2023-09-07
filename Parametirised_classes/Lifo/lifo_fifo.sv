`define LIFO 1
`define FIFO 0
class lifo_fifo #(bit DS_TYPE=`LIFO);
  int intQ[$];

  //put method
  function void put(int a);
    intQ.push_back(a);
  endfunction

  //get method
  function void get(output int a);
    if (DS_TYPE == `LIFO) a = intQ.pop_back();
    if (DS_TYPE == `FIFO) a = intQ.pop_front();
  endfunction
endclass

module top ();
  int  num;
  lifo_fifo #(.DS_TYPE(`FIFO))ds_instance = new();

  initial begin
    repeat (5) begin
      num = $urandom_range(100, 500);
      ds_instance.put(num);
      $display("putting_num=%0d", num);
    end

    repeat (5) begin
      ds_instance.get(num);
      $display("getting_num=%0d", num);
    end
  end
endmodule
