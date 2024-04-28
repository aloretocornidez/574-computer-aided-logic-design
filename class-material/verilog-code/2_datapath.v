`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2016 01:36:23 PM
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//2x4 decoder
module decoder(I, D);
    input [1:0] I;
    output reg [3:0] D;
    
    always @(I) begin
        if(I == 2'b00)
            D <= 4'b0001;
        else if(I == 2'b01)
            D <= 4'b0010;
        else if(I == 2'b10)
            D <= 4'b0100;
        else if(I == 2'b11)
            D <= 4'b1000;
    end
    
endmodule

//4 bit register
module register4(I, Q, clk, rst);
    input [3:0] I;
    output reg [3:0] Q;
    input clk, rst;
    
    always @(posedge clk) begin
        if(rst == 1) //synchronous reset
            Q <= 4'b0000;
        else
            Q <= I;
    end

endmodule

//shift register
module shiftreg(I, Q, clk, rst, din, dir); //din: data in; dir: direction (1, right; 0, left)
    input [3:0] I;
    output reg [3:0] Q;
    input clk, rst, dir, din;
    
    always @(posedge clk) begin
        if(rst == 1)
            Q <= 4'b0000; 
        else begin
            if(dir == 1) //1: shift right; 0: shift left
                Q <= {din, I[3:1]}; //concatenate operator
            else
                Q <= {I[2:0], din};
        end
            
    end
endmodule

//4 bit adder with cin and cout
module adder4(A, B, S, cin, cout);
    input [3:0] A, B;
    input cin;
    output reg cout;
    output reg [3:0] S;
    
    reg [4:0] A5, B5, S5;
        
    always @(A, B, cin) begin
        A5 = {1'b0, A}; 
        B5 = {1'b0, B}; //blocking assignment for intermediate values
        S5 = A5 + B5 + cin;
        
        S <= S5[3:0]; //part selection
        cout <= S5[4];
        
    end

endmodule

//4-bit magnitude comparator
module comp4(A, B, gt, lt, eq);
    input [3:0] A;
    input signed [3:0] B;
    output reg gt, lt, eq;
    
    always @(A, B) begin
        if($signed({1'b0,A}) < B) begin //convert unsigned to signed
            gt <= 0; lt <= 1; eq <= 0;
        end
        else if($signed({1'b0,A}) > B) begin
            gt <= 1; lt <= 0; eq <= 0;
        end
        else begin
            gt <= 0; lt <= 0; eq <= 1;
        end
    end
endmodule
