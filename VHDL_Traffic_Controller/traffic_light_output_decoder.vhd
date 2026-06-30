library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.traffic_light_pkg.all;

entity traffic_light_output_decoder is
  port (state_in : in t_state; req_pending : in std_logic;
        ns_red, ns_yellow, ns_green : out std_logic;
        ew_red, ew_yellow, ew_green : out std_logic;
        ped_wait, ped_walk, req_led : out std_logic);
end entity traffic_light_output_decoder;

architecture rtl of traffic_light_output_decoder is
begin
  req_led <= req_pending;
  process(state_in)
  begin
    ns_red<='1'; ns_yellow<='0'; ns_green<='0';
    ew_red<='1'; ew_yellow<='0'; ew_green<='0';
    ped_wait<='1'; ped_walk<='0';
    case state_in is
      when S1_NS_GREEN  => ns_red<='0'; ns_green<='1';
      when S2_NS_YELLOW => ns_red<='0'; ns_yellow<='1';
      when S4_EW_GREEN  => ew_red<='0'; ew_green<='1';
      when S5_EW_YELLOW => ew_red<='0'; ew_yellow<='1';
      when S7_PED_WALK  => ped_wait<='0'; ped_walk<='1';
      when others => null;
    end case;
  end process;
end architecture rtl;