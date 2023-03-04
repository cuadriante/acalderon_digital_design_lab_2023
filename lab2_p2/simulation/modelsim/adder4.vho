-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition"

-- DATE "03/03/2023 17:24:41"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	adder4 IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	ans : OUT std_logic_vector(3 DOWNTO 0);
	cout : OUT std_logic;
	display : OUT std_logic_vector(6 DOWNTO 0);
	display_aux : OUT std_logic_vector(6 DOWNTO 0)
	);
END adder4;

-- Design Ports Information
-- ans[0]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[1]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[2]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cout	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_aux[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF adder4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_ans : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cout : std_logic;
SIGNAL ww_display : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_display_aux : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \adder4_1|b_adder0|sum~combout\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \adder4_1|b_adder1|sum~combout\ : std_logic;
SIGNAL \adder4_1|b_adder1|cout~combout\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \adder4_1|b_adder2|sum~combout\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \adder4_1|b_adder3|sum~combout\ : std_logic;
SIGNAL \adder4_1|b_adder3|cout~combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \adder4_1|b_adder0|ALT_INV_sum~combout\ : std_logic;
SIGNAL \adder4_1|b_adder1|ALT_INV_sum~combout\ : std_logic;
SIGNAL \adder4_1|b_adder2|ALT_INV_sum~combout\ : std_logic;
SIGNAL \adder4_1|b_adder1|ALT_INV_cout~combout\ : std_logic;
SIGNAL \adder4_1|b_adder3|ALT_INV_sum~combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_cin~input_o\ : std_logic;
SIGNAL \ALT_INV_a[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_a[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_b[3]~input_o\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
ans <= ww_ans;
cout <= ww_cout;
display <= ww_display;
display_aux <= ww_display_aux;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\adder4_1|b_adder0|ALT_INV_sum~combout\ <= NOT \adder4_1|b_adder0|sum~combout\;
\adder4_1|b_adder1|ALT_INV_sum~combout\ <= NOT \adder4_1|b_adder1|sum~combout\;
\adder4_1|b_adder2|ALT_INV_sum~combout\ <= NOT \adder4_1|b_adder2|sum~combout\;
\adder4_1|b_adder1|ALT_INV_cout~combout\ <= NOT \adder4_1|b_adder1|cout~combout\;
\adder4_1|b_adder3|ALT_INV_sum~combout\ <= NOT \adder4_1|b_adder3|sum~combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_cin~input_o\ <= NOT \cin~input_o\;
\ALT_INV_a[0]~input_o\ <= NOT \a[0]~input_o\;
\ALT_INV_b[0]~input_o\ <= NOT \b[0]~input_o\;
\ALT_INV_a[1]~input_o\ <= NOT \a[1]~input_o\;
\ALT_INV_b[1]~input_o\ <= NOT \b[1]~input_o\;
\ALT_INV_a[2]~input_o\ <= NOT \a[2]~input_o\;
\ALT_INV_b[2]~input_o\ <= NOT \b[2]~input_o\;
\ALT_INV_a[3]~input_o\ <= NOT \a[3]~input_o\;
\ALT_INV_b[3]~input_o\ <= NOT \b[3]~input_o\;

-- Location: IOOBUF_X80_Y0_N19
\ans[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder0|sum~combout\,
	devoe => ww_devoe,
	o => ww_ans(0));

-- Location: IOOBUF_X84_Y0_N2
\ans[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder1|sum~combout\,
	devoe => ww_devoe,
	o => ww_ans(1));

-- Location: IOOBUF_X89_Y6_N5
\ans[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder2|sum~combout\,
	devoe => ww_devoe,
	o => ww_ans(2));

-- Location: IOOBUF_X89_Y8_N5
\ans[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|sum~combout\,
	devoe => ww_devoe,
	o => ww_ans(3));

-- Location: IOOBUF_X89_Y6_N22
\cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|cout~combout\,
	devoe => ww_devoe,
	o => ww_cout);

-- Location: IOOBUF_X89_Y8_N39
\display[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_display(0));

-- Location: IOOBUF_X89_Y11_N79
\display[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_display(1));

-- Location: IOOBUF_X89_Y11_N96
\display[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_display(2));

-- Location: IOOBUF_X89_Y4_N79
\display[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_display(3));

-- Location: IOOBUF_X89_Y13_N56
\display[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_display(4));

-- Location: IOOBUF_X89_Y13_N39
\display[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_display(5));

-- Location: IOOBUF_X89_Y4_N96
\display[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_display(6));

-- Location: IOOBUF_X89_Y6_N39
\display_aux[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|cout~combout\,
	devoe => ww_devoe,
	o => ww_display_aux(0));

-- Location: IOOBUF_X89_Y6_N56
\display_aux[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_display_aux(1));

-- Location: IOOBUF_X89_Y16_N39
\display_aux[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_display_aux(2));

-- Location: IOOBUF_X89_Y16_N56
\display_aux[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|cout~combout\,
	devoe => ww_devoe,
	o => ww_display_aux(3));

-- Location: IOOBUF_X89_Y15_N39
\display_aux[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|cout~combout\,
	devoe => ww_devoe,
	o => ww_display_aux(4));

-- Location: IOOBUF_X89_Y15_N56
\display_aux[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder4_1|b_adder3|cout~combout\,
	devoe => ww_devoe,
	o => ww_display_aux(5));

-- Location: IOOBUF_X89_Y8_N56
\display_aux[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_display_aux(6));

-- Location: IOIBUF_X4_Y0_N35
\a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\b[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LABCELL_X11_Y1_N0
\adder4_1|b_adder0|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder0|sum~combout\ = ( \b[0]~input_o\ & ( \cin~input_o\ & ( \a[0]~input_o\ ) ) ) # ( !\b[0]~input_o\ & ( \cin~input_o\ & ( !\a[0]~input_o\ ) ) ) # ( \b[0]~input_o\ & ( !\cin~input_o\ & ( !\a[0]~input_o\ ) ) ) # ( !\b[0]~input_o\ & ( 
-- !\cin~input_o\ & ( \a[0]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110011001100110011000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_a[0]~input_o\,
	datae => \ALT_INV_b[0]~input_o\,
	dataf => \ALT_INV_cin~input_o\,
	combout => \adder4_1|b_adder0|sum~combout\);

-- Location: IOIBUF_X4_Y0_N1
\a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\b[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LABCELL_X11_Y1_N9
\adder4_1|b_adder1|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder1|sum~combout\ = ( \b[0]~input_o\ & ( \cin~input_o\ & ( !\a[1]~input_o\ $ (\b[1]~input_o\) ) ) ) # ( !\b[0]~input_o\ & ( \cin~input_o\ & ( !\a[1]~input_o\ $ (!\a[0]~input_o\ $ (\b[1]~input_o\)) ) ) ) # ( \b[0]~input_o\ & ( !\cin~input_o\ 
-- & ( !\a[1]~input_o\ $ (!\a[0]~input_o\ $ (\b[1]~input_o\)) ) ) ) # ( !\b[0]~input_o\ & ( !\cin~input_o\ & ( !\a[1]~input_o\ $ (!\b[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010110101010010101011010101001011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[1]~input_o\,
	datac => \ALT_INV_a[0]~input_o\,
	datad => \ALT_INV_b[1]~input_o\,
	datae => \ALT_INV_b[0]~input_o\,
	dataf => \ALT_INV_cin~input_o\,
	combout => \adder4_1|b_adder1|sum~combout\);

-- Location: LABCELL_X11_Y1_N12
\adder4_1|b_adder1|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder1|cout~combout\ = ( \b[0]~input_o\ & ( \cin~input_o\ & ( (\a[1]~input_o\) # (\b[1]~input_o\) ) ) ) # ( !\b[0]~input_o\ & ( \cin~input_o\ & ( (!\b[1]~input_o\ & (\a[0]~input_o\ & \a[1]~input_o\)) # (\b[1]~input_o\ & ((\a[1]~input_o\) # 
-- (\a[0]~input_o\))) ) ) ) # ( \b[0]~input_o\ & ( !\cin~input_o\ & ( (!\b[1]~input_o\ & (\a[0]~input_o\ & \a[1]~input_o\)) # (\b[1]~input_o\ & ((\a[1]~input_o\) # (\a[0]~input_o\))) ) ) ) # ( !\b[0]~input_o\ & ( !\cin~input_o\ & ( (\b[1]~input_o\ & 
-- \a[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000101110001011100010111000101110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_b[1]~input_o\,
	datab => \ALT_INV_a[0]~input_o\,
	datac => \ALT_INV_a[1]~input_o\,
	datae => \ALT_INV_b[0]~input_o\,
	dataf => \ALT_INV_cin~input_o\,
	combout => \adder4_1|b_adder1|cout~combout\);

