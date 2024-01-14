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

  always @(*) begin 
    out <= in1 & in2;
  end


endmodule


module structural (hikingClub1, hikingClub2, basketBallTeam1, basketBallTeam2, going_out);

  input wire hikingClub1;
  input wire basketBallTeam1;
  input wire hikingClub2;
  input wire basketBallTeam2;
  
  wire wire1;
  wire wire2;
  
  output going_out;
  
  orGate or1(hikingClub1, hikingClub2, wire1);
  orGate or2(basketBallTeam1, basketBallTeam2, wire2);
  andGate and1(wire1, wire2, going_out); 

endmodule




module twoFriends_tb;

reg[1:0] hikingClub;
reg[1:0] basketBallTeam;
reg Clk;
wire structural_out;
wire behavioral_out;


// Call modules
structural structural_1(hikingClub[0], hikingClub[1], basketBallTeam[0],basketBallTeam[1], structural_out);
behavioral behavioral_1({hikingClub[0], hikingClub[1]}, {basketBallTeam[0],basketBallTeam[1]}, behavioral_out);


// Set up clock.
initial begin
    Clk <= 1'b1; 
    forever 
    #100 
    Clk <= ~Clk;
end

// Set up test bench parameters.
initial begin
    @(posedge Clk);

    for(integer i = 0; i < 4; i = i + 1) begin
        for(integer j = 0; j < 4; j = j + 1) begin 
        @(posedge Clk);
        hikingClub = i;
        basketBallTeam = j;
        
        end       
    end
end

endmodule
