// Code your testbench here
// or browse Examples

`timescale 1ns/1ns

module state_machine_tb;

  // inputs of dut as reg
  reg clock_tb, reset_tb, entrada_tb;

  // outputs of dut as wire
  wire saida_tb;
  int unsigned estado_atual_tb;

  // Instanciando o módulo
  SM1 my_SM1_dut (
    .clock(clock_tb),
    .reset(reset_tb),
    .entrada(entrada_tb),
    .saida(saida_tb),
    .estado_atual(estado_atual_tb)
  );

  // etapa de reset
  initial begin
    reset_tb = 1;
  end

  // Gerador de clock

initial clock_tb = 0;
always begin #5 clock_tb = ~clock_tb; $display("time: %d", $time); end


  initial begin
    
    #10
    reset_tb = 0;

   
    //$display("-----------");

    entrada_tb = 1;
    #20
    entrada_tb = 0;
    #20
    entrada_tb = 1;






    //if (saida_tb == 0 && estado_atual_tb == 0) $display("saida ok"); else $display("saida not ok");
    //$display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    //$monitor("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    //$display("-----------");
    $stop;

  end 
  
endmodule