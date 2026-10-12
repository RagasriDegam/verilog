module tb;
  integer intA1[4:0];
  integer intA2[4:0];
  integer intA3[4:0];
  integer i;
  
  initial begin
    for(i=0 ;i<5;i=i+1)begin
      intA1[i]=$urandom_range(20,40);
      intA2[i]=$urandom_range(30,60);
    end
    
      for(i=0;i<5;i=i+1)begin
        intA3[i]=sum(intA1[i],intA2[i]);
      
      $display("intA1[%0d]=%0d intA2[%0d]=%0d intA3[%0d]=%0d",i,intA1[i],i,intA2[i],i,intA3[i]);
    end
  end
    
  function integer sum(input integer a, input integer b);
      begin
        sum=a+b;
      end
    endfunction
    endmodule
