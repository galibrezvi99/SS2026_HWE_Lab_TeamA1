-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : full_adder_bhv.vhd
-- Exercise    : Lab 01 - Exercise 03
-- Circuit     : 1-bit Full Adder
-- Design type : Structural VHDL
-- Data type   : BIT only
--
-- Inputs:
--   A    : first input bit
--   B    : second input bit
--   CIN  : carry input
--
-- Outputs:
--   SUM  : sum output
--   COUT : carry output
--
-- Logic:
--   SUM  = A xor B xor CIN
--   COUT = (A and B) or (CIN and (A xor B))
--
-- Note:
--   File name contains bhv because lab asks for this name.
--   Code is structural because that is the requested method.
-- ============================================================


-- ============================================================
-- XOR GATE FOR FULL ADDER
-- ============================================================

entity fa_xor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fa_xor_gate;

architecture dataflow of fa_xor_gate is
begin
    Y <= A xor B;
end dataflow;


-- ============================================================
-- AND GATE FOR FULL ADDER
-- ============================================================

entity fa_and_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fa_and_gate;

architecture dataflow of fa_and_gate is
begin
    Y <= A and B;
end dataflow;


-- ============================================================
-- OR GATE FOR FULL ADDER
-- ============================================================

entity fa_or_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fa_or_gate;

architecture dataflow of fa_or_gate is
begin
    Y <= A or B;
end dataflow;


-- ============================================================
-- MAIN FULL ADDER ENTITY
-- ============================================================

entity full_adder_bhv is
    port (
        A    : in bit;
        B    : in bit;
        CIN  : in bit;
        SUM  : out bit;
        COUT : out bit
    );
end full_adder_bhv;


-- ============================================================
-- STRUCTURAL ARCHITECTURE OF FULL ADDER
-- ============================================================

architecture structural of full_adder_bhv is

    -- XOR gate component
    component fa_xor_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- AND gate component
    component fa_and_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- OR gate component
    component fa_or_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- Internal signals
    signal xor_ab      : bit;  -- stores A xor B
    signal and_ab      : bit;  -- stores A and B
    signal and_cin_xor : bit;  -- stores CIN and xor_ab

begin

    -- xor_ab = A xor B
    XOR1 : fa_xor_gate
        port map (
            A => A,
            B => B,
            Y => xor_ab
        );

    -- SUM = xor_ab xor CIN
    XOR2 : fa_xor_gate
        port map (
            A => xor_ab,
            B => CIN,
            Y => SUM
        );

    -- and_ab = A and B
    AND1 : fa_and_gate
        port map (
            A => A,
            B => B,
            Y => and_ab
        );

    -- and_cin_xor = CIN and xor_ab
    AND2 : fa_and_gate
        port map (
            A => CIN,
            B => xor_ab,
            Y => and_cin_xor
        );

    -- COUT = and_ab or and_cin_xor
    OR1 : fa_or_gate
        port map (
            A => and_ab,
            B => and_cin_xor,
            Y => COUT
        );

end structural;
