module top ();
  int intQA[$:2][4:0];

  initial begin
    for (int i = 0; i < 3; i++) begin
      foreach (intQA[i][j]) begin
        intQA[i][j] = $urandom_range(10, 20);
      end
    end

    // for (int i = 0; i < 3; i++) begin
    //   foreach (intQA[i][j]) begin
    //     $display("intQA[%0d][%0d]=%p", i, j, intQA[i][j]);
    //   end
    // end

    foreach (intQA[i, j]) begin
      $display("intQA[%0d][%0d]=%p", i, j, intQA[i][j]);
    end


  end
endmodule
