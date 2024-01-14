// Author: Alan Manuel Loreto Cornidez
// Modules Testbench
module twoFriends_tb;

reg[1:0] hikingClub;
reg[1:0] basketBallTeam;
reg Clk;
wire structural_out;
wire behavioral_out;


// Call modules
structural structural_1(hikingClub, basketBallTeam, structural_out);
behavioral behavioral_1(hikingClub, basketBallTeam, behavioral_out);


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


module gate_tb;

reg in1;
reg in2;
reg Clk;

wire orOut;
wire andOut;

orGate orGate_1(in1, in2, orOut);
andGate andGate_1(in1, in2, andOut);



//// Set up clock.
initial begin
    Clk <= 1'b1; 
    forever 
    #100 
    Clk <= ~Clk;
end

initial begin
@(posedge Clk);

for (integer i = 0; i < 2; i = i + 1) begin 

    for (integer j = 0; j < 2; j = j + 1) begin 
        @(posedge Clk);
        in1 <= i;
        in2 <= j;
        
    end

end


end


endmodule