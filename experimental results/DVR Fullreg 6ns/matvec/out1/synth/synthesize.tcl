set_param general.maxThreads 8
read_vhdl -vhdl2008 [glob /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/hdl/*.vhd]

read_xdc /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/period_4.xdc
synth_design -top matvec -part xc7k160tfbg484-2 -no_iobuf -mode out_of_context
report_utilization > /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/utilization_post_syn.rpt
report_timing > /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/timing_post_syn.rpt
opt_design
place_design
phys_opt_design
route_design
phys_opt_design
report_utilization > /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/utilization_post_pr.rpt
report_timing > /home/yuaqin/dynamatic-scripts/./dynamatic/integration-test/matvec/out/synth/timing_post_pr.rpt
exit