-- Location: IOIBUF_X4_Y0_N18
\a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\b[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LABCELL_X88_Y4_N0
\adder4_1|b_adder2|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder2|sum~combout\ = ( \b[2]~input_o\ & ( !\adder4_1|b_adder1|cout~combout\ $ (\a[2]~input_o\) ) ) # ( !\b[2]~input_o\ & ( !\adder4_1|b_adder1|cout~combout\ $ (!\a[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010101011010010110101010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder1|ALT_INV_cout~combout\,
	datac => \ALT_INV_a[2]~input_o\,
	datae => \ALT_INV_b[2]~input_o\,
	combout => \adder4_1|b_adder2|sum~combout\);

-- Location: IOIBUF_X2_Y0_N58
\a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\b[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LABCELL_X88_Y4_N9
\adder4_1|b_adder3|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder3|sum~combout\ = ( \b[2]~input_o\ & ( \b[3]~input_o\ & ( !\a[3]~input_o\ $ (((\adder4_1|b_adder1|cout~combout\) # (\a[2]~input_o\))) ) ) ) # ( !\b[2]~input_o\ & ( \b[3]~input_o\ & ( !\a[3]~input_o\ $ (((\a[2]~input_o\ & 
-- \adder4_1|b_adder1|cout~combout\))) ) ) ) # ( \b[2]~input_o\ & ( !\b[3]~input_o\ & ( !\a[3]~input_o\ $ (((!\a[2]~input_o\ & !\adder4_1|b_adder1|cout~combout\))) ) ) ) # ( !\b[2]~input_o\ & ( !\b[3]~input_o\ & ( !\a[3]~input_o\ $ (((!\a[2]~input_o\) # 
-- (!\adder4_1|b_adder1|cout~combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010010110101111000011110000101001011010010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_a[2]~input_o\,
	datac => \ALT_INV_a[3]~input_o\,
	datad => \adder4_1|b_adder1|ALT_INV_cout~combout\,
	datae => \ALT_INV_b[2]~input_o\,
	dataf => \ALT_INV_b[3]~input_o\,
	combout => \adder4_1|b_adder3|sum~combout\);

