module fadder32 (
  output [31:0] sum,
  output c_out,
  input [31:0] a, b, 
  input c
);
  assign {c_out, sum} = a + b + c;

endmodule

module top;
  reg [31:0] a, b;
  reg cin;

  wire [31:0] out;
  wire cout;

  fadder32 U0(out, cout, a, b, cin);

 initial begin
    $display("TIME,a,b,cin,cout,out");
    $monitor($time,",%d,%d,%d,%d,%d",a, b,cin, cout, out);
  end

  initial begin
    a=1;b=0;cin=0;

    #10 a=9;b=4;cin=0;

    #10 a=128;b=64;cin=1;

    #10 a=33;b=89;cin=0;

    #10 a=255;b=89;cin=0;
    
    #50 $finish();
  end
  
endmodule