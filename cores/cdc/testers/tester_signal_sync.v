/*******************************************************************************
 * TEST BENCH : signal_sync
 *
 * Time-stamp: <Thu 30 Jul 2009 16:48:13 EDT>
 *
 * Author: Berin Martini // berin.martini@gmail.com
 ******************************************************************************/

`timescale 1ns/10ps

`include "signal_sync.v"

`define TB_VERBOSE

module tester_signal_sync;

    /******************************************************************
     * This file declares a couple of redundant functions
     ******************************************************************/
`include "tester_skeleton.v"

    /******************************************************************
     * Parameters for the test bench
     ******************************************************************/

    initial $display("Testbench for unit 'signal_sync'");

    /******************************************************************
     * Unit under test, and signals
     ******************************************************************/
    reg     clock;
    reg     reset;

    reg     i_signal;
    wire    o_signal;

    signal_sync
    uut (
        .o_clk      (clock),
        .rst        (reset),
        .i_signal   (i_signal),
        .o_signal   (o_signal));



   /******************************************************************
    * USER Defined output
    ******************************************************************/
   task display_signals;
      $display("%d\t%b\t%d\t%d\t%d",
        $time, reset, uut.q, i_signal, o_signal);
   endtask // display_signals

   task display_header;
      $display("\t\ttime\trst\tq\td\tsignal");
   endtask


   /******************************************************************
    * ALL the User TESTS defined here:
    ******************************************************************/
    task init;
        begin
            clock   = 0;
            reset   = 0;
            i_signal = 1'b0;
        end
    endtask // init


    task test_1;
        begin
            $display("TEST mux on the write address/word");
            `wait_N_cycles_n(clock,5);
            i_signal <= 1'b1;
            `wait_N_cycles_n(clock,5);
            i_signal <= 1'b0;
            `wait_N_cycles_n(clock,15);

            //`wait_1_cycle_n(clock);
            //`wait_N_cycles_n(clock,5);
        end
    endtask


    task test_2;
        begin
            $display("OTHER TESTS");
        end
    endtask

    task test_3; begin end endtask
    task test_4; begin end endtask
    task test_5; begin end endtask
    task test_6; begin end endtask
    task test_7; begin end endtask
    task test_8; begin end endtask
    task test_9; begin end endtask
    task test_10; begin end endtask

endmodule
