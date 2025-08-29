`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2025 02:55:41 PM
// Design Name: 
// Module Name: TB_ALU
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

module TB_ALU;

    reg  [3:0] A, B;
    reg  [4:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire Zero, Carry;

    // Instantiate ALU
    ALU uut (
        .A(A), .B(B), .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out), .Zero(Zero), .Carry(Carry)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d Sel=%b => Out=%d Zero=%b Carry=%b",
                  $time, A, B, ALU_Sel, ALU_Out, Zero, Carry);

        // -------------------------------
        // TEST CASE 1: A=5, B=3
        // -------------------------------
        A=4'd5; B=4'd3;

        // Arithmetic
        ALU_Sel=5'b00000; #10; // Add
        ALU_Sel=5'b00001; #10; // Sub
        ALU_Sel=5'b00010; #10; // Mul
        ALU_Sel=5'b00011; #10; // Div
        ALU_Sel=5'b00100; #10; // Mod
        ALU_Sel=5'b00101; #10; // Power

        // Logical
        ALU_Sel=5'b01000; #10; // AND
        ALU_Sel=5'b01001; #10; // OR
        ALU_Sel=5'b01010; #10; // XOR
        ALU_Sel=5'b01011; #10; // XNOR
        ALU_Sel=5'b01100; #10; // NAND
        ALU_Sel=5'b01101; #10; // NOR

        // Comparisons
        ALU_Sel=5'b10000; #10; // EQ
        ALU_Sel=5'b10001; #10; // NEQ
        ALU_Sel=5'b10010; #10; // LT
        ALU_Sel=5'b10011; #10; // GT
        ALU_Sel=5'b10100; #10; // LE
        ALU_Sel=5'b10101; #10; // GE

        // Shifts/Rotates
        ALU_Sel=5'b11000; #10; // Shift Left
        ALU_Sel=5'b11001; #10; // Shift Right
        ALU_Sel=5'b11010; #10; // Arith Left
        ALU_Sel=5'b11011; #10; // Arith Right
        ALU_Sel=5'b11100; #10; // Rotate Left
        ALU_Sel=5'b11101; #10; // Rotate Right


        // -------------------------------
        // TEST CASE 2: A=7, B=2
        // -------------------------------
        A=4'd7; B=4'd2;
        ALU_Sel=5'b00000; #10; // Add
        ALU_Sel=5'b00001; #10; // Sub
        ALU_Sel=5'b00010; #10; // Mul
        ALU_Sel=5'b00100; #10; // Mod
        ALU_Sel=5'b10010; #10; // LT
        ALU_Sel=5'b10101; #10; // GE


        // -------------------------------
        // TEST CASE 3: A=4, B=4
        // -------------------------------
        A=4'd4; B=4'd4;
        ALU_Sel=5'b00000; #10; // Add
        ALU_Sel=5'b00001; #10; // Sub
        ALU_Sel=5'b10000; #10; // EQ
        ALU_Sel=5'b10011; #10; // GT
        ALU_Sel=5'b10100; #10; // LE

        $finish;
    end
endmodule
