-- ============================================================
-- Team        : C3
-- Student     : Md Riajul Islam
-- File name   : full_subtractor_bhv.vhd
-- Exercise    : Lab 01 - Exercise 05
-- Circuit     : 1-bit Full Subtractor
-- Design type : Structural VHDL
-- Data type   : BIT only
--
-- Inputs:
--   A    : minuend input
--   B    : subtrahend input
--   BIN  : borrow input
--
-- Outputs:
--   DIFF : difference output
--   BOUT : borrow output
--
-- Logic:
--   DIFF = A xor B xor BIN
--   BOUT = (not A and B) or (BIN and not (A xor B))
--
-- Note:
--   File name contains bhv because lab asks for this name.
--   Code is structural because that is the requested method.
-- ============================================================


-- ============================================================
-- XOR GATE FOR FULL SUBTRACTOR
-- ============================================================

entity fs_xor_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fs_xor_gate;

architecture dataflow of fs_xor_gate is
begin
    Y <= A xor B;
end dataflow;


-- ============================================================
-- AND GATE FOR FULL SUBTRACTOR
-- ============================================================

entity fs_and_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fs_and_gate;

architecture dataflow of fs_and_gate is
begin
    Y <= A and B;
end dataflow;


-- ============================================================
-- OR GATE FOR FULL SUBTRACTOR
-- ============================================================

entity fs_or_gate is
    port (
        A : in bit;
        B : in bit;
        Y : out bit
    );
end fs_or_gate;

architecture dataflow of fs_or_gate is
begin
    Y <= A or B;
end dataflow;


-- ============================================================
-- NOT GATE FOR FULL SUBTRACTOR
-- ============================================================

entity fs_not_gate is
    port (
        A : in bit;
        Y : out bit
    );
end fs_not_gate;

architecture dataflow of fs_not_gate is
begin
    Y <= not A;
end dataflow;


-- ============================================================
-- MAIN FULL SUBTRACTOR ENTITY
-- ============================================================

entity full_subtractor_bhv is
    port (
        A    : in bit;
        B    : in bit;
        BIN  : in bit;
        DIFF : out bit;
        BOUT : out bit
    );
end full_subtractor_bhv;


-- ============================================================
-- STRUCTURAL ARCHITECTURE OF FULL SUBTRACTOR
-- ============================================================

architecture structural of full_subtractor_bhv is

    -- XOR component declaration
    component fs_xor_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- AND component declaration
    component fs_and_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- OR component declaration
    component fs_or_gate is
        port (
            A : in bit;
            B : in bit;
            Y : out bit
        );
    end component;

    -- NOT component declaration
    component fs_not_gate is
        port (
            A : in bit;
            Y : out bit
        );
    end component;

    -- Internal signals
    signal xor_ab       : bit;  -- A xor B
    signal not_a        : bit;  -- not A
    signal not_xor_ab   : bit;  -- not (A xor B)
    signal borrow_part1 : bit;  -- not A and B
    signal borrow_part2 : bit;  -- BIN and not_xor_ab

begin

    -- xor_ab = A xor B
    XOR1 : fs_xor_gate
        port map (
            A => A,
            B => B,
            Y => xor_ab
        );

    -- DIFF = xor_ab xor BIN
    XOR2 : fs_xor_gate
        port map (
            A => xor_ab,
            B => BIN,
            Y => DIFF
        );

    -- not_a = not A
    NOT1 : fs_not_gate
        port map (
            A => A,
            Y => not_a
        );

    -- not_xor_ab = not xor_ab
    NOT2 : fs_not_gate
        port map (
            A => xor_ab,
            Y => not_xor_ab
        );

    -- borrow_part1 = not_a and B
    AND1 : fs_and_gate
        port map (
            A => not_a,
            B => B,
            Y => borrow_part1
        );

    -- borrow_part2 = BIN and not_xor_ab
    AND2 : fs_and_gate
        port map (
            A => BIN,
            B => not_xor_ab,
            Y => borrow_part2
        );

    -- BOUT = borrow_part1 or borrow_part2
    OR1 : fs_or_gate
        port map (
            A => borrow_part1,
            B => borrow_part2,
            Y => BOUT
        );

end structural;
