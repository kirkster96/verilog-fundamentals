module ALU_32bit (
  input [31:0] A,
  input [31:0] B,
  input [2:0] ALUControl,
  output reg [31:0] Result,
  output reg isZero,
  output reg isGreater,
  output reg isLess
);

  always @(*)
  begin
    case (ALUControl)
      3'b000: Result <= A + B;   // Addition
      3'b001: Result <= A - B;   // Subtraction
      3'b010: Result <= A & B;   // Bitwise AND
      3'b011: Result <= A | B;   // Bitwise OR
      3'b100: Result <= A ^ B;   // Bitwise XOR
      3'b101: Result <= A << B;  // Left shift
      3'b110: Result <= A >> B;  // Right shift (logical)
      3'b111: Result <= A;       // No Operation mode
    endcase
    
    isZero <= (Result == 0);            // Set isZero flag if Result is zero
    isGreater <= (Result > B);          // Set isGreater flag if A is greater than B
    isLess <= (Result < B);             // Set isZero flag if A is less than B
  end

endmodule

// apply stimulus signals to the ALU to test
module top;
  reg [31:0] a, b;
  reg [2:0] ALU_opcode;

  wire [31:0] out;
  wire zero, greater, lesser;

  ALU_32bit U0 (a, b, ALU_opcode, out, zero, greater, lesser);

  initial begin
    $monitor("a   = %h\nb   = %H\nout = %H\nIs zero: %b\nIs greater: %b\nIs lesser: %b\n", a, b, out, zero, greater, lesser);
    #100 $finish();
  end

  initial begin
    a=5;b=1;ALU_opcode=0;
    $display("ALU_opcode: Addition");

    #10 a=255;b=255;ALU_opcode=0;
    $display("ALU_opcode: Addition");

    #10 a=255;b=255;ALU_opcode=7;
    $display("ALU_opcode: No Operation");

    #10 a=255;b=255;ALU_opcode=1;
    $display("ALU_opcode: Subtraction");
  end

endmodule