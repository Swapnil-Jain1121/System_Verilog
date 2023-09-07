class usb_bfm;
  usb_base_pkt pkt;

  task run();
    forever begin
      gen2bfm_mb.get(pkt);  //we are getting, whatever might be the pkt  
      pkt.print();
      pkt.calc_crc5();  //if it is sof, sof_pkt.calc_crc5 happens
                        //if it is token, token_pkt.calc_crc5 happens
    end
  endtask
endclass
