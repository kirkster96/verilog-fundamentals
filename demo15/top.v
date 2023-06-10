module top;
  reg [3:0] A,n;
  reg signed [3:0] A_signed;

  wire [3:0] shiftRight;
  wire [3:0] shiftLeft;
  wire [3:0] shiftRightArith;
  wire [3:0] shiftLeftArith;
  wire [3:0] shiftRightSigned;
  wire [3:0] shiftLeftSigned;
  wire [3:0] shiftRightArithSigned;
  wire [3:0] shiftLeftArithSigned;


  assign shiftRight = A >> n;  
  assign shiftLeft = A << n;
  assign shiftRightArith = A >>> n; 
  assign shiftLeftArith = A <<< n;
  assign shiftRightSigned = A_signed >> n;  
  assign shiftLeftSigned = A_signed << n;
  assign shiftRightArithSigned = A_signed >>> n; 
  assign shiftLeftArithSigned = A_signed <<< n;

 initial begin
    $monitor("A >> n = %b\tA_signed >> n = %b\nA << n = %b\tA_signed << n = %b\nA >>> n = %b\tA_signed >>> n = %b\nA <<< n = %b\tA_signed <<< n = %b\n",
    shiftRight, shiftRightSigned, shiftLeft, shiftLeftSigned, shiftRightArith, shiftRightArithSigned, shiftLeftArith,shiftLeftArithSigned);
  end

  initial begin
    A=0;A_signed=0;n=1;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #10 A=1;A_signed=1;n=1;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #10 A=2;A_signed=2;n=1;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #10 A=3;A_signed=3;n=1;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #10 A=-3;A_signed=-3;n=3;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #10 A=4'bxz1x;A_signed=4'bxz1x;n=2;
    $display("A = %b A_signed = %b n = %b",A,A_signed, n);

    #50 $finish();
  end
  
endmodule