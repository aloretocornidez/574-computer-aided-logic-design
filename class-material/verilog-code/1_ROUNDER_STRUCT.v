//BEHAVIORAL CODE
module rounder(a2, a1, a0, r2, r1, r0);
	input a2, a1, a0;
	output reg r2, r1, r0;
	
	always @(a2, a1, a0) begin
		r2 <= a2 & ~a1 | a2 & ~a0 | ~a2 & a1 & a0;
		r1 <= ~a1 & a0 | a1 & ~a0;
		r0 <= 0;
	end
endmodule

//STRUCTURAL CODE
module rounder(a2, a1, a0, b2, b1, b0);
    input a0, a1, a2;
    output wire b1, b2, b0;
    
    wire n1, n2, n3, n4, n5, n6, n7;
    
    andGate andGate_1(a2, ~a1, n1); //for these to work, you would need to create the andGate, orGate modules
    andGate andGate_2(a2, ~a0, n2);
    andGate andGate_3(~a2, a1, n3);
    andGate andGate_4(a0, n3, n4);
    
    orGate orGate_1(n1, n2, n5);
    orGate orGate_2(n5, n4, b2);
    
    andGate andGate_5(~a1, a0, n6);
    andGate andGate_6(a1, ~a0, n7);
    
    orGate orGate_3(n6, n7, b1);
    
    andGate andGate_7(0, 0, b0);
    
    
    
endmodule


//TESTBENCH EXAMPLE
module rounder_tb();
    reg a2, a1, a0;
    wire b2, b1, b0;
    
    rounder rounder_1(a2, a1, a0, b2, b1, b0);
    
    initial begin
        a2 <= 0; a1 <= 0; a0 <= 0;
        #10 a2 <= 0; a1 <= 0; a0 <= 1;
        #10 a2 <= 0; a1 <= 1; a0 <= 1;
        #10 a2 <= 1; a1 <= 0; a0 <= 0;
        #10 a2 <= 1; a1 <= 0; a0 <= 1; 
    end
endmodule