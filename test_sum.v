`timescale 1ns / 1ps

module test_sum;
  reg [5:0] Ain_r, Bin_r;
  reg Ci_r;
  wire [5:0] Ain, Bin, res_my, res_ref;
  wire Ci, Co_my, Co_ref;

  assign Ain = Ain_r;
  assign Bin = Bin_r;
  assign Ci = Ci_r;

  my_sum uut_my (.Ain(Ain), .Bin(Bin), .Ci(Ci), .Sout(res_my), .Co(Co_my));
  ref_sum uut_ref (.Ain(Ain), .Bin(Bin), .Ci(Ci), .Sout(res_ref), .Co(Co_ref));

  initial begin
    $display("Time\tAin\tBin\tCi\tres_my\tCo_my\tres_ref\tCo_ref");
    $monitor("%g\t%d\t%d\t%b\t%d\t%b\t%d\t%b",
             $time, Ain, Bin, Ci, res_my, Co_my, res_ref, Co_ref);
    Ain_r = 0; Bin_r = 0; Ci_r = 0;
    #20 Ain_r = 15; Bin_r = 18;
    #20 Ain_r = 33; Bin_r = 12; Ci_r = 1;
    #20 Ain_r = 63; Bin_r = 63; Ci_r = 1;
    #20 Ain_r = 1; Bin_r = 1; Ci_r = 0;
    #20 $finish;
  end
endmodule

