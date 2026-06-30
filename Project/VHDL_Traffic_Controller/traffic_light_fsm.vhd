library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.traffic_light_pkg.all;

entity traffic_light_fsm is
  port (clk : in std_logic; rst : in std_logic;
        tick_1s : in std_logic; ped_btn_pulse : in std_logic;
        state_out : out t_state; request_pending : out std_logic);
end entity traffic_light_fsm;

architecture rtl of traffic_light_fsm is
  signal r_state       : t_state   := S0_RESET;
  signal r_timer       : integer   := 0;
  signal r_req_pending : std_logic := '0';
begin
  state_out       <= r_state;
  request_pending <= r_req_pending;

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r_state <= S0_RESET; r_timer <= 0; r_req_pending <= '0';
      else
        if ped_btn_pulse = '1' then r_req_pending <= '1'; end if;
        if tick_1s = '1' then
          r_timer <= r_timer + 1;
          case r_state is
            when S0_RESET =>
              if r_timer >= C_STARTUP_TIME-1 then r_state <= S1_NS_GREEN; r_timer <= 0; end if;
            when S1_NS_GREEN =>
              if r_timer >= C_NS_GREEN_TIME-1 then r_state <= S2_NS_YELLOW; r_timer <= 0; end if;
            when S2_NS_YELLOW =>
              if r_timer >= C_YELLOW_TIME-1 then r_state <= S3_ALL_RED_1; r_timer <= 0; end if;
            when S3_ALL_RED_1 =>
              if r_timer >= C_ALLRED_TIME-1 then r_state <= S4_EW_GREEN; r_timer <= 0; end if;
            when S4_EW_GREEN =>
              if r_timer >= C_EW_GREEN_TIME-1 then r_state <= S5_EW_YELLOW; r_timer <= 0; end if;
            when S5_EW_YELLOW =>
              if r_timer >= C_YELLOW_TIME-1 then r_state <= S6_ALL_RED_2; r_timer <= 0; end if;
            when S6_ALL_RED_2 =>
              if r_timer >= C_ALLRED_TIME-1 then
                r_timer <= 0;
                if r_req_pending = '1' then r_state <= S7_PED_WALK;
                else r_state <= S1_NS_GREEN; end if;
              end if;
            when S7_PED_WALK =>
              r_req_pending <= '0';
              if r_timer >= C_WALK_TIME-1 then r_state <= S8_PED_CLEAR; r_timer <= 0; end if;
            when S8_PED_CLEAR =>
              if r_timer >= C_PEDCLEAR_TIME-1 then r_state <= S1_NS_GREEN; r_timer <= 0; end if;
            when others => r_state <= S0_RESET; r_timer <= 0;
          end case;
        end if;
      end if;
    end if;
  end process;
end architecture rtl;