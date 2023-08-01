`timescale 1ns / 1ps

module position(
    input clk,
    input dUpp,//BTNU,
    input dLef,//BTNL,
    input dRig,//BTNR,
    
    output reg [7:0]LED
    );
    
    localparam reset_val = 8'b00000001; // in decimal for 
    localparam max_left = 8'b10000000; // at 1000000 or 128 the max position is reached
    localparam max_right = 8'b00000001; // at 0000001 or 1 the min position is reached
    

    
    
    always@ (posedge clk or posedge dUpp)//asyn reset and always block for registers
    begin
        if(dUpp)//if the push button is high then reset postion back to 0
            LED <= reset_val;
        else begin
            if(dLef)//if BTNL is high and the LED is less than the max position then shift to the left
                if(LED < max_left)
                    LED <= (LED*2);
            if(dRig)//if BTNR is high and the LED is more than the min position then shift to the right
                if(LED > max_right)
                    LED <= (LED/2);
            else//if no button is pressed, re-register the previous input
                LED <= LED;
        end
    end
    
endmodule
