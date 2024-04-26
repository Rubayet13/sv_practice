XVLOG = /tools/Xilinx/Vivado/2023.2/bin/xvlog
XELAB = /tools/Xilinx/Vivado/2023.2/bin/xelab
XSIM = /tools/Xilinx/Vivado/2023.2/bin/xsim
PROJECT_HOME = /home/ruba/sv_practice/data_types
TB_TOP = tb

COMPILE_ORDER = $(PROJECT_HOME)/verilog_codes/cla.sv


COMP_OPT = --incr --relax
SIM_LOG = -log simulate.log
# ELAB_LOG = -log elaborate.log
# XVLOG_LOG = -log xvlog.log
TIMESCALE = -timescale 1ns/1ps

compilation:
	$(XVLOG) -sv $(COMPILE_ORDER) $(COMP_OPT)

elaboration: compilation
	$(XELAB) $(TB_TOP) --relax -s top --debug typical

simulate: clean elaboration
	$(XSIM) top -runall

clean:
	@echo "---------------------------------Running Clean--------------------------------" 
	@rm -rf *.jou *.log *.pb *.wdb xsim.dir xsim.covdb xcrg_report *.vcd .*.timestamp
