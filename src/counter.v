`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2025 04:51:59 PM
// Design Name: 
// Module Name: tt_um_Vcompt
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

module counter(
    input clk,         // Clock input
    input rst,         // Reset input
    output [7:0] cmpt  // 8-bit counter output
);

reg [7:0] cc=8'b00000000;  // 8-bit register to hold the counter value

always @(posedge clk) begin
    if (rst == 1'b1) begin
        cc <= 8'b00000000;  // Reset counter to 0
    end else if (cc == 8'b11111111) begin
        cc <= 8'b00000000;  // Reset counter to 0 when it reaches 255
    end else begin
        cc <= cc + 1;  // Increment counter by 1
    end
end

assign cmpt = cc;  // Output the current counter value

endmodule
