`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 02:30:09 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
input clk,reset,noisy,
output edge_trig,debounced
    );
wire debounced_between;
edge_det edge_fsm(.clk(clk),.reset(reset),.debounced(debounced_between),.edge_trig(edge_trig));
debouncer debouncer0(.clk(clk),.reset(reset),.noisy(noisy),.debounced(debounced_between));
assign debounced=debounced_between;
endmodule
