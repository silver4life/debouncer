`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 06:51:36 AM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
input noisy,reset,clk,
output debounced
    );
reg [1:0] current_state,next_state;
wire done,timer_reset;
localparam s0=0;
localparam s1=1;
localparam s2=2;
localparam s3=3;
always@(posedge clk,posedge reset)
begin
if(reset)
current_state<= 'b0;
else
current_state<=next_state;
end
always@(*)
begin
case(current_state)
s0:if(noisy)               next_state=s1;
   else                    next_state=s0;
   
   
s1:if      (noisy &  done) next_state=s2;
   else if (noisy & ~done) next_state=s1;
   else if (~noisy)        next_state=s0;  
   
    
s2:if      (~noisy)        next_state=s3;
   else if ( noisy)        next_state=s2;
   
   
s3:if      (noisy)         next_state=s2;
   else if (~noisy & ~done)next_state=s3;
   else if (done & ~noisy) next_state=s0;
default: next_state=current_state;
endcase
end
assign timer_reset=((current_state==s2) | (current_state==s0 ));
assign debounced=  ((current_state==s3) | (current_state==s2 ));
timer#(2000000)timer_debounced(.clk(clk),.reset(timer_reset),.done(done));
endmodule
