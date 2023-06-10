module top;
  reg [3:0] a, b;

  wire equal;
  wire notEqual;
  wire caseEqual;
  wire caseNotEqual;
  wire greaterThan;
  wire lessThan;
  wire greaterThanOrEqual;
  wire lessThanOrEqual;

  assign equal = (a == b);  
  assign notEqual = (a != b);  
  assign caseEqual = (a === b);  
  assign caseNotEqual = (a !== b);
  assign greaterThan = (a > b);  
  assign lessThan = (a < b);  
  assign greaterThanOrEqual = (a >= b);  
  assign lessThanOrEqual = (a <= b);

 initial begin
    $monitor("(a == b) = %b\n(a != b) = %b\n(a === b) = %b\n(a !== b) = %b\n(a > b) = %b\n(a < b) = %b\n(a >= b) = %b\n(a <= b) = %b\n",
    equal, notEqual, caseEqual, caseNotEqual,greaterThan, lessThan, greaterThanOrEqual, lessThanOrEqual);
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
    
    #50 $finish();
  end
  
endmodule