

module top;
  reg [3:0] a, b;
  reg clock, reset;

  initial begin
    clock = 0;
    reset = 0;
    a = 4'b0000;
    b = 4'b0000;
    forever #5 clock <= ~clock;
  end

  
 initial begin
    $monitor("clock = %b\na = %b\nb = %b\n", clock, a, b);
    #50 reset = 1;
    #100 $finish();
  end

  always @(posedge clock, posedge reset) 
  begin
    if (reset) begin
      $display("### reset ###");
      a = 4'b0000;
      b = 4'b0000;
      reset = 0;
    end
    
    if(!a[0]) begin
      a[0] <= 1;
    end
    // else if(b[4]) begin
    //   reset <= 1;
    // end
    // else begin
    //   a[0] <= 0;
    // end

    b[0] <= a[0];
    a[1] <= b[0];

    b[1] <= a[1];
    a[2] <= b[1];

    b[2] <= a[2];
    a[3] <= b[2];

    b[3] <= a[3];
    a[4] <= b[3];

    b[4] <= a[4];
  end


endmodule