class eth_gen;
  eth_good_pkt g_pkt;
  eth_bad_pkt b_pkt;
  eth_ill_pkt i_pkt;

  rand bit [1:0] pkt_type;

  task run();
    case (eth_common::testcase)

      "test_all_good_pkts": begin
        for (int i = 0; i < eth_common::count; i++) begin
          g_pkt = new();
          assert (g_pkt.randomize());
          eth_common::gen2bfm_mb.put(g_pkt);
        end
      end

      "test_all_bad_pkts": begin
        for (int i = 0; i < eth_common::count; i++) begin
          b_pkt = new();
          assert (b_pkt.randomize());
          eth_common::gen2bfm_mb.put(b_pkt);
        end
      end

      "test_all_ill_pkts": begin
        for (int i = 0; i < eth_common::count; i++) begin
          i_pkt = new();
          assert (i_pkt.randomize());
          eth_common::gen2bfm_mb.put(i_pkt);
        end
      end


      "test_rand_pkt": begin
        for (int i = 0; i < 10; i++) begin
          pkt_type = $urandom_range(0, 2);
          case (pkt_type)
            //0 - good packet, 1 - bad packet, 2 - illegal packet
            0: begin
              g_pkt = new();
              assert (g_pkt.randomize() with {pkt_type == GOOD;});
              eth_common::gen2bfm_mb.put(g_pkt);
            end

            1: begin
              b_pkt = new();
              assert (b_pkt.randomize() with {pkt_type == BAD;});
              eth_common::gen2bfm_mb.put(b_pkt);
            end

            2: begin
              i_pkt = new();
              assert (i_pkt.randomize() with {pkt_type == ILL;});
              eth_common::gen2bfm_mb.put(i_pkt);
            end
          endcase

        end
      end
    endcase
  endtask

endclass
