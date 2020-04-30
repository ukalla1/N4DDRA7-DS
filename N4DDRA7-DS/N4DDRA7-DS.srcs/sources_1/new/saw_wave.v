`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Uttej Kallakuri 
// 
//////////////////////////////////////////////////////////////////////////////////

module saw_wave(
    input clk,
    input rst,
    input [19:0] cnt_val,
    output [7:0] saw_wave_out
);

    (*keep = "true"*) reg [19:0] counter;
    (*keep = "true"*) reg [7:0] int_counter;

    assign saw_wave_out = int_counter;
    
    always @(posedge clk) begin
        if (rst) begin
            counter     <= 'd0;
            int_counter <= 'd0;
        end
        else begin
            if (counter <= (cnt_val/255)) begin
                counter <= counter + 1'b1;
            end
            else begin
                counter <= 'd0;
                if (int_counter < 'd255) begin
                    int_counter <= int_counter + 1'b1;
                end
                else begin
                    int_counter <= 'd0;
                end
            end
        end
    end

endmodule