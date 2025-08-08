`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 07:19:35 AM
// Design Name: 
// Module Name: debounced_tb
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


module debounced_tb(

    );
reg clk,noisy,reset;
wire debounced,edge_trig;
edge_detector edge_detector_tb(.clk(clk),.noisy(noisy),.reset(reset),.debounced(debounced),.edge_trig(edge_trig));
initial #2000000000 $finish ;
always
begin
clk=0;
#5;
clk=1;
#5;
end

initial
begin
reset=1;
noisy=0;
#20;
reset=0;
#20;
noisy=1;
#10000;
noisy=0;
#10000;
noisy=1;
#21000000;
noisy=0;
#700000;
noisy=1;
#5000;
noisy=0;
#20000000;
end
endmodule
