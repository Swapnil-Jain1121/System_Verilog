class eth_pkt;
  rand bit [3:0] sof;
  rand bit [5:0] len;
endclass

typedef eth_pkt pktQ_t[$];  //pktQ_t is a data type now, it can be used to define array of queue of eth_pkt

module top ();
  pktQ_t pktAQ[4:0];  //array of queue of eth_pkt
  eth_pkt pkt;
  int i;

  //lets randomize all these pkts, fill queue with 3 pkts each => total how many pkts = 15 (5*3)
  initial begin
    foreach (pktAQ[i]) begin  //array iteration 
      for (int j = 0; j < 3; j++) begin  //Queue iteration
        pkt = new();
        pkt.randomize();
        pktAQ[i].push_back(pkt);

      end
    end


    foreach (pktAQ[i]) begin
      foreach (pktAQ[i][j]) begin
        $display("pktAQ[%0d][%0d]=%p", i, j, pktAQ[i][j]);
      end
    end
  end
endmodule
