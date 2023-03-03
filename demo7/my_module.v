
module my_module (
  input A,
  input B,
  output Y
);
  parameter id_num = 0;
  localparam version = 2;

  reg my_register;
  initial begin
    my_register = A;
    $display("id_num = %d\tversion = %d", id_num, version);
  end


  assign Y = A & B;

endmodule