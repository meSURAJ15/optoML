`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 01:51:17
// Design Name: 
// Module Name: top_wrap
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


module top_wrap #(
    parameter DATA_WIDTH = 32
) (
    input  wire             clk,
    input  wire             rst_n,

    input  wire             in_valid,
    input  wire [DATA_WIDTH-1:0] in_data,
    output wire             in_ready,

    output wire             out_valid,
    output wire [DATA_WIDTH-1:0] out_data,
    input  wire             out_ready
);

    pipeline_register #(
        .DATA_WIDTH (DATA_WIDTH)
    ) u_wrap (
        .clk        (clk),
        .rst_n      (rst_n),
        .in_valid   (in_valid),
        .in_data    (in_data),
        .in_ready   (in_ready),
        .out_valid  (out_valid),
        .out_data   (out_data),
        .out_ready  (out_ready)
    );

endmodule
