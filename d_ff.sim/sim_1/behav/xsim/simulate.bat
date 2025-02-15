@echo off
REM ****************************************************************************
REM Vivado (TM) v2024.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Feb 12 17:54:09 +0530 2025
REM SW Build 5239630 on Fri Nov 08 22:35:27 MST 2024
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim dff_tb_top_behav -key {Behavioral:sim_1:Functional:dff_tb_top} -tclbatch dff_tb_top.tcl -view D:/Vivado/d_ff/dff_tb_top_behav.wcfg -log simulate.log"
call xsim  dff_tb_top_behav -key {Behavioral:sim_1:Functional:dff_tb_top} -tclbatch dff_tb_top.tcl -view D:/Vivado/d_ff/dff_tb_top_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
