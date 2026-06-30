library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package traffic_light_pkg is
  type t_state is (
    S0_RESET, S1_NS_GREEN, S2_NS_YELLOW, S3_ALL_RED_1,
    S4_EW_GREEN, S5_EW_YELLOW, S6_ALL_RED_2,
    S7_PED_WALK, S8_PED_CLEAR
  );
  constant C_NS_GREEN_TIME  : integer := 5;
  constant C_EW_GREEN_TIME  : integer := 5;
  constant C_YELLOW_TIME    : integer := 2;
  constant C_ALLRED_TIME    : integer := 1;
  constant C_WALK_TIME      : integer := 4;
  constant C_PEDCLEAR_TIME  : integer := 2;
  constant C_STARTUP_TIME   : integer := 1;
end package traffic_light_pkg;