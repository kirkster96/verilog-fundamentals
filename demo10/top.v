module my_logic (
  output x,
  input a, b, c
);
  wire t0, t1;

  not #2 n1(t0, a);
  and #5 a1(t1, b, c);

  or #4 o1(x, t0, t1);

endmodule

module top;
  reg a, b, c;

  wire out;

  my_logic U0(out, a, b, c);

 initial begin
    $display("TIME,a,b,c,out");
    $monitor($time,",%d,%d,%d,%d",a, b, c, out);
  end

  initial begin
    a=1;b=0;c=1;

    #10 a=1;b=0;c=0;

    #10 a=1;b=1;c=1;

    #10 a=0;b=0;c=0;
    
    #40 $finish();
  end
  
endmodule