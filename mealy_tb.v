`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2025 10:04:16
// Design Name: 
// Module Name: Mealy_0101_tb
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


module Mealy_0101_tb();
  reg in, clk, rst;
  wire [1:0] pst, nst;
  wire q;
  
  always #5 clk=~clk;
  
  Mealy_0101 dut(.in(in), .clk(clk), .rst(rst), .pst(pst), .nst(nst), .q(q));
  
  initial begin
    clk=0; rst=1;
    #10; rst=0;
    
    #10; in=0;
    
    #10; in=1;
    
    #10; in=0;
    
    #10; in=1;
    
    #10; in=0;
    
    #10; in=1;
    
    #10; in=0;
    
    #10; 
    $finish;
  end
  
  initial begin
    $dumpfile("Mealy_Machine.vcd");
    $dumpvars(1);
    $monitor("Time=%0t, in=%0b, pst=%0b, nst=%0b, q=%0b", $time, in, pst, nst, q);
    
  end
endmodule
