`include "my_module.v"

module top;
  reg x,x2,x3;
  reg y,y2,y3;
  wire z,z2,z3;

  defparam U2.id_num = 2;
  // defparam U2.version = 4;
  defparam U3[0].id_num = 99;
  

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
  my_module U3 [3:0](x3,y3,z3);

endmodule
