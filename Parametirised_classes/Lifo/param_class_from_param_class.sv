`define LIFO 1
`define FIFO 0
`define PRINT_FORMAT int

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

class lifo_fifo_name #(
    bit DS_TYPE = `LIFO,
    type DT = int,
    int DEPTH = 10,
    string name = "INT_LIFO"
) extends lifo_fifo #(
    .DS_TYPE(DS_TYPE),
    .DT(DT),
    .DEPTH(DEPTH)
);
  function void put(DT a);
    if (`PRINT_FORMAT == "string") begin
      $display("putting %s in to %s", a, name);
    end else begin
      $display("putting %0d in to %s", a, name);
    end
    super.put(a);
  endfunction

  function void get(output DT a);
    super.get(a);
    if (`PRINT_FORMAT == "string") $display("getting %s in to %s", a, name);
    else $display("getting %0d in to %s", a, name);
  endfunction

endclass
module top ();
  dt_t num;
  lifo_fifo_name #(
      .DS_TYPE(`FIFO),
      .DT(dt_t),
      .DEPTH(10)
  ) ds_instance = new();

  initial begin
    repeat (51) begin
      num = $urandom_range(100, 500);
      ds_instance.put(num);
      $display("putting_num=%0d", num);
    end

    repeat (15) begin
      ds_instance.get(num);
      $display("getting_num=%0d", num);
    end
  end
endmodule
