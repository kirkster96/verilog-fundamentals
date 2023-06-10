module top;
  reg [3:0] a, b;

  wire [3:0] bitNot;
  wire [3:0] bitAnd;
  wire [3:0] bitOr;
  wire [3:0] bitXor;
  wire [3:0] bitXnor;
  wire logicNot;
  wire logicAnd;
  wire logicOr;

  assign bitNot = (~a);  
  assign bitAnd = (a & b);  
  assign bitOr = (a | b);  
  assign bitXor = (a ^ b);
  assign bitXnor = (a ~^ b);  
  assign logicNot = (!a);  
  assign logicAnd = (a && b);  
  assign logicOr = (a || b);

 initial begin
    $monitor("(~a) = %b\n(a & b) = %b\n(a | b) = %b\n(a ^ b) = %b\n(a ~^ b) = %b\n(!a) = %b\n(a && b) = %b\n(a || b) = %b\n",
    bitNot, bitAnd, bitOr, bitXor,bitXnor, logicNot, logicAnd, logicOr);
  end

  initial begin
    a=4;b=3;
    $display("a = %b b = %b",a,b);

    #10 b=4;
    $display("a = %b b = %b",a,b);

    #10 a=4'bxz1x; b=4'bxz1x;
    $display("a = %b b = %b",a,b);

    #10 a=4'bxz1x; b=4'bx11x;
    $display("a = %b b = %b",a,b);

    #10 a=4'bxz0x; b=4'bx00x;
    $display("a = %b b = %b",a,b);
    
    #50 $finish();
  end
  
endmodule