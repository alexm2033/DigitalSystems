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

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Mon Feb 13 17:29:24 2023"

module TopLevelSchematic(
	CLOCK_50,
	KEY,
	SW,
	LED
);


input wire	CLOCK_50;
input wire	[1:0] KEY;
input wire	[3:0] SW;
output wire	[7:0] LED;

wire	CK1;
wire	CK2;
wire	CLK_100K;
wire	CLK_100M;
wire	CLK_1M;
wire	[7:0] led_ALTERA_SYNTHESIZED;
wire	PLL_LOCKED;
wire	SYNTHESIZED_WIRE_0;





clk_div_N	b2v_inst(
	.clk(CLK_100K)
	);
	defparam	b2v_inst.N = 25000;


clk_div_N	b2v_inst1(
	.clk(CLK_100K),
	.y(CK2));
	defparam	b2v_inst1.N = 100000;


cascaded_dff	b2v_inst2(
	.DATA_IN(SYNTHESIZED_WIRE_0),
	.CLK(CK2),
	.N_RESET(KEY[0]),
	.Q(led_ALTERA_SYNTHESIZED));


pll_main	b2v_inst3(
	.inclk0(CLOCK_50),
	
	
	.c2(CLK_100K)
	);

assign	SYNTHESIZED_WIRE_0 =  ~KEY[1];

assign	LED = led_ALTERA_SYNTHESIZED;

endmodule
