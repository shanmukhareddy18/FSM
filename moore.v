`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2025 10:31:52
// Design Name: 
// Module Name: Moore_1001_tb
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


module Moore_1001_tb();
reg in, clk, rst;
  wire [2:0] pst, nst;
  wire q;
  
  Moore_1001 dut(.in(in), .clk(clk), .rst(rst), .pst(pst), .nst(nst), .q(q));
  
  always #5 clk=~clk;
  
  initial begin
    clk=0; rst=1;
    #10; rst=0;
    #10; in=1;
    #10;  in=0;
    #10; in=0;
    #10; in=1;
    
    #20;
    $finish;
  end
  initial begin
    $dumpfile("Moore.vcd");
    $dumpvars(1);
    $monitor("time=%0t, in=%0b, q=%0b", $time, in, q);
  end
endmodule
