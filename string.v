module tb;
  reg[8*20:1]string_val;
  initial begin
    string_val="verilog";
    $display("string_val=%s",string_val);
  end
endmodule
