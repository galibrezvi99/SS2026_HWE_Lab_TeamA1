library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity button_conditioner is
  generic (G_DEBOUNCE_TICKS : integer := 20);
  port (clk : in std_logic; rst : in std_logic;
        btn_raw : in std_logic; btn_pulse : out std_logic);
end entity button_conditioner;

architecture rtl of button_conditioner is
  signal r_sync0, r_sync1 : std_logic := '0';
  signal r_debounce_cnt   : integer range 0 to 20 := 0;
  signal r_stable         : std_logic := '0';
  signal r_prev_stable    : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r_sync0 <= '0'; r_sync1 <= '0';
        r_debounce_cnt <= 0; r_stable <= '0';
        r_prev_stable <= '0'; btn_pulse <= '0';
      else
        r_sync0 <= btn_raw; r_sync1 <= r_sync0;
        if r_sync1 = r_stable then
          r_debounce_cnt <= 0;
        else
          if r_debounce_cnt = G_DEBOUNCE_TICKS then
            r_stable <= r_sync1; r_debounce_cnt <= 0;
          else
            r_debounce_cnt <= r_debounce_cnt + 1;
          end if;
        end if;
        r_prev_stable <= r_stable;
        if r_stable = '1' and r_prev_stable = '0' then
          btn_pulse <= '1';
        else
          btn_pulse <= '0';
        end if;
      end if;
    end if;
  end process;
end architecture rtl;