`timescale 1ns / 1ps

module dff_tb_top;

  reg clk;
  reg rst;
  reg [3:0] din;
  wire [3:0] dout;

  // Instantiate the D Flip-Flop module (replace 'dff' with your actual module name)
  dff dff_inst (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
  );

  // Clock Generation
  always #5 clk = ~clk; // 10ns clock period

  initial begin
    clk = 0;
    rst = 1;
    din = 0;
    #10 rst = 0;  // Release reset after 10ns
  end

  // Stimulus Generation
  initial begin
    repeat (20) begin
      @(posedge clk);
      din <= $urandom_range(0, 7);
      $display("Stimulus: din = %0d at time %0t", din, $time);
    end
  end

  // Reset Test
  initial begin
    #40 rst = 1;  // Assert reset
    $display("Reset asserted at time %0t", $time);
    #30 rst = 0;  // Deassert reset
    $display("Reset deasserted at time %0t", $time);
  end

  // Output Comparison
  always @(posedge clk) begin
    #1;
    if (rst == 0) begin
      if (dout == din) begin
        $display("PASS: din = %0d, dout = %0d at time %0t", din, dout, $time);
      end else begin
        $error("FAIL: din = %0d, dout = %0d at time %0t", din, dout, $time);
      end
    end else begin
      if (dout != din) begin
        $display("PASS: Reset working, dout not equal to din at time %0t", $time);
      end else begin
        $error("FAIL: dout should not be equal to din during reset at time %0t", $time);
      end
    end
  end

  // End Simulation
  initial begin
    #200;
    $finish;
  end

endmodule
