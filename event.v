module tb;
  event e1,e2,e3;
  initial begin
    @e2
    $display("e1");
    ->e3;
  end
  initial begin
    @e1;
    $display("e2");
    ->e2;
  end
  initial begin
    ->e1;
    $display("e3");
    @e3;
  end
endmodule
