-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : half_adder_tb.vhd
-- Exercise    : Lab 01 - Exercise 02
-- Purpose     : Testbench for 1-bit Half Adder
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


-- ============================================================
-- TESTBENCH ENTITY
-- Testbench has no input or output ports.
-- ============================================================

entity half_adder_tb is
end half_adder_tb;


-- ============================================================
-- TESTBENCH ARCHITECTURE
-- ============================================================

architecture test of half_adder_tb is

    -- Component declaration for design under test
    component half_adder is
        port (
            A     : in bit;
            B     : in bit;
            SUM   : out bit;
            CARRY : out bit
        );
    end component;

    -- Testbench signals
    signal A_tb     : bit;   -- connected to input A
    signal B_tb     : bit;   -- connected to input B
    signal SUM_tb   : bit;   -- connected to output SUM
    signal CARRY_tb : bit;   -- connected to output CARRY

begin

    -- Instantiate design under test
    DUT : half_adder
        port map (
            A     => A_tb,
            B     => B_tb,
            SUM   => SUM_tb,
            CARRY => CARRY_tb
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
