`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 10:26:57 PM
// Design Name: 
// Module Name: ALU
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


module ALU (
    input  [3:0] A, B,       // 4-bit inputs
    input  [4:0] ALU_Sel,    // 5-bit select (to cover many ops)
    output reg [7:0] ALU_Out, // output extended to 8-bit for multiplication etc.
    output reg Zero, Carry
);

    always @(*) begin
        case (ALU_Sel)

            // ---------------- Arithmetic ----------------
            5'b00000: ALU_Out = A + B;         // Addition
            5'b00001: ALU_Out = A - B;         // Subtraction
            5'b00010: ALU_Out = A * B;         // Multiplication
            5'b00011: ALU_Out = (B != 0) ? A / B : 8'hFF; // Division (FF if div by 0)
            5'b00100: ALU_Out = (B != 0) ? A % B : 8'hFF; // Modulus (FF if div by 0)
            5'b00101: ALU_Out = A ** B;        // Power (A^B)

            // ---------------- Logical ----------------
            5'b01000: ALU_Out = A & B;         // AND
            5'b01001: ALU_Out = A | B;         // OR
            5'b01010: ALU_Out = A ^ B;         // XOR
            5'b01011: ALU_Out = ~(A ^ B) & 4'b1111;      // XNOR
            5'b01100: ALU_Out = ~(A & B) & 4'b1111;      // NAND
            5'b01101: ALU_Out = ~(A | B) & 4'b1111;      // NOR
            5'b01110: ALU_Out = ~A & 4'b1111;              // NOT A
            5'b01111: ALU_Out = ~B & 4'b1111;              // NOT B

            // ---------------- Comparison ----------------
            5'b10000: ALU_Out = (A == B) ? 8'd1 : 8'd0;   // Equal
            5'b10001: ALU_Out = (A != B) ? 8'd1 : 8'd0;   // Not Equal
            5'b10010: ALU_Out = (A <  B) ? 8'd1 : 8'd0;   // Less than
            5'b10011: ALU_Out = (A >  B) ? 8'd1 : 8'd0;   // Greater than
            5'b10100: ALU_Out = (A <= B) ? 8'd1 : 8'd0;   // Less than or equal
            5'b10101: ALU_Out = (A >= B) ? 8'd1 : 8'd0;   // Greater than or equal

            // ---------------- Shifts/Rotates ----------------
            5'b11000: ALU_Out = A << 1;        // Logical Left Shift
            5'b11001: ALU_Out = A >> 1;        // Logical Right Shift
            5'b11010: ALU_Out = A <<< 1;       // Arithmetic Left Shift (same as <<)
            5'b11011: ALU_Out = A >>> 1;       // Arithmetic Right Shift
            5'b11100: ALU_Out = {A[2:0], A[3]}; // Rotate Left
            5'b11101: ALU_Out = {A[0], A[3:1]}; // Rotate Right

            default: ALU_Out = 8'h00;
        endcase

        // Flags
        Zero  = (ALU_Out == 0);
        Carry = (ALU_Sel == 5'b00000) && (A + B > 4'hF); // simple carry for add
    end

endmodule
