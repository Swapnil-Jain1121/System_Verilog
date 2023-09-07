`define LIFO 1
`define FIFO 0
class lifo_fifo #(
    bit DS_TYPE = `LIFO,
    type DT = int
);
  DT dtQ[$];

  //put method
  function void put(DT a);
    dtQ.push_back(a);
  endfunction

  //get method
  function void get(output DT a);
    if (DS_TYPE == `LIFO) a = dtQ.pop_back();
    if (DS_TYPE == `FIFO) a = dtQ.pop_front();
  endfunction
endclass

module top ();
  byte num;
  lifo_fifo #(
      .DS_TYPE(`FIFO),
      .DT(byte)
  ) ds_instance = new();

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
