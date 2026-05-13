entity full_adder is
    port (
        A    : in  bit;
        B    : in  bit;
        Cin  : in  bit;
        S    : out bit;
        Cout : out bit
    );
end entity full_adder;

architecture structural of full_adder is

    component half_adder is
        port (
            A : in  bit;
            B : in  bit;
            S : out bit;
            C : out bit
        );
    end component;

    signal s_intermediate : bit;
    signal c1             : bit;
    signal c2             : bit;

begin

    HA1 : half_adder
        port map (
            A => A,
            B => B,
            S => s_intermediate,
            C => c1
        );

    HA2 : half_adder
        port map (
            A => s_intermediate,
            B => Cin,
            S => S,
            C => c2
        );

    Cout <= c1 or c2;

end architecture structural;
