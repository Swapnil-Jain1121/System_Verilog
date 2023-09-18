//to do memory tx, what are the essenials fields
//addr, data, wr_rd
//handshaking signals ? not required, only BFM needs it 

class mem_tx;
  rand bit [`ADDR_WIDTH-1:0] addr;
  rand bit [`WIDTH-1:0] data;
  rand bit wr_rd;

  function void print(string name = "mem_tx");
    $display("printing %s fields", name);
    $display("\t addr = %h", addr);
    $display("\t data = %h", data);
    $display("\t wr_rd = %h", wr_rd);
  endfunction
endclass
