// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// Generated by Quartus Prime Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition
// Created on Sun Oct 11 11:23:59 2020

// synthesis message_off 10175

`timescale 1ns/1ns

module SM1 (
    input reset, input clock, input entrada,
    output reg saida);

    enum int unsigned { s0=0, s1=1, s2=2, s3=3, s4=4 } fstate, reg_fstate;

    always_ff @(posedge clock)
    begin
        if (clock) begin
            //$display("fstate: %d", fstate);
            //$display("reg_fstate: %d", reg_fstate);
	    $display("tempo atualizacao estado: %d", $time);
            fstate <= reg_fstate;
        end
    end

    always_comb begin
        if (reset) begin
            reg_fstate <= s0;
            saida <= 1'b0;
        end
        else begin
            //saida <= 1'b0;
            case (fstate)
                s0: begin
                    if (entrada) begin
                        reg_fstate <= s1;
			saida <= 1'b1;
                    end else if (~(entrada)) begin
                        reg_fstate <= s0;
			saida <= 1'b0;
                    // Inserting 'else' block to prevent latch inference
                    end else begin
                        reg_fstate <= s0;
			saida <= 1'b0;
		    end

                    //if (~(entrada))
                        //saida <= 1'b0;
                    //else if (entrada)
                        //saida <= 1'b1;
                    // Inserting 'else' block to prevent latch inference
                    //else
                        //saida <= 1'b0;
                end
                s1: begin
                    if (~(entrada))
                        reg_fstate <= s2;
                    else if (entrada)
                        reg_fstate <= s3;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s1;

                    if (~(entrada))
                        saida <= 1'b1;
                    else if (entrada)
                        saida <= 1'b0;
                    // Inserting 'else' block to prevent latch inference
                    else
                        saida <= 1'b0;
                end
                s2: begin
                    if (~(entrada))
                        reg_fstate <= s4;
                    else if (entrada)
                        reg_fstate <= s2;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s2;

                    if (entrada)
                        saida <= 1'b0;
                    else if (~(entrada))
                        saida <= 1'b1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        saida <= 1'b0;
                end
                s3: begin
                    if (~(entrada))
                        reg_fstate <= s2;
                    else if (entrada)
                        reg_fstate <= s3;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s3;

                    if (entrada)
                        saida <= 1'b1;
                    else if (~(entrada))
                        saida <= 1'b0;
                    // Inserting 'else' block to prevent latch inference
                    else
                        saida <= 1'b0;
                end
                s4: begin
                    if (~(entrada))
                        reg_fstate <= s0;
                    else if (entrada)
                        reg_fstate <= s3;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s4;

                    if (~(entrada))
                        saida <= 1'b0;
                    else if (entrada)
                        saida <= 1'b1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        saida <= 1'b0;
                end
                default: begin
                    saida <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // SM1
