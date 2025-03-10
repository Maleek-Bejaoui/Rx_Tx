`timescale 1ns / 1ps




module topVHDL (
    input wire clk,
    input wire ena_in,
    input wire [7:0] data_in,
    output wire [7:0] data_out,
    output wire data_valid
);

    wire s_tx; 

    uart_tx TX (
        .clk(clk),
        .send(ena_in),
        .tx(s_tx),
        .data_in(data_in)
    );

    uart_rx RX (
        .clk(clk),
        .rx(s_tx),
        .data_valid(data_valid),
        .data_out(data_out)
    );

endmodule
