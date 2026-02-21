`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self
// Engineer: SURAJ
// 
// Create Date: 06.02.2026 01:45:08
// Design Name: pipeline_register
// Module Name: pipeline_register
// Project Name: optoML_task
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


module pipeline_register #(parameter int DATA_WIDTH = 32) 
(
    input  logic             clk,
    input  logic             rst_n, 

  
    input  logic             in_valid, //input
    input  logic [DATA_WIDTH-1:0] in_data,
    output logic             in_ready,

   
    output logic             out_valid, // output
    output logic [DATA_WIDTH-1:0] out_data,
    input  logic             out_ready
);

    
    //For Storage 
    
    logic [DATA_WIDTH-1:0]   data_reg;
    logic                    valid_reg;

    // Handshake 
    
    assign in_ready = !valid_reg || out_ready;

    // Register update 
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_reg <= 1'b0;
            data_reg  <= '0;
        end
        else begin
            if (in_valid && in_ready) begin // accept new data
                data_reg  <= in_data;
                valid_reg <= 1'b1;
            end
            else if (out_valid && out_ready) begin //clear valid
                valid_reg <= 1'b0;
            end
            // hold current state
        end
    end

    // Output assignments

    assign out_valid = valid_reg;
    assign out_data  = data_reg;

endmodule
