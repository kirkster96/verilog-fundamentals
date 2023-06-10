module top;
  reg [3:0] A,B;
  reg s;

  wire [3:0] out;


  assign out = s ? A : B;  

 initial begin
    $monitor("out = %b\n",out);
  end

  initial begin
    A=5;B=4'bxz1x;s=1;
    $display("A = %b B = %b s = %b",A,B, s);

    #10 s=0;
    $display("A = %b B = %b s = %b",A,B, s);

    #10 s=1;
    $display("A = %b B = %b s = %b",A,B, s);

    #10 s=0;
    $display("A = %b B = %b s = %b",A,B, s);

    #10 s=1;
    $display("A = %b B = %b s = %b",A,B, s);

    #50 $finish();
  end
  
endmodule