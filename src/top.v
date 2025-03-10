/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
//  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
 // assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
//  wire _unused = &{ena, clk, rst_n, 1'b0};
//  wire _unused = &{ena, 1'b0};
// Déclaration des signaux intermédiaires
 
    wire data_valid;

  // Affectation correcte de uio_out et uio_oe
  assign uio_out[0] = data_valid;  // On met le signal valid sur uio_out[0]
  assign uio_oe[0]  = 1'b1;        // On active la sortie uio_out[0] en sortie
  assign uio_out[7:1] = 7'b0;      // Les autres sorties restent à 0
  assign uio_oe[7:1]  = 7'b0;      // Les autres broches restent en entrée

  // Instanciation de topVHDL
  topVHDL m_topVHDL (
    .clk       (clk),     // Clock input
    .ena_in    (ui_in[0]), // Activation (au lieu de ena qui est toujours 1)
    .data_in   (ui_in),   // 8-bit Data input
    .data_out  (uo_out),  // 8-bit Data output
    .data_valid(data_valid) // Data valid signal
  );

endmodule
