-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : half_subtractor.vhd
-- Exercise    : Lab 01 - Exercise 04
-- Circuit     : 1-bit Half Subtractor
-- Design type : Structural VHDL
-- Data type   : BIT only
--
-- Inputs:
--   A      : minuend input
--   B      : subtrahend input
--
-- Outputs:
--   DIFF   : difference output
--   BORROW : borrow output
--
-- Logic:
--   DIFF   = A xor B
--   BORROW = not A and B
-- ============================================================


-- ============================================================
-- XOR GATE FOR HALF SUBTRACTOR
-- ============================================================

entity hs_xor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end hs_xor_gate;

architecture dataflow of hs_xor_gate is
begin
    Y <= A xor B;
end dataflow;


-- ============================================================
-- AND GATE FOR HALF SUBTRACTOR
-- ============================================================

entity hs_and_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end hs_and_gate;

architecture dataflow of hs_and_gate is
begin
    Y <= A and B;
end dataflow;


-- ============================================================
-- NOT GATE FOR HALF SUBTRACTOR
-- ============================================================

entity hs_not_gate is
    port (
        A : in bit;
        Y : out bit
    );
end hs_not_gate;

architecture dataflow of hs_not_gate is
begin
    Y <= not A;
end dataflow;


-- ============================================================
-- MAIN HALF SUBTRACTOR ENTITY
-- ============================================================

entity half_subtractor is
    port (
        A      : in bit;
        B      : in bit;
        DIFF   : out bit;
        BORROW : out bit
    );
end half_subtractor;


-- ============================================================
-- STRUCTURAL ARCHITECTURE OF HALF SUBTRACTOR
-- ============================================================

architecture structural of half_subtractor is

    -- XOR component declaration
    component hs_xor_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- AND component declaration
    component hs_and_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- NOT component declaration
    component hs_not_gate is
        port (
            A : in bit;
            Y : out bit
        );
    end component;

    -- Internal signal for not A
    signal not_a : bit;

begin

    -- DIFF = A xor B
    XOR1 : hs_xor_gate
        port map (
            A => A,
            B => B,
            Y => DIFF
        );

    -- not_a = not A
    NOT1 : hs_not_gate
        port map (
            A => A,
            Y => not_a
        );

    -- BORROW = not_a and B
    AND1 : hs_and_gate
        port map (
            A => not_a,
            B => B,
            Y => BORROW
        );

end structural;
