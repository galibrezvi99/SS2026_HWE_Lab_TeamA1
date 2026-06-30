library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.traffic_light_pkg.all;

entity traffic_light_fsm_tb is
end entity traffic_light_fsm_tb;

architecture sim of traffic_light_fsm_tb is
  constant C_CLK_PERIOD : time := 10 ns;
  signal tb_clk, tb_rst, tb_btn_ped : std_logic := '0';
  signal tb_ns_red, tb_ns_yel, tb_ns_grn : std_logic;
  signal tb_ew_red, tb_ew_yel, tb_ew_grn : std_logic;
  signal tb_ped_wait, tb_ped_walk, tb_req_led : std_logic;
begin
  tb_clk <= not tb_clk after C_CLK_PERIOD/2;
  UUT : entity work.traffic_light_top
    port map(clk=>tb_clk, rst=>tb_rst, btn_ped=>tb_btn_ped,
             ns_red=>tb_ns_red, ns_yellow=>tb_ns_yel, ns_green=>tb_ns_grn,
             ew_red=>tb_ew_red, ew_yellow=>tb_ew_yel, ew_green=>tb_ew_grn,
             ped_wait=>tb_ped_wait, ped_walk=>tb_ped_walk, req_led=>tb_req_led);
  stim_proc : process
  begin
    tb_rst <= '1'; wait for 100 ns; tb_rst <= '0';
    report "TB-01: Reset applied.";
    wait for 50 us;
    report "TB-02: Normal cycle check.";
    tb_btn_ped <= '1'; wait for 500 ns; tb_btn_ped <= '0';
    report "TB-03: Pedestrian button pressed.";
    wait for 150 us;
    report "TB-04 to TB-08: Check waveforms.";
    wait;
  end process;

  process(tb_clk)
  begin
    if rising_edge(tb_clk) then
      assert NOT(tb_ns_grn='1' AND tb_ew_grn='1')
        report "SAFETY FAIL: NS+EW green together!" severity FAILURE;
      assert NOT(tb_ped_walk='1' AND (tb_ns_grn='1' OR tb_ew_grn='1'))
        report "SAFETY FAIL: PED_WALK with vehicle green!" severity FAILURE;
    end if;
  end process;
end architecture sim;