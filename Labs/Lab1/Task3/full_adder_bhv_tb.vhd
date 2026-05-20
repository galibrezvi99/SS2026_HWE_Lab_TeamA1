-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : full_adder_bhv_tb.vhd
-- Exercise    : Lab 01 - Exercise 03
-- Purpose     : Testbench for 1-bit Full Adder
-- Data type   : BIT only
-- Test style  : No process block
--
-- Tested input combinations:
--   A B CIN
--   0 0 0
--   0 0 1
--   0 1 0
--   0 1 1
--   1 0 0
--   1 0 1
--   1 1 0
--   1 1 1
-- ============================================================


entity full_adder_bhv_tb is
end full_adder_bhv_tb;


architecture test of full_adder_bhv_tb is

    -- Component declaration for design under test
    component full_adder_bhv is
        port (
            A    : in bit;
            B    : in bit;
            CIN  : in bit;
            SUM  : out bit;
            COUT : out bit
        );
    end component;

    -- Testbench signals
    signal A_tb    : bit;
    signal B_tb    : bit;
    signal CIN_tb  : bit;
    signal SUM_tb  : bit;
    signal COUT_tb : bit;

begin

    -- Instantiate design under test
    DUT : full_adder_bhv
        port map (
            A    => A_tb,
            B    => B_tb,
            CIN  => CIN_tb,
            SUM  => SUM_tb,
            COUT => COUT_tb
        );

    -- Input A waveform
    A_tb <= '0',
            '0' after 10 ns,
            '0' after 20 ns,
            '0' after 30 ns,
            '1' after 40 ns,
            '1' after 50 ns,
            '1' after 60 ns,
            '1' after 70 ns;

    -- Input B waveform
    B_tb <= '0',
            '0' after 10 ns,
            '1' after 20 ns,
            '1' after 30 ns,
            '0' after 40 ns,
            '0' after 50 ns,
            '1' after 60 ns,
            '1' after 70 ns;

    -- Carry input waveform
    CIN_tb <= '0',
              '1' after 10 ns,
              '0' after 20 ns,
              '1' after 30 ns,
              '0' after 40 ns,
              '1' after 50 ns,
              '0' after 60 ns,
              '1' after 70 ns;

end test;
