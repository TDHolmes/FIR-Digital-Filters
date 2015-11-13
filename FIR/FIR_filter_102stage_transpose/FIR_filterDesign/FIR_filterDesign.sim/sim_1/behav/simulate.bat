@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim tb_FIR_multiStage_behav -key {Behavioral:sim_1:Functional:tb_FIR_multiStage} -tclbatch tb_FIR_multiStage.tcl -view U:/FIR_filter_102stage_transpose/FIR_filterDesign/tb_FIR_multiStage_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
