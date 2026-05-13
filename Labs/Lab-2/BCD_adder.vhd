entity BCD_adder is
    port (
        A    : in  bit_vector(3 downto 0);
        B    : in  bit_vector(3 downto 0);
        Cin  : in  bit;
        Sum  : out bit_vector(3 downto 0);
        Cout : out bit
    );
end entity BCD_adder;

architecture structural of BCD_adder is

    component CR_adder is
        port (
            A    : in  bit_vector(3 downto 0);
            B    : in  bit_vector(3 downto 0);
            Cin  : in  bit;
            S    : out bit_vector(3 downto 0);
            Cout : out bit
        );
    end component;

    signal first_sum  : bit_vector(3 downto 0);
    signal first_cout : bit;

    signal correction_needed : bit;
    signal correction_value  : bit_vector(3 downto 0);

    signal second_cout : bit;

begin

    -- First addition: A + B + Cin
    ADD1 : CR_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => first_sum,
            Cout => first_cout
        );

    -- BCD correction is needed if:
    -- 1. First addition gives carry, or
    -- 2. First sum is greater than 9
    --
    -- Greater than 9 condition for 4-bit binary:
    -- first_sum > 1001 when first_sum(3) = 1 and
    -- either first_sum(2) = 1 or first_sum(1) = 1
    correction_needed <= first_cout or
                         (first_sum(3) and (first_sum(2) or first_sum(1)));

    -- If correction is needed, add 0110.
    -- Otherwise, add 0000.
    correction_value <= "0110" when correction_needed = '1' else "0000";

    -- Second addition: first_sum + correction_value
    ADD2 : CR_adder
        port map (
            A    => first_sum,
            B    => correction_value,
            Cin  => '0',
            S    => Sum,
            Cout => second_cout
        );

    -- Decimal carry output
    Cout <= correction_needed;

end architecture structural;
