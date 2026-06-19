`timescale 1ns / 1ps
module seq_meanly_nonover_tb();
reg rst,clk,din;
wire dout;
 seq_meanly_nonover dut (.rst(rst),.clk(clk),.din(din),.dout(dout));
initial
clk=0;
 always #5 clk=~clk;
initial begin
$monitor($time,"rst=%b, clk=%b, din=%b, dout=%b",rst,clk,din,dout);
din = 1;    rst=1; 
    #5 rst=0;
    #10 din = 0; 
    #10 din = 1; 
    #20 din = 0; 
    #10 din = 1;
    #20 din = 0; 
    #20 din = 1;
    #20 din = 0;   
    #20 din = 1;
    #20 din = 0;
    #20 din = 1;
    #10 din = 0; 
     #20 din = 1; 
    #20 din = 0;
     #10 din = 1; 
    #10 din = 0;
$finish;
end
endmodule
