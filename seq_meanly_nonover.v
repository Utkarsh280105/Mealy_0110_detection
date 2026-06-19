//0110 sequence meanly non overlapping fsm
`timescale 1ns / 1ps
module seq_meanly_nonover(rst,clk,din,dout);
input rst,clk,din;
output reg dout;
parameter S0=2'b00,
          S1=2'b01,
          S2=2'b10,
          S3=2'b11;
reg [1:0] state;

always@(posedge clk )
 begin
 if (rst)begin
 state<=S0;
 dout<=1'b0;
 end
else
begin

case(state)
S0:
begin
dout<=1'b0;
state<=din?S0:S1;
end

S1:
begin
dout<=1'b0;
state<=din?S2:S1;
end

S2:
begin
dout<=1'b0;
state<=din?S3:S1;
end

S3:
begin
if (din)
begin
dout<=1'b0;
state<=S0;
end
else
begin
dout<=1'b1;
state<=S0;
end
end

default: state<=S0;
endcase
end
end
endmodule
