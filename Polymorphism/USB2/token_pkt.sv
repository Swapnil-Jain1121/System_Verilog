class token_pkt extends usb_base_pkt;

  function bit [4:0] calc_crc5();
    //coding specific to token pkt crc generation
  endfunction

  function void print(string name);
    $display("printing %s fields", name);
    $display("addr=%h", addr);
    $display("endp=%h", endp);
    $display("crc5=%h", crc5);
  endfunction
endclass
