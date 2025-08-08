`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 06:06:19 AM
// Design Name: 
// Module Name: timer
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


module timer#(parameter final_value=2000000)(
input reset,clk,
output done
    );
reg [$clog2(final_value)-1 :0] q_reg,q_next;
always@(posedge clk,posedge reset)
begin
if(reset)
q_reg<='b0;
else q_reg<=q_next;
end
always@(q_reg)
begin
if(q_reg==final_value)
q_next='b0;
else
q_next=q_reg+1;
end
assign done = (q_reg==final_value);
endmodule
