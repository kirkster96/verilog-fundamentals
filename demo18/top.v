module top;
  reg a, b, clock;

  initial begin
    clock = 0;
    a = 1;
    b = 0;
    #20 b = 0;            // regular delay control
    forever #5 clock <= ~clock;
  end

  
 initial begin
    $monitor("clock = %b\na = %b\nb = %b\n", clock, a, b);
    #100 $finish();
  end

  // event-based
  //always @(clock)           // any change in clock
  //always @(negedge clock)   // only on falling in clock
  always @(posedge clock)   // only on rising in clock
  begin
    a <= b;
  end

  always @(posedge clock) 
  begin
    b <= a;
  end


  //always @(*)       // any change in any signal  
  always @(clock, b)  // on changes in sensitivity list
  begin
    $display("pop!");
  end

endmodule