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
module structural (hikingClub, basketBallTeam, going_out);
  

  input hikingClub[0:1];
  input basketBallTeam[0:1];
  output going_out;


  initial begin
    going_out <= 0;
  end

  always @(*) 
  begin
    going_out <= hikingClub[0] | hikingClub[1] && basketBallTeam[0] | basketBallTeam[1];

  end

endmodule
