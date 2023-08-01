`timescale 1ns / 1ps

module top(
    input clk,
    input BTNU,//instead of rst since rst was always being held high
    input BTNL,
    input BTNR,
    
    output wire [7:0]LED
    );
    
    
    wire dUp;
    wire dLe;
    wire dRi;
    
    debounce wrapperUp(
    .pb_1(BTNU),
    .clk(clk),
    
    .pb_out(dUp)
    );
    
    debounce wrapperLe(
    .pb_1(BTNL),
    .clk(clk),
    
    .pb_out(dLe)
    );
    
    debounce wrapperRi(
    .pb_1(BTNR),
    .clk(clk),
    
    .pb_out(dRi)
    );
    //wrapper
    position wrapper (
    .clk(clk),
    .dUpp(dUp),
    .dLef(dLe),
    .dRig(dRi),
    
    .LED(LED)
    );
    
endmodule
