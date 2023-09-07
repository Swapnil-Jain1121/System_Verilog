//user want FIFO, DEPTH = 20, name = "my_FIFO", DT = int

`define LIFO 1
`define FIFO 0
`define PRINT_FORMAT int
typedef int dt_t;
class lifo_fifo #(
    bit DS_TYPE = `LIFO,
    type DT = int,
    int DEPTH = 10,
    string name = "INT_LIFO"
);
  DT dtQ[$:DEPTH-1];

  //put method
  function void put(DT a);
    if (`PRINT_FORMAT == "string") $display("putting %s in to %s", a, name);
    else $display("putting %0d in to %s", a, name);
    dtQ.push_back(a);
  endfunction

  //get method
  function void get(output DT a);
    if (DS_TYPE == `LIFO) a = dtQ.pop_back();
    if (DS_TYPE == `FIFO) a = dtQ.pop_front();
    if (`PRINT_FORMAT == "string") $display("getting %s in to %s", a, name);
    else $display("getting %0d in to %s", a, name);

  endfunction
endclass


//user want FIFO, DEPTH = 20, name = "my_FIFO", DT = int

module top ();
  dt_t num;
  //overridding by place
  lifo_fifo #(`FIFO, dt_t, 20, "my_FIFO") ds_instance = new();

  initial begin
    repeat (10) begin
      //   num = $sformatf("name%0d", $urandom_range(100, 500));
      num = $urandom_range(100, 500);
      ds_instance.put(num);
      //   $display("putting_num=%0d", num);
    end

    repeat (10) begin
      ds_instance.get(num);
      //   $display("getting_num=%0d", num);
    end
  end
endmodule
