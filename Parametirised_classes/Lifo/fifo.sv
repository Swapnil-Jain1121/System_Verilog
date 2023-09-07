class lifo;
  int intQ[$];

  //put method
  function void put(int a);
    intQ.push_back(a);
  endfunction

  //get method
  function void get(output int a);
    a = intQ.pop_front();
  endfunction
endclass

module top ();
  int  num;
  lifo lifo_i = new();

  initial begin
    repeat (5) begin
      num = $urandom_range(100, 500);
      lifo_i.put(num);
      $display("putting_num=%0d", num);
    end

    repeat (5) begin
      lifo_i.get(num);
      $display("getting_num=%0d", num);
    end
  end
endmodule
