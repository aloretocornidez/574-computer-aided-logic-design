module codeDetect(x, y, clk, rst, state); //detect 0011, output Y = 1
    input x, clk, rst;
    output reg y;
    output state;
    parameter wait1 = 0, zero1 = 1, zero2 = 2, one1 = 3, one2 = 4; 
	reg [2:0] state, nextstate;
    
    //combinational logic for outputs and next state transitions
    always @(state, x) begin
        y <= 0;
        case (state)
            wait1 : begin
                if (x == 1)
                    nextstate <= wait1;
                else
                    nextstate <= zero1; 
            end
            zero1 : begin
                if (x == 1)
                    nextstate <= wait1;
                else
                    nextstate <= zero2;
            end        
            zero2 : begin
                if (x == 1)
                    nextstate <= one1;
                else 
                    nextstate <= zero2;      
            end
            one1 : begin
                if (x == 1)
                    nextstate <= one2;
                else
                    nextstate <= zero1;
            end
            one2 : begin
                y <= 1;
                if (x == 1)
                    nextstate <= wait1;
                else
                    nextstate <= zero1;
            end
        endcase 
    end
    //state register
    always @(posedge clk) begin
        if(rst == 1) 
            state <= wait1;
        else
            state <= nextstate;
	end
endmodule
