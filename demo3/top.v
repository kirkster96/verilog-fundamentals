module top;

// 4 fundamental types
reg t1;
reg t2;
reg t3, t4;
initial begin
    t1 = 1'b0;
    t2 = 1'b1;
    t3 = 1'bx;
    t4 = 1'bz;    
    $display("t1 = %b\nt2 = %b\nt3 = %b\nt4 = %b\n", t1, t2, t3, t4);
end

// Vectors and arrays.
reg [4:0] a;
reg [3:0] b;        // bit-wise little endian
reg [0:7] c[1:0];   // bit-wise big endian
initial begin
    $display("a = %b, b = %b, c[0] = %b, c[0] = %b", a, b, c[0], c[1]);
    a = 5'b10101;
    b = 4'b0000;
    c[0] = 8'bxx11_0x0x;
    c[1] = 8'b1111_0000;
    $display("a = %b, b = %b, c[0] = %b, c[0] = %b", a, b, c[0], c[1]);
end

endmodule
