`define LIFO 1
`define FIFO 0
typedef string dt_t;
class lifo_fifo #(
    bit DS_TYPE = `LIFO,
    type DT = int,
    int DEPTH = 10
);
  DT dtQ[$:DEPTH-1];

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
  dt_t num;
  //overridding by place
  lifo_fifo #(
      .`FIFO,
      .dt_t,
      .10
  ) ds_instance = new();

  initial begin
    repeat (10) begin
      num = $sformatf("name%0d", $urandom_range(100, 500));
      ds_instance.put(num);
      $display("putting_num=%0d", num);
    end

    repeat (10) begin
      ds_instance.get(num);
      $display("getting_num=%0d", num);
    end
  end
endmodule
