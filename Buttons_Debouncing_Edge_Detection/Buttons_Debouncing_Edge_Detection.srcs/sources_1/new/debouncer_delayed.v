`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 12:45:45 AM
// Design Name: 
// Module Name: debouncer_delayed
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


module debouncer_delayed(
    input clk,
    input reset_n,
    input noisy,
    
    output debounced
    );
    
    wire    timer_done, timer_reset;
    
    debouncer_delayed_fsm FSM0(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(reset_n),
        .timer_done(timer_done),
        
        //output
        .timer_reset(timer_reset), 
        .debounced(debounced)
    
    );
    
    //set COUNTER_VALUE time bounces
    timer_parameter #(.COUNTER_VALUE(1_999_999)) T0(
        .clk(clk),
        .reset_n(~timer_reset),
        .enable(~timer_reset),
       
        //output
        .done(timer_done)
    );
    
endmodule