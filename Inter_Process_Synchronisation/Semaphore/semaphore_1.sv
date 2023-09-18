module top ();
  semaphore sem = new(1);  //creating the semaphore with 1 key
  initial begin  ///process#1
    #5;
    sem.get(1);  //getting the key from semaphore
    $display("%t: process#1 is writing to memory", $time);
    write_mem();
    $display("%t: process#1 has completed writing to memory", $time);
    sem.put(1);  //returning the key to semaphore
  end

  initial begin  ///process#2
    #2;
    sem.get(1);  //before accessign the key, we get the key
    $display("%t: process#2 is writing to memory", $time);
    write_mem();
    $display("%t: process#2 has completed writing to memory", $time);
    sem.put(1);  //after completing the access, return the key 
  end

  task write_mem();
    #20;  //time required to complete the write
  endtask
endmodule
