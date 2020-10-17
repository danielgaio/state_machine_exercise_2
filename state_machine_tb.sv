// Code your testbench here
// or browse Examples

`timescale 1ns/1ns

module state_machine_tb;

  // inputs of dut as reg
  reg clock_tb, reset_tb, entrada_tb;

  // outputs of dut as wire
  wire saida_tb, estado_atual_tb;

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
    clock_tb = 0;
    reset_tb = 1;
  end

  // Gerador de clock

initial clock_tb = 0;
always #10 clock_tb = ~clock_tb;


  initial begin
    
    #15
	reset_tb = 0;
    //$display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    //$display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
	//$display("-----------");

    // primeira transição
    $display("-----------");
    $display("tempo antes da primeira entrada: %d", $time);
    entrada_tb = 0;
    #9
    if (saida_tb == 0 && estado_atual_tb == 0) $display("saida ok"); else $display("saida not ok");

    $display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    $display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    $display("-----------");
    $stop;

    // segunda transição
    $display("-----------");
    $display("tempo antes da segunda entrada: %d", $time);
    
    entrada_tb = 1;
    #15
    if (saida_tb == 1 && estado_atual_tb == 1) $display("saida ok"); else $display("saida not ok");

    $display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    $display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    $display("-----------");
    $stop;
    #20

	
    // terceira transição
    $display("-----------");
    $display("tempo antes da terceira entrada: %d", $time);
    entrada_tb = 0;
	  #20
    if (saida_tb == 1 && estado_atual_tb == 2) $display("saida ok"); else $display("saida not ok");

    $display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    $display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    $display("-----------");
    $stop;


    // quarta transição
    entrada_tb = 0;
	  #20
    if (saida_tb == 1 && estado_atual_tb == 4) $display("saida ok"); else $display("saida not ok");

    $display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    $display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    $display("-----------");
    $stop;


    // quinta transição
    entrada_tb = 0;
	  #20
    if (saida_tb == 0 && estado_atual_tb == 0) $display("saida ok"); else $display("saida not ok");

    $display("\t clock_tb, \t reset_tb, \t entrada_tb, \t saida_tb \t estado atual");
    $display("\t %b, \t\t %b, \t %b, \t\t %b \t\t%d", clock_tb, reset_tb, entrada_tb, saida_tb, estado_atual_tb);
    $display("-----------");
    $stop;

  end 
  
endmodule