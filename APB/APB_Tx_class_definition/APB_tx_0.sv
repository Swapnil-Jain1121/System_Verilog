class APB_tx;
  //properties of the class

  //write ? read ?
  rand bit wr_rd;

  //addr ?
  rand bit [7:0] addr;

  //wdata ? rdata ?
  rand bit [31:0] data;

  //selection of slave
  rand bit [3:0] sel;

  //methods


  //constraints
  constraint sel_c {sel inside {4'b0001, 4'b0010, 4'b0100, 4'b1000, 4'b0000};}

  //how many total values of sel possible ? => 16
  // sel = 4'b1001 => wrong APB selection as we have here only 4 slave
endclass
