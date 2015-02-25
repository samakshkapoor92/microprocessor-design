`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:06 02/13/2015 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input clk,
    input rst,
    input up,
    input down,
    output reg[3:0] led,
	 output reg clk1hz	 

    );                              // Declaring input output ports
	 
reg[29:0] cnt;

////// MODIFYING THE CLOCK TO 1 HZ//////////////

always @(posedge clk, posedge rst)

begin
  if (rst) begin

     cnt <= 0;

     clk1hz <= 0;

  end 
  else 
  begin
  if (cnt == 50000000) begin              //CLOCK IS OF IMHZ , Hence running the counter for 50 %of time

     cnt <= 0;                                       

     clk1hz <= ~clk1hz;   

  end 
  else begin

     cnt <= cnt + 1;
  end
  end
end

//////MAIN BLOCK OF CODE /////

always @(posedge clk1hz, posedge rst)
   	if(rst) begin
			led<=4'b0;               //IF RESET IS HIGH, TURN OFF ALL THE LEDS
		end
	else
   begin
	if(up) begin       
			led<=led+1;              // IF UP IS HIGH, INCREMENT THE COUNTER 
		 end
	else if(down) begin
			led<=led-1;              // IF down IS HIGH, DECREMENT THE COUNTER
		 end
	end
endmodule


