-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : full_subtractor_bhv_tb.vhd
-- Exercise    : Lab 01 - Exercise 05
-- Purpose     : Testbench for 1-bit Full Subtractor
-- Data type   : BIT only
-- Test style  : No process block
--
-- Tested input combinations:
--   A B BIN
--   0 0 0
--   0 0 1
--   0 1 0
--   0 1 1
--   1 0 0
--   1 0 1
--   1 1 0
--   1 1 1
-- ============================================================


entity full_subtractor_bhv_tb is
end full_subtractor_bhv_tb;


architecture test of full_subtractor_bhv_tb is

    -- Component declaration for design under test
    component full_subtractor_bhv is
        port (
            A    : in bit;
            B    : in bit;
            BIN  : in bit;
            DIFF : out bit;
            BOUT : out bit
        );
    end component;

    -- Testbench signals
    signal A_tb    : bit;
    signal B_tb    : bit;
    signal BIN_tb  : bit;
    signal DIFF_tb : bit;
    signal BOUT_tb : bit;

begin

    -- Instantiate design under test
    DUT : full_subtractor_bhv
        port map (
            A    => A_tb,
            B    => B_tb,
            BIN  => BIN_tb,
            DIFF => DIFF_tb,
            BOUT => BOUT_tb
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

    -- Borrow input waveform
    BIN_tb <= '0',
              '1' after 10 ns,
              '0' after 20 ns,
              '1' after 30 ns,
              '0' after 40 ns,
              '1' after 50 ns,
              '0' after 60 ns,
              '1' after 70 ns;

end test;
