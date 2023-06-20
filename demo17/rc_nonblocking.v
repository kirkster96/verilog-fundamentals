module rc_blocking;
  reg a, b, clock;

  initial begin
    clock = 0;
    a = 1;
    b = 0;
    forever #5 clock <= ~clock;
  end

  
 initial begin
    $monitor("clock = %b\na = %b\nb = %b\n", clock, a, b);
    #100 $finish();
  end

  always @(posedge clock) begin
    a <= b;
  end

  always @(posedge clock) begin
    b <= a;
  end
endmodule