entity CR_add_sub is
    port (
        A    : in  bit_vector(3 downto 0);
        B    : in  bit_vector(3 downto 0);
        mode : in  bit;
        S    : out bit_vector(3 downto 0);
        Cout : out bit
    );
end entity CR_add_sub;

architecture structural of CR_add_sub is

    component CR_adder is
        port (
            A    : in  bit_vector(3 downto 0);
            B    : in  bit_vector(3 downto 0);
            Cin  : in  bit;
            S    : out bit_vector(3 downto 0);
            Cout : out bit
        );
    end component;

    signal B_internal : bit_vector(3 downto 0);

begin

    -- XOR each bit of B with mode.
    -- mode = 0: B_internal = B
    -- mode = 1: B_internal = not B
    B_internal(0) <= B(0) xor mode;
    B_internal(1) <= B(1) xor mode;
    B_internal(2) <= B(2) xor mode;
    B_internal(3) <= B(3) xor mode;

    RCA1 : CR_adder
        port map (
            A    => A,
            B    => B_internal,
            Cin  => mode,
            S    => S,
            Cout => Cout
        );

end architecture structural;
