
module my_module (
  input A,
  input B,
  output Y
);

  reg my_register;
  initial begin
    my_register = A;
  end


  assign Y = A & B;

endmodule