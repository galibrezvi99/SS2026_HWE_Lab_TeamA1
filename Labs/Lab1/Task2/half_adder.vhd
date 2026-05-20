-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : half_adder.vhd
-- Exercise    : Lab 01 - Exercise 02
-- Circuit     : 1-bit Half Adder
-- Design type : Structural VHDL
-- Data type   : BIT only
--
-- Inputs:
--   A     : first input bit
--   B     : second input bit
--
-- Outputs:
--   SUM   : sum output
--   CARRY : carry output
--
-- Logic:
--   SUM   = A xor B
--   CARRY = A and B
-- ============================================================


-- ============================================================
-- XOR GATE FOR HALF ADDER
-- ============================================================

entity ha_xor_gate is
    port (
        A : in bit;      -- first input
        B : in bit;      -- second input
        Y : out bit      -- XOR output
    );
end ha_xor_gate;

architecture dataflow of ha_xor_gate is
begin

    -- XOR output is 1 when inputs are different
    Y <= A xor B;

end dataflow;


-- ============================================================
-- AND GATE FOR HALF ADDER
-- ============================================================

entity ha_and_gate is
    port (
        A : in bit;      -- first input
        B : in bit;      -- second input
        Y : out bit      -- AND output
    );
end ha_and_gate;

architecture dataflow of ha_and_gate is
begin

    -- AND output is 1 only when both inputs are 1
    Y <= A and B;

end dataflow;


-- ============================================================
-- MAIN HALF ADDER ENTITY
-- ============================================================

entity half_adder is
    port (
        A     : in bit;      -- input A
        B     : in bit;      -- input B
        SUM   : out bit;     -- sum output
        CARRY : out bit      -- carry output
    );
end half_adder;


-- ============================================================
-- STRUCTURAL ARCHITECTURE OF HALF ADDER
-- ============================================================

architecture structural of half_adder is

    -- XOR component declaration
    component ha_xor_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- AND component declaration
    component ha_and_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

begin

    -- SUM = A xor B
    XOR1 : ha_xor_gate
        port map (
            A => A,
            B => B,
            Y => SUM
        );

    -- CARRY = A and B
    AND1 : ha_and_gate
        port map (
            A => A,
            B => B,
            Y => CARRY
        );

end structural;
