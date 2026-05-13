entity BCD_adder_tb is
end entity BCD_adder_tb;

architecture tb of BCD_adder_tb is

    component BCD_adder is
        port (
            A    : in  bit_vector(3 downto 0);
            B    : in  bit_vector(3 downto 0);
            Cin  : in  bit;
            Sum  : out bit_vector(3 downto 0);
            Cout : out bit
        );
    end component;

    signal A_tb    : bit_vector(3 downto 0) := "0000";
    signal B_tb    : bit_vector(3 downto 0) := "0000";
    signal Cin_tb  : bit := '0';
    signal Sum_tb  : bit_vector(3 downto 0);
    signal Cout_tb : bit;

begin

    DUT : BCD_adder
        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            Sum  => Sum_tb,
            Cout => Cout_tb
        );

    stimulus : process
    begin

        -- Test 1: 0 + 0 + 0 = 0
        A_tb <= "0000";
        B_tb <= "0000";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '0'
            report "Test 1 failed: 0 + 0 + 0"
            severity error;

        -- Test 2: 2 + 3 + 0 = 5
        A_tb <= "0010";
        B_tb <= "0011";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "0101" and Cout_tb = '0'
            report "Test 2 failed: 2 + 3 + 0"
            severity error;

        -- Test 3: 4 + 5 + 0 = 9
        A_tb <= "0100";
        B_tb <= "0101";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "1001" and Cout_tb = '0'
            report "Test 3 failed: 4 + 5 + 0"
            severity error;

        -- Test 4: 5 + 5 + 0 = 10
        -- BCD result: Sum = 0000, Cout = 1
        A_tb <= "0101";
        B_tb <= "0101";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1'
            report "Test 4 failed: 5 + 5 + 0"
            severity error;

        -- Test 5: 9 + 0 + 1 = 10
        -- BCD result: Sum = 0000, Cout = 1
        A_tb <= "1001";
        B_tb <= "0000";
        Cin_tb <= '1';
        wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1'
            report "Test 5 failed: 9 + 0 + 1"
            severity error;

        -- Test 6: 8 + 1 + 0 = 9
        A_tb <= "1000";
        B_tb <= "0001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "1001" and Cout_tb = '0'
            report "Test 6 failed: 8 + 1 + 0"
            severity error;

        -- Test 7: 7 + 8 + 0 = 15
        -- BCD result: Sum = 0101, Cout = 1
        A_tb <= "0111";
        B_tb <= "1000";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "0101" and Cout_tb = '1'
            report "Test 7 failed: 7 + 8 + 0"
            severity error;

        -- Test 8: 9 + 9 + 0 = 18
        -- BCD result: Sum = 1000, Cout = 1
        A_tb <= "1001";
        B_tb <= "1001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "1000" and Cout_tb = '1'
            report "Test 8 failed: 9 + 9 + 0"
            severity error;

        -- Test 9: 9 + 9 + 1 = 19
        -- BCD result: Sum = 1001, Cout = 1
        A_tb <= "1001";
        B_tb <= "1001";
        Cin_tb <= '1';
        wait for 10 ns;
        assert Sum_tb = "1001" and Cout_tb = '1'
            report "Test 9 failed: 9 + 9 + 1"
            severity error;

        -- Test 10: 3 + 6 + 1 = 10
        -- BCD result: Sum = 0000, Cout = 1
        A_tb <= "0011";
        B_tb <= "0110";
        Cin_tb <= '1';
        wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1'
            report "Test 10 failed: 3 + 6 + 1"
            severity error;

        -- Test 11: 1 + 8 + 1 = 10
        -- BCD result: Sum = 0000, Cout = 1
        A_tb <= "0001";
        B_tb <= "1000";
        Cin_tb <= '1';
        wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1'
            report "Test 11 failed: 1 + 8 + 1"
            severity error;

        -- Test 12: 6 + 6 + 0 = 12
        -- BCD result: Sum = 0010, Cout = 1
        A_tb <= "0110";
        B_tb <= "0110";
        Cin_tb <= '0';
        wait for 10 ns;
        assert Sum_tb = "0010" and Cout_tb = '1'
            report "Test 12 failed: 6 + 6 + 0"
            severity error;

        report "Simulation finished successfully: BCD_adder testbench passed."
            severity note;

        wait;

    end process;

end architecture tb;
