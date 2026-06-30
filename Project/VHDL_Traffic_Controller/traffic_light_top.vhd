library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.traffic_light_pkg.all;

entity traffic_light_top is
  port (clk, rst, btn_ped : in std_logic;
        ns_red, ns_yellow, ns_green : out std_logic;
        ew_red, ew_yellow, ew_green : out std_logic;
        ped_wait, ped_walk, req_led : out std_logic);
end entity traffic_light_top;

architecture structural of traffic_light_top is
  signal s_tick_1s, s_btn_pulse, s_req_pending : std_logic;
  signal s_state : t_state;
begin
  u_tick : entity work.tick_generator
    generic map(G_CLK_FREQ_HZ => 100_000_000)
    port map(clk=>clk, rst=>rst, tick_1s=>s_tick_1s);
  u_btn : entity work.button_conditioner
    generic map(G_DEBOUNCE_TICKS => 20)
    port map(clk=>clk, rst=>rst, btn_raw=>btn_ped, btn_pulse=>s_btn_pulse);
  u_fsm : entity work.traffic_light_fsm
    port map(clk=>clk, rst=>rst, tick_1s=>s_tick_1s,
             ped_btn_pulse=>s_btn_pulse, state_out=>s_state,
             request_pending=>s_req_pending);
  u_dec : entity work.traffic_light_output_decoder
    port map(state_in=>s_state, req_pending=>s_req_pending,
             ns_red=>ns_red, ns_yellow=>ns_yellow, ns_green=>ns_green,
             ew_red=>ew_red, ew_yellow=>ew_yellow, ew_green=>ew_green,
             ped_wait=>ped_wait, ped_walk=>ped_walk, req_led=>req_led);
end architecture structural;