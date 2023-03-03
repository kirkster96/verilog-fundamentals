interface simple_bus; // Define the interface
    logic req, gnt;
    logic [7:0] addr, data;
    logic [1:0] mode;
    logic start, rdy;
endinterface: simple_bus

module top;
    logic clk = 0;
    simple_bus sb_intf(); // Instantiate the interface
    // Reference the sb_intf instance of the simple_bus
    // interface from the generic interfaces of the
    // memMod and cpuMod modules
    memMod mem (.a(sb_intf), .clk(clk));
    cpuMod cpu (.b(sb_intf), .clk(clk));
endmodule


module memMod (
    simple_bus a, input logic clk
);
    
endmodule

module cpuMod (
    simple_bus b, input logic clk
);
    
endmodule