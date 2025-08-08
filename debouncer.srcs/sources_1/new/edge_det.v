`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 02:17:51 PM
// Design Name: 
// Module Name: edge_det
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


module edge_det(
input debounced,clk,reset,
output edge_trig
    );
reg current_state, next_state;
localparam s0=0;
localparam s1=1;
always@(posedge clk,posedge reset)
begin
if(reset)
current_state<='b0;
else
current_state<=next_state;
end
always@(*)
begin
case(current_state)
s0: if(debounced) next_state=s1;
    else     next_state=s0;
s1: if(~debounced) next_state=s0;
    else     next_state=s1;
default: next_state=current_state;
endcase
end
assign edge_trig= ((current_state==s0) &  debounced) | ((current_state==s1)  & !debounced); 
endmodule