-- Location: LABCELL_X88_Y4_N12
\adder4_1|b_adder3|cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder4_1|b_adder3|cout~combout\ = ( \b[2]~input_o\ & ( \b[3]~input_o\ & ( ((\a[2]~input_o\) # (\a[3]~input_o\)) # (\adder4_1|b_adder1|cout~combout\) ) ) ) # ( !\b[2]~input_o\ & ( \b[3]~input_o\ & ( ((\adder4_1|b_adder1|cout~combout\ & \a[2]~input_o\)) # 
-- (\a[3]~input_o\) ) ) ) # ( \b[2]~input_o\ & ( !\b[3]~input_o\ & ( (\a[3]~input_o\ & ((\a[2]~input_o\) # (\adder4_1|b_adder1|cout~combout\))) ) ) ) # ( !\b[2]~input_o\ & ( !\b[3]~input_o\ & ( (\adder4_1|b_adder1|cout~combout\ & (\a[3]~input_o\ & 
-- \a[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000100110001001100110111001101110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder1|ALT_INV_cout~combout\,
	datab => \ALT_INV_a[3]~input_o\,
	datac => \ALT_INV_a[2]~input_o\,
	datae => \ALT_INV_b[2]~input_o\,
	dataf => \ALT_INV_b[3]~input_o\,
	combout => \adder4_1|b_adder3|cout~combout\);

-- Location: LABCELL_X88_Y4_N48
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder2|sum~combout\ & (\adder4_1|b_adder3|sum~combout\ & \adder4_1|b_adder0|sum~combout\)) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder2|sum~combout\ & 
-- (!\adder4_1|b_adder3|sum~combout\ & \adder4_1|b_adder0|sum~combout\)) # (\adder4_1|b_adder2|sum~combout\ & (!\adder4_1|b_adder3|sum~combout\ $ (\adder4_1|b_adder0|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100101001001000000100000001001001001010010010000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datab => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X88_Y4_N57
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder0|sum~combout\ & ((\adder4_1|b_adder2|sum~combout\))) # (\adder4_1|b_adder0|sum~combout\ & (\adder4_1|b_adder3|sum~combout\)) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( 
-- (\adder4_1|b_adder2|sum~combout\ & (!\adder4_1|b_adder0|sum~combout\ $ (!\adder4_1|b_adder3|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011010000001011010111100000000010110100000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datad => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X88_Y4_N30
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder2|sum~combout\ & (!\adder4_1|b_adder3|sum~combout\ & !\adder4_1|b_adder0|sum~combout\)) # (\adder4_1|b_adder2|sum~combout\ & (\adder4_1|b_adder3|sum~combout\)) ) ) # ( 
-- !\adder4_1|b_adder1|sum~combout\ & ( (\adder4_1|b_adder2|sum~combout\ & (\adder4_1|b_adder3|sum~combout\ & !\adder4_1|b_adder0|sum~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000100100011001000100010000000100001001000110010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datab => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X88_Y4_N36
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (\adder4_1|b_adder2|sum~combout\ & \adder4_1|b_adder0|sum~combout\) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder3|sum~combout\ & (!\adder4_1|b_adder2|sum~combout\ $ 
-- (!\adder4_1|b_adder0|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000000001010000010101001000010010000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datab => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X88_Y4_N45
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (\adder4_1|b_adder0|sum~combout\ & !\adder4_1|b_adder3|sum~combout\) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder2|sum~combout\ & (\adder4_1|b_adder0|sum~combout\)) # 
-- (\adder4_1|b_adder2|sum~combout\ & ((!\adder4_1|b_adder3|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111110000010100000101000001010101111100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datad => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X88_Y4_N18
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder0|sum~combout\ & (!\adder4_1|b_adder2|sum~combout\)) # (\adder4_1|b_adder0|sum~combout\ & ((!\adder4_1|b_adder3|sum~combout\))) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( 
-- (\adder4_1|b_adder0|sum~combout\ & (!\adder4_1|b_adder2|sum~combout\ $ (\adder4_1|b_adder3|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100100001001101011001010110000001001000010011010110010101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datab => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X88_Y4_N27
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder0|sum~combout\) # ((!\adder4_1|b_adder2|sum~combout\) # (\adder4_1|b_adder3|sum~combout\)) ) ) # ( !\adder4_1|b_adder1|sum~combout\ & ( (!\adder4_1|b_adder3|sum~combout\ & 
-- ((\adder4_1|b_adder2|sum~combout\))) # (\adder4_1|b_adder3|sum~combout\ & ((!\adder4_1|b_adder2|sum~combout\) # (\adder4_1|b_adder0|sum~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110101111111111010111100001111111101011111111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder4_1|b_adder0|ALT_INV_sum~combout\,
	datac => \adder4_1|b_adder3|ALT_INV_sum~combout\,
	datad => \adder4_1|b_adder2|ALT_INV_sum~combout\,
	datae => \adder4_1|b_adder1|ALT_INV_sum~combout\,
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X40_Y28_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


