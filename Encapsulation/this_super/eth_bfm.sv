class eth_bfm;
  eth_good_pkt g_pkt;
  eth_bad_pkt b_pkt;
  eth_ill_pkt i_pkt;
  eth_pkt pkt;

  task run();
    repeat (10) begin
      eth_common::gen2bfm_mb.get(pkt);  //we dont know whether good,bad, or ill packet is coming
      if (pkt.pkt_type == GOOD) begin
        $cast(g_pkt, pkt);
        g_pkt.print("g_pkt");
      end

      if (pkt.pkt_type == BAD) begin
        $cast(b_pkt, pkt);
        b_pkt.print("b_pkt");
      end

      if (pkt.pkt_type == ILL) begin
        $cast(i_pkt, pkt);
        i_pkt.print("i_pkt");
      end

    end
  endtask
endclass
