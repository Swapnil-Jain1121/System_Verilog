`define WIDTH 16
`define DEPTH 64
`define ADDR_WIDTH $clog2(DEPTH)

interface mem_intf (
    input logic clk_i,
    rst_i  //keep only clk and rst in the port list, rest all internal signals 
);
  logic [`ADDR_WIDTH-1:0] addr_i;
  logic [`WIDTH-1:0] wdata_i;
  logic [`WIDTH-1:0] rdata_o;
  logic wr_rd_i;
  logic valid_i;
  logic ready_o;
endinterface
