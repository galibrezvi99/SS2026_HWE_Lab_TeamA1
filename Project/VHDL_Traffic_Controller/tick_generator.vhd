library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tick_generator is
  generic (G_CLK_FREQ_HZ : integer := 100_000_000);
  port (clk : in std_logic; rst : in std_logic; tick_1s : out std_logic);
end entity tick_generator;

architecture rtl of tick_generator is
  signal r_counter : integer range 0 to 100_000_000 - 1 := 0;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        r_counter <= 0; tick_1s <= '0';
      elsif r_counter = G_CLK_FREQ_HZ - 1 then
        r_counter <= 0; tick_1s <= '1';
      else
        r_counter <= r_counter + 1; tick_1s <= '0';
      end if;
    end if;
  end process;
end architecture rtl;