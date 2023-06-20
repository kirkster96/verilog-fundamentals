module rc_blocking_fixed;
  reg a, b, clock;
  reg tempA, tempB;

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
    tempA = a;
    tempB = b;
    a = tempB;
    b = tempA;
  end
endmodule