`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 12:20:43 AM
// Design Name: 
// Module Name: timer_parameter
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


module timer_parameter
    #(parameter COUNTER_VALUE = 'd255)(
    input clk,
    input reset_n,
    input enable,
   
    output done
    );
    
    localparam BITS = $clog2(COUNTER_VALUE);
    
    reg [BITS-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) 
            Q_reg <= 'b0;
        else if(enable) 
            Q_reg <= Q_next;
        else 
            Q_reg <= Q_reg;    
    end
    
    always @(*) begin
        if(Q_reg == COUNTER_VALUE) 
            Q_next <= 'b0;
        else
            Q_next <= Q_next + 1;
    end
    
    assign done = (Q_reg == COUNTER_VALUE);
    
endmodule
