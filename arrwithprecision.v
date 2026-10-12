module tb;
  integer i;
  real realA[30:1];
  initial begin
    for(i=1;i<=30;i=i+1)begin
      realA[i]=$urandom_range(2500,3500)/100.0;
    end
    for(i=1;i<=30;i=i+1)begin
      $display("index=%0d,element=%f",i,realA[i]);
    end
  end
endmodule
