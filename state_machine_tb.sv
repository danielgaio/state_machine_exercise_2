

`timescale 1ns/1ns

module state_machine_tb;


  // inputs of dut as reg
  reg clock_tb, reset_tb, entrada_tb;


  // outputs of dut as wire
  wire saida_tb;



  // Instanciando o módulo
  SM1 my_SM1_dut (
    .clock(clock_tb),
    .reset(reset_tb),
    .entrada(entrada_tb),
    .saida(saida_tb)
  );



  // etapa de reset
  initial begin
    reset_tb = 1;
  end



  // Gerador de clock
  initial clock_tb = 0;
  always begin #5 clock_tb = ~clock_tb; $display("time: %d", $time); end




  initial begin
    

    // desligar o reset após 10 unidades de tempo
    #10
    reset_tb = 0;

   
  
    // inserção de alguns sinais no pino de entrada da maquina de estados
    // a correspondência entre entrada estado e saidas geradas deve ser verificada na forma de onda
    // a forma de onda a ser observada deve corresponder aos sinais internos do módulo da máquina de estados
    // pois pelos sinais do testbench não é possivel visualisar os estados
    
    entrada_tb = 1;
    #20
    entrada_tb = 0;
    #20
    entrada_tb = 1;



    $stop;

  end 
  
endmodule