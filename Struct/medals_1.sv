`define COUNTRIES 10
`define EVENTS 50
`define SIZE 6

typedef struct {
  string name;
  bit [`SIZE-1:0] gold;  //6 bits can hold `EVENTS
  bit [`SIZE-1:0] silver;
  bit [`SIZE-1:0] bronze;
} medals_t;


class sample;
  rand bit [`SIZE-1:0] goldA  [`COUNTRIES-1:0];
  rand bit [`SIZE-1:0] silverA[`COUNTRIES-1:0];
  rand bit [`SIZE-1:0] bronzeA[`COUNTRIES-1:0];

  constraint count_c {
    goldA.sum() == `EVENTS;
    silverA.sum() == `EVENTS;
    bronzeA.sum() == `EVENTS;

    foreach (goldA[i]) {
      goldA[i] inside {[0 : `EVENTS]};
      silverA[i] inside {[0 : `EVENTS]};
      bronzeA[i] inside {[0 : `EVENTS]};
    }

  }
endclass

module top ();

  medals_t medalsA[`COUNTRIES-1:0];
  sample s = new();

  initial begin
    assert (s.randomize());
    foreach (medalsA[i]) begin
      medalsA[i].name   = $sformatf("name_%0d", i);
      medalsA[i].gold   = s.goldA[i];
      medalsA[i].silver = s.silverA[i];
      medalsA[i].bronze = s.bronzeA[i];
    end

    //display
    $display("medalsA=%p", medalsA);
    $display("s.gold=%p", s.goldA);
    $display("s.silver=%p", s.silverA);
    $display("s.bronze=%p", s.bronzeA);

    //sort the DB as per our requirement

    medalsA.rsort() with (item.gold);  //using struct.gold as a criteria do the sorting 
    //sort - ascending order
    //reversesort - descending
    // medalsA.sort() with (item.silver);
    // medalsA.sort() with (item.bronze);
    $display("medalsA=%p", medalsA);

    //sort by total no. of medals
    medalsA.rsort() with (item.gold + item.silver + item.bronze);
    $display("medalsA=%p", medalsA);



  end
endmodule
