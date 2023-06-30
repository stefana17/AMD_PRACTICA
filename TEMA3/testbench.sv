// Code your testbench here
// or browse Examples
module testbench();
  reg [7:0] mem [0:5]; //memorie mem cu 6 adrese a cate 8 biti fiecare
  integer i;
  reg [7:0] date; //stochez valorile din memorie
  //file fl;
  
  initial 
    begin
    //fl = new;
      //readmemh -> citire in hexa, readmemb -> citire binar
      $readmemh("f1.txt", mem, 0, 5);
      for (i = 0; i < 6; i = i + 1)
        begin
          date = mem[i];
          $display("mem[%0d] = %h", i, mem[i]);
          #20;
        end
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #200;
    $finish(1);
  end 
  
endmodule