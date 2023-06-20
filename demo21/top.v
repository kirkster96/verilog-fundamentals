module traffic_controller (
  input wire detectorB,
  input wire clock,
  input wire rst, 
  output reg [2:0] roadA,
  output reg [2:0] roadB
);

// S0:   roadA=G roadB=R
// S1:   roadA=Y roadB=R
// S2:   roadA=R roadB=R
// S3:   roadA=R roadB=G
// S4:   roadA=R roadB=Y
// S5:   roadA=R roadB=R

    // Defining the states
    localparam S0 = 3'b000, 
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100, 
               S5 = 3'b101;

    localparam GREEN = 3'b100,
               YELLOW = 3'b010,
               RED = 3'b001;

    reg [2:0] curr_state, next_state;

    // Counter for delay
    reg [3:0] counter;

    always @(posedge clock) begin        
            curr_state <= next_state;
    end

    // Update signal lights according to state
    always @(curr_state)
    begin
      case (curr_state)
        S0: begin
          roadA = GREEN;
          roadB = RED;
        end
        S1: begin
          roadA = YELLOW;
          roadB = RED;
        end
        S2: begin
          roadA = RED;
          roadB = RED;
        end
        S3: begin
          roadA = RED;
          roadB = GREEN;
        end
        S4: begin
          roadA = RED;
          roadB = YELLOW;
        end
        S5: begin
          roadA = RED;
          roadB = RED;
        end
        default:  begin
          roadA = RED;
          roadB = RED;
        end
      endcase
    end

    // Transitions
    always @(posedge clock) begin
    
        case (curr_state)
            S0: begin
                if (detectorB && (counter >= 10)) begin
                    counter = 4'b0000;
                    next_state = S1;
                end else begin
                    counter = counter + 1;
                    next_state = S0;
                end
            end
            S1: begin
                if (counter >= 4) begin
                    counter = 4'b0000;
                    next_state = S2;
                end else begin
                    counter = counter + 1;
                    next_state = S1;
                end
            end
            S2: begin
                if (counter >= 1) begin
                    counter = 4'b0000;
                    next_state = S3;
                end else begin
                    counter = counter + 1;
                    next_state = S2;
                end
            end
            S3: begin
                if (counter >= 12) begin
                    counter = 4'b0000;
                    next_state = S4;
                end else begin
                    counter = counter + 1;
                    next_state = S3;
                end
            end
            S4: begin
                if (counter >= 4) begin
                    counter = 4'b0000;
                    next_state = S5;
                end else begin
                    counter = counter + 1;
                    next_state = S4;
                end
            end
            S5: begin
                if (counter >= 1) begin
                    counter = 4'b0000;
                    next_state = S0;
                end else begin
                    counter = counter + 1;
                    next_state = S5;
                end
            end
            default: begin
              next_state = S0;
              counter = 0;
            end
        endcase
    end
endmodule


// apply stimulus signals to the ALU to test
module top;
  wire [2:0] lightA, lightB;
  reg ROADB_CAR;
  reg clk, reset;

  traffic_controller U0 (ROADB_CAR, clk, reset, lightA, lightB);


  initial begin
    clk = 0;
    reset = 0;

    forever #2 clk <= ~clk;
  end

  initial begin
    // $monitor($time,"\na   = %b\nb   = %b\ncurr = %b\nnext = %b\n", lightA, lightB, U0.curr_state, U0.next_state);
    $monitor($time,"\na   = %b\nb   = %b\n", lightA, lightB);
    #1000 $finish();
  end

  initial begin
    ROADB_CAR=0;
    $display("no car yet.");

    #300 ROADB_CAR=1;
    $display("CAR!");

    #300 ROADB_CAR=0;
    $display("no car yet.");
  end

endmodule