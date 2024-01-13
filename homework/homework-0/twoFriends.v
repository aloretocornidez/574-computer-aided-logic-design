`timescale 1ns / 1ps


/// Logic done in a behavioral manner.
module behavioral (hikingClub, basketBallTeam, going_out);
  
  input hikingClub[0:1];
  input basketBallTeam[0:1];
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
module orGate (in, out);
  
  input in[0:1];
  output reg out;

  initial begin
    out <= 0;
  end

  always @(*) begin 

    out <= in[0] | in[1];

  end


endmodule

// and gate
module andGate ( in, out);

  input in[0:1];
  output reg out;

  initial begin
    out <= 0;
  end

  always @(*) begin 
    out <= in[0] & in[1];
  end


endmodule


module structural (hikingClub, basketBallTeam, going_out);
  

  input wire hikingClub[0:1];
  input wire basketBallTeam[0:1];
  
  
  wire wire1;
  wire wire2;
  
  output going_out;
  
  
  andGate and1;
  orGate or1;
  orGate or1;
  
  or1(hikingClub, wire1);
  or2(basketBallTeam, wire2);
  
  and1(wire1, wire2, going_out); 
  
  
  
  

endmodule
