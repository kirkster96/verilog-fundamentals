// un-comment the following line to disable implicit declarations
// `default_nettype none


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

// Vectors
reg [4:0] a;
reg [3:0] b;
reg [0:7] c[1:0];
initial begin
    $display("a = %b, b = %b, c[0] = %b, c[0] = %b", a, b, c[0], c[1]);
    a = 5'b10101;
    b = 4'b0000;
    c[0] = 8'bxx11_0x0x;
    c[1] = 8'b1111_0000;
    $display("a = %b, b = %b, c[0] = %b, c[0] = %b", a, b, c[0], c[1]);

    #50 b=a;    
    $display("a = %b, b = %b, c[0] = %b, c[0] = %b", a, b, c[0], c[1]);
end

reg clk, reset;
initial begin
    reset = 0;
    clk=0;   
end
always  begin
    #5 clk = ~clk;
end

example_module U1 (clk, reset); 

initial begin    
    #500 $finish;
end
endmodule

class MC;
logic [3:0] m_x;
local logic m_z;
bit m_e;
covergroup cv1 @(posedge clk); coverpoint m_x; endgroup
covergroup cv2 @m_e ; coverpoint m_z; endgroup
endclass

module example_module(input clk, input reset);
  reg [7:0] count = 0;    // little bit-wise endian
  reg [0:7] count2 = 0;   // big bit-wise endian
  reg enable = 1;
  // assign data2 = count;
  assign data = count;      // 
  assign data2 = count2;    // will it get the MSB (bit 0) or the LSB (bit 7)? 

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      enable <= 0;
    end else if (enable) begin
      count <= count + 1;
      count2 <= count2 + 1;
    end
  $display("data = %b data2 = %b count = %b count2 = %b", data, data2, count, count2);
  end
endmodule
