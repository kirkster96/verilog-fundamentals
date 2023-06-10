module top;
  reg [3:0] A;

  wire andReduc;
  wire nandReduc;
  wire orReduc;
  wire norReduc;
  wire xorReduc;
  wire xnorReduc;

  assign andReduc = &A;  
  assign nandReduc = ~&A; 
  assign orReduc = |A;  
  assign norReduc = ~|A;
  assign xorReduc = ^A;  
  assign xnorReduc = ~^A;

 initial begin
    $monitor("&A = %b\n~&A = %b\n|A = %b\n~|A = %b\n^A = %b (is odd)\n~^A = %b (is even)\n",
    andReduc, nandReduc, orReduc, norReduc, xorReduc, xnorReduc);
  end

  initial begin
    A=0;
    $display("A = %b",A);

    #10 A=1;
    $display("A = %b",A);

    #10 A=2;
    $display("A = %b",A);

    #10 A=3;
    $display("A = %b",A);

    #10 A=4'bxz1x;
    $display("A = %b",A);

    #50 $finish();
  end
  
endmodule