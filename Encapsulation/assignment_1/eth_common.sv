typedef enum {
  GOOD = 2'b00,
  BAD,
  ILL
} pkt_type_t;

class eth_common;
  static mailbox gen2bfm_mb = new();

endclass
