module mux4 (
  output x,
  input c1, c2, c3, c4, s1, s0
);
  wire s1_bar, s0_bar;
  wire t0, t1, t2, t3;

  not(s1_bar, s1);
  not(s0_bar, s0);

  and(t0, c1, s1_bar, s0_bar);
  and(t1, c2, s1_bar, s0);
  and(t2, c3, s1, s0_bar);
  and(t3, c4, s1, s0);

  or(x, t0, t1, t2, t3);

endmodule

module top;
  reg a, b, c, d;
  reg S1, S0;

  wire out;

  mux4 U0(out, a, b, c, d, S1, S0);



  initial begin
    a=1;b=0;c=1;d=0;
    #1 $display("a= %b, b= %b, c= %b, d= %b\n",a,b,c,d);
    
    S0=0;S1=0;
    #1 $display("S0= %b, S1= %b, out= %b\n",S0,S1,out);

    S0=1;S1=0;
    #1 $display("S0= %b, S1= %b, out= %b\n",S0,S1,out);

    S0=0;S1=1;
    #1 $display("S0= %b, S1= %b, out= %b\n",S0,S1,out);

    S0=1;S1=1;
    #1 $display("S0= %b, S1= %b, out= %b\n",S0,S1,out);

  end
  
endmodule