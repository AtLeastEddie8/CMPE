`timescale 1ns / 1ps


module testbench;
    reg clk = 0;
    reg dUpp = 0;
    reg dLef = 0;
    reg dRig = 0;
    
    wire[7:0]LED;
position uut(
.clk(clk),
.dUpp(dUpp),
.dLef(dLef),
.dRig(dRig),
.LED(LED)
);
always #5 clk = !clk; //every 5ns signal flips so 10ns period
initial
begin
    #0 dUpp = 1;//hold rst high to enable the game, and start at position 00000001
    #5 dUpp = 0;//turn off the rst to continue the game
    #5 dLef = 1;//mimic a left press until 50 ns reached
    #40 dUpp = 1;//since rst held high again, the value should go from its current position back to 00000001
    #45 dUpp = 0;//turn off rst to continue detecting left/right button presses
    #50 dLef = 0;//mimic letting go of left button, so no more shift lefts 
    #50 dRig = 1;//mimic a right press until BNTR depressed at 105ns
    #100 dUpp = 1;//mimic a rst press 
    #105 dUpp = 0;//let go of rst, after this the value should stay at 1 since right is being held down
    #105 dRig = 0;//let go of right button
    #110 dLef = 1;
    #500 dLef = 0;
end

endmodule
