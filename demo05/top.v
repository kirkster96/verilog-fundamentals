module top;
  reg [0:3] big;
  reg [3:0] little;

  initial begin
    little = 4'b10xz;
    big   = 4'b10xz;
  end

  integer i;
  
  always @(*) begin
    for (i = 0; i < 8; i = i + 1) begin
        $display("little %b\tbig %b", little[i], big[i]);
      end
    end

endmodule
