`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module sqw_wave(
    input clk,
    input rst,
    input [19:0] cnt_val,
    output [7:0] sqw_wave_out
);

    (*keep = "true"*) reg [19:0] counter;
    (*keep = "true"*) reg flag;
    (*keep = "true"*) reg [7:0] sqw_wave_out_r;
    
    assign sqw_wave_out = sqw_wave_out_r;
    
    always @(posedge clk) begin
        if (rst) begin
            counter     <= 'd0;
            flag        <= 1'b0;
        end
        else begin
            if (counter < (cnt_val/2)) begin
                counter <= counter + 1'b1;
                flag    <= flag;
            end
            else begin
                counter <= 'd0;
                flag    <= ~flag;
            end
        end
    end
    
    always @(posedge flag or posedge rst) begin
        if (rst) begin
            sqw_wave_out_r    <= 'd0;
        end
        else begin
            sqw_wave_out_r    <= ~sqw_wave_out_r;
        end
    end

endmodule