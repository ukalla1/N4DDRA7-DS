`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 06:21:34 PM
// Design Name: 
// Module Name: ds_top_wrapper
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


module ds_top_wrapper(
    input clk,
    input rst,
    input [1:0] freq_select,
    input [1:0] wave_select,
    output AUD_PWM
    );
    
    wire [7:0] wave_f_gen;
    
    ds_top dig_wave_gen(
        .clk(clk),
        .rst(rst),
        .freq_select(freq_select),
        .wave_select(wave_select),
        .wave_s(wave_f_gen)
    );
    
    PWM_audio gen_aud(
        .clk(clk),
        .rst(rst),
        .wave_in(wave_f_gen),
        .pwm_out(AUD_PWM)
    );
endmodule
