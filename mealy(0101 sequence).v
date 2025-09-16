`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2025 10:02:38
// Design Name: 
// Module Name: Mealy_0101
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


module Mealy_0101(clk, rst, in, pst, nst, q);
  input clk, rst, in;
  output reg [1:0] pst, nst;
  output reg q;
  
  parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
  
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
          if(in)
            begin
              nst<=S0;
              q<=0;
            end
          else
            begin
              nst<=S1;
              q<=0;
            end
        end
        S1: begin
          if(in)
            begin
              nst<=S2;
              q<=0;
            end
          else
            begin
              nst<=S1;
              q<=0;
            end
        end
        S2: begin
          if(in)
            begin
              nst<=S0;
              q<=0;
            end
          else
            begin
              nst<=S3;
              q<=0;
            end
        end
        S3: begin
          if(in)
            begin
              nst<=S2;
              q<=1;
            end
          else
            begin
              nst<=S0;
              q<=0;
            end
        end
      endcase
    end
endmodule
