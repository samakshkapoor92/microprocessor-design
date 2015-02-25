`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:49 02/13/2015 
// Design Name: 
// Module Name:    jackpot 
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
module jackpot(
    input clk,
    input rst,
    input [3:0] switch,
    output reg[3:0] led = 1,
	 output reg clk1hz	 
	 );						// Declaring input output ports

reg[29:0] cnt;
reg flag;					// flag register to preserve the present state

////// MODIFYING THE CLOCK TO 1 HZ//////////////

always @(posedge clk, posedge rst)

begin
  if (rst) begin
	
     cnt <= 0;

     clk1hz <= 0;
	  
 
  end 
  else 
  begin
  if (cnt == 50000000) begin		//CLOCK IS OF IMHZ , Hence running the counter for 50 %of time

     cnt <= 0;                                       

     clk1hz <= ~clk1hz;   

  end 
  else begin

     cnt <= cnt + 1;
  end
  end
end

//////MAIN BLOCK OF CODE /////

always @(posedge clk1hz, posedge rst)begin
 
		 if(rst) begin
		 flag<=0;
		 end
		 else if((switch == led) && (flag==0)) begin		//Checking if the switch maped to the led is on/off
		   led <= 4'b1111;								// if correct switch is high turn on all the LED'S 
			flag<=1;
       end
		 else if(switch != 0) begin
		   led <= led;									//IF INCORRECT SWITCH CONTINUE TO TOGGLE THE LEDS
		 end
		 else if(led == 8)begin
		  led <= 1;
		 end
		 else begin
		  led <= led<<1;							// LEFT SHIFT THE LEDS
		 end
		 

    end
endmodule



