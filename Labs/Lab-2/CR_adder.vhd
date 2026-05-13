entity CR_adder is
    port (
        A    : in  bit_vector(3 downto 0);
        B    : in  bit_vector(3 downto 0);
        Cin  : in  bit;
        S    : out bit_vector(3 downto 0);
        Cout : out bit
    );
end entity CR_adder;

architecture structural of CR_adder is

    component full_adder is
        port (
            A    : in  bit;
            B    : in  bit;
            Cin  : in  bit;
            S    : out bit;
            Cout : out bit
        );
    end component;

    signal c1 : bit;
    signal c2 : bit;
    signal c3 : bit;

begin

    FA0 : full_adder
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => Cin,
            S    => S(0),
            Cout => c1
        );

    FA1 : full_adder
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => c1,
            S    => S(1),
            Cout => c2
        );

    FA2 : full_adder
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => c2,
            S    => S(2),
            Cout => c3
        );

    FA3 : full_adder
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => c3,
            S    => S(3),
            Cout => Cout
        );

end architecture structural;
