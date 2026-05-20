-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : half_subtractor_tb.vhd
-- Exercise    : Lab 01 - Exercise 04
-- Purpose     : Testbench for 1-bit Half Subtractor
-- Data type   : BIT only
-- Test style  : No process block
--
-- Tested input combinations:
--   A B
--   0 0
--   0 1
--   1 0
--   1 1
-- ============================================================


entity half_subtractor_tb is
end half_subtractor_tb;


architecture test of half_subtractor_tb is

    -- Component declaration for design under test
    component half_subtractor is
        port (
            A      : in bit;
            B      : in bit;
            DIFF   : out bit;
            BORROW : out bit
        );
    end component;

    -- Testbench signals
    signal A_tb      : bit;
    signal B_tb      : bit;
    signal DIFF_tb   : bit;
    signal BORROW_tb : bit;

begin

    -- Instantiate design under test
    DUT : half_subtractor
        port map (
            A      => A_tb,
            B      => B_tb,
            DIFF   => DIFF_tb,
            BORROW => BORROW_tb
        );

    -- Input A waveform
    A_tb <= '0',
            '0' after 10 ns,
            '1' after 20 ns,
            '1' after 30 ns;

    -- Input B waveform
    B_tb <= '0',
            '1' after 10 ns,
            '0' after 20 ns,
            '1' after 30 ns;

end test;
