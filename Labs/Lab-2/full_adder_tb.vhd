entity full_adder_tb is
end entity full_adder_tb;

architecture tb of full_adder_tb is

    component full_adder is
        port (
            A    : in  bit;
            B    : in  bit;
            Cin  : in  bit;
            S    : out bit;
            Cout : out bit
        );
    end component;

    signal A_tb    : bit := '0';
    signal B_tb    : bit := '0';
    signal Cin_tb  : bit := '0';
    signal S_tb    : bit;
    signal Cout_tb : bit;

begin

    DUT : full_adder
        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb
        );

    stimulus : process
    begin

        -- Test case 1: 0 + 0 + 0 = 0
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = '0' and Cout_tb = '0'
            report "Error for A=0 B=0 Cin=0"
            severity error;

        -- Test case 2: 0 + 0 + 1 = 1
        A_tb <= '0';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = '1' and Cout_tb = '0'
            report "Error for A=0 B=0 Cin=1"
            severity error;

        -- Test case 3: 0 + 1 + 0 = 1
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = '1' and Cout_tb = '0'
            report "Error for A=0 B=1 Cin=0"
            severity error;

        -- Test case 4: 0 + 1 + 1 = 2
        A_tb <= '0';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = '0' and Cout_tb = '1'
            report "Error for A=0 B=1 Cin=1"
            severity error;

        -- Test case 5: 1 + 0 + 0 = 1
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = '1' and Cout_tb = '0'
            report "Error for A=1 B=0 Cin=0"
            severity error;

        -- Test case 6: 1 + 0 + 1 = 2
        A_tb <= '1';
        B_tb <= '0';
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = '0' and Cout_tb = '1'
            report "Error for A=1 B=0 Cin=1"
            severity error;

        -- Test case 7: 1 + 1 + 0 = 2
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = '0' and Cout_tb = '1'
            report "Error for A=1 B=1 Cin=0"
            severity error;

        -- Test case 8: 1 + 1 + 1 = 3
        A_tb <= '1';
        B_tb <= '1';
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = '1' and Cout_tb = '1'
            report "Error for A=1 B=1 Cin=1"
            severity error;

        report "Simulation finished successfully: all 8 test cases passed."
            severity note;

        wait;

    end process;

end architecture tb;
