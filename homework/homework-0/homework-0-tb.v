`timescale 1ns / 1ps


/// Logic done in a behavioral manner.
module behavioral (hikingClub, basketBallTeam, going_out);
  
  input [0:1] hikingClub;
  input [0:1] basketBallTeam;
  output reg going_out;

   initial begin
    going_out <= 0;
  end

  always @(*)
  begin
    // Only going out if at least one member from each team is going with me.
    going_out <= (hikingClub[0] | hikingClub[1]) & (basketBallTeam[0] | basketBallTeam[1]);

  end
endmodule


// Logic done in a structural manner.
// or gate
module orGate (in1, in2, out);
  
  input in1;
  input in2;
  output reg out;

  initial begin
    out <= 0;
  end

  always @(in1, in2) begin 

    out <= in1 | in2;

  end


endmodule

// and gate
module andGate (in1, in2, out);

  input in1;
  input in2;
  output reg out;

  always @(in1, in2) begin 
    out <= in1 & in2;
  end


endmodule

// structural gate
module structural (hikingClub, basketBallTeam, going_out);

  input wire [1:0]hikingClub;
  input wire [1:0]basketBallTeam;
  
  wire wire1;
  wire wire2;
  
  output going_out;
  
  orGate or1(hikingClub[0], hikingClub[1], wire1);
  orGate or2(basketBallTeam[0], basketBallTeam[1], wire2);
  andGate and1(wire1, wire2, going_out); 

endmodule
