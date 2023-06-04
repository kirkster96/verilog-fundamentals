module f_adder (
  output s, cout, 
  input cin, a, b
);
  wire t1, t2, t3;

  xor (t1, a, b);
  and (t2, a, b);
  
  and (t3, t1, cin);

  xor (s, t1, cin);
  xor (cout, t3, t2);
  
endmodule

module f_adder_4 (
  output [3:0] sum,
  output carryout,
  input carryin,
  input [3:0] a, b
);

wire c1, c2, c3;

f_adder U0 (sum[0], c1, carryin, a[0], b[0]);
f_adder U1 (sum[1], c2, c1, a[1], b[1]);
f_adder U2 (sum[2], c3, c2, a[2], b[2]);
f_adder U3 (sum[3], carryout, c3, a[3], b[3]);

endmodule

module top;
  reg [3:0] X, Y;
  reg CARRYIN;
  wire [3:0] SUM;
  wire CARRYOUT;

  f_adder_4 F0 (SUM, CARRYOUT, CARRYIN, X, Y);

  initial begin
    $display("TIME,X,Y,CARRY IN,SUM,CARRY OUT");
    $monitor($time,",%d,%d,%d,%d,%d",X,Y,CARRYIN,SUM,CARRYOUT);
  end

  initial begin
    X = 4'd0;
    Y = 4'd0;
    CARRYIN = 1'b0;

    #5 X = 4'd3;
    Y = 4'd3;

    #5 X = 4'd2;
    Y = 4'd3;

    #5 X = 4'd9;
    Y = 4'd9;

    #5 X = 4'd10;
    Y = 4'd15;

    #5 X = 4'd6;
    Y = 4'd9;

    #5 X = 4'd6;
    Y = 4'd9;
    CARRYIN = 1'b1;

    #5 $finish();
  end

endmodule
