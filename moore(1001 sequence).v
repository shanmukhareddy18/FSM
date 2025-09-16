`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2025 10:30:51
// Design Name: 
// Module Name: Moore_1001
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


module Moore_1001(in, clk, rst, pst, nst, q);
  input clk, rst, in;
  output reg q;
  output reg [2:0] pst, nst;
  
  parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b0100;
  
  always @(posedge clk)
    begin
      if(rst)
        pst<=S0;
      else
        pst<=nst;
    end
  always @(pst, in)
    begin
      case(pst)
        S0: begin
          q<=0;
          if(in)
            nst<=S1;
          else
            nst<=S0;
        end
        S1: begin
          q<=0;
          if(in)
            nst<=S1;
          else
            nst<=S2;
        end
        S2: begin
          q<=0;
          if(in)
            nst<=S1;
          else
            nst<=S3;
        end
        S3: begin
          q<=0;
          if(in)
            nst<=S4;
          else
            nst<=S0;
        end
        S4: begin
          q<=1;
          if(in)
            nst<=S1;
          else
            nst<=S0;
        end
      endcase
    end
endmodule
