class usb_base_pkt;

  bit [7:0] pid;  //packet id

  //declare every method(task or function) as virtual here
  virtual function bit [4:0] calc_crc5();
    //let it be empty
  endfunction

  virtual function bit [15:0] calc_crc16();
    //let it be empty
  endfunction

  virtual function void print(string name);

  endfunction

  virtual function usb_base_pkt copy();

  endfunction

  virtual function void pack(output byte byteQ[$]);

  endfunction

  virtual function void unpack(input byte byteQ[$]);

  endfunction
endclass
