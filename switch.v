`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:32 02/13/2015 
// Design Name: 
// Module Name:    switch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module switch(
    input [3:0] switches,
    output [3:0] leds
    );			// Declaring input output ports


//////MAIN BLOCK OF CODE /////

assign leds[3:0]=switches[3:0];			//Assign the switch with corresponding Led's

endmodule
