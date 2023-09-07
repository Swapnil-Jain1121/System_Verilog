class sof_pkt extends usb_base_pkt;

  function bit [4:0] crc5();

  endfunction

  function bit [15:0] crc16();

  endfunction

  function void print(string name);
    $display("printing %s fields", name);
    $display("pid=%h", pid);
    $display("frame_no=%h", frame_no);
    $display("crc5=%h", crc5);
  endfunction
endclass
