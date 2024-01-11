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
module gate_or (in, out);
  
  input in[0:1];
  output out;

  initial begin
    output <= 0;
  end

  always @(*) begin 

    output <= in[0] | in[1];

  end


endmodule

// and gate
module gate_and ( in, out);

  input in[0:1];
  output out;

  initial begin
    output <= 0;
  end

  always @(*) begin 

    output <= in[0] & in[1];

  end


endmodule


module structural (hikingClub, basketBallTeam, going_out);
  

  input hikingClub[0:1];
  input basketBallTeam[0:1];
  output going_out;

  

  

  gate_and myAnd()

    going_out <= hikingClub[0] | hikingClub[1] && basketBallTeam[0] | basketBallTeam[1];

  end

endmodule
