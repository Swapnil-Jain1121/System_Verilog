// without enum
class eth_gen;
  task run(test_t test_num);
    case (test_num)
      1: begin
      end
      2: begin
      end
      3: begin
      end
    endcase
  endtask
endclass

//with enum
typedef enum bit [1:0]{
    REG_RESET_TEST = 1,
    REG_WR_RD_TEST,
    WRITE_READ_TEST
} test_t

class eth_gen;
    task run(test_t test_num);
        case(test_num) 
            REG_RESET_TEST: begin
                //implement test
            end
            REG_WR_RD_TEST: begin
                //implement test
            end
            WRITE_READ_TEST : begin
                //implement test 
            end          
        endcase
    endtask
endclass
