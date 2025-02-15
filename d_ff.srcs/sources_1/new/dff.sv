module dff (
  input clk,
  input rst,
  input [3:0] din,
  output reg [3:0] dout
);

  always @ (posedge clk or negedge clk) begin
    if (rst)
      assign dout = 0; 
    else
      assign dout = din;
  end

endmodule
