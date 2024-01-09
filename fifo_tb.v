module fifo_tb;
reg rst,clk,wr_en,rd_en;
reg [7:0] buf_in;
wire [7:0] buf_out;
wire buf_empty,buf_full;
wire [7:0] fifo_counter;

fifo dut (clk,rst,buf_in,buf_out,wr_en,rd_en,buf_empty,buf_full,fifo_counter);
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
wr_en=0;
rd_en=1;
#5 rst =0; wr_en =1; rd_en =0; buf_in =8'd100;
#5 buf_in =8'd150;
#5 buf_in =8'd175;
#5 buf_in =8'd200;
#5 buf_in =8'd225;wr_en=0; rd_en =1;
#5 buf_in =8'd250;
#5 buf_in =8'd255;
#5;
#50 $finish();
end
initial
$monitor("@time =%0t,clk=%0t,rst=%0b,buf_in=%0b,buf_out=%0b,wr_en=%0b,rd_en=%0b,buf_empty=%0b,buf_full=%0b,fifo_counter=%0b",$time,clk,rst,buf_in,buf_out,wr_en,rd_en,buf_empty,buf_full,fifo_counter);
endmodule
