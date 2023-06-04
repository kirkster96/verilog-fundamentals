`include "my_module.v"

module top;
  reg x,x2,x3;
  reg y,y2,y3;
  wire z,z2,z3;

  initial begin
    x = 0;
    y = 0;
    x2 = 0;
    y2 = 0;
    x3 = 0;
    y3 = 0;
  end

  my_module U1 (x,y,z);
  my_module U2 (x2,y2,z2);
  my_module U3 (x3,y3,z3);

endmodule
