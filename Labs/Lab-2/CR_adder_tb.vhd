entity CR_adder_tb is
end entity CR_adder_tb;

architecture tb of CR_adder_tb is

    component CR_adder is
        port (
            A    : in  bit_vector(3 downto 0);
            B    : in  bit_vector(3 downto 0);
            Cin  : in  bit;
            S    : out bit_vector(3 downto 0);
            Cout : out bit
        );
    end component;

    signal A_tb    : bit_vector(3 downto 0) := "0000";
    signal B_tb    : bit_vector(3 downto 0) := "0000";
    signal Cin_tb  : bit := '0';
    signal S_tb    : bit_vector(3 downto 0);
    signal Cout_tb : bit;

begin

    DUT : CR_adder
        port map (
            A    => A_tb,
            B    => B_tb,
            Cin  => Cin_tb,
            S    => S_tb,
            Cout => Cout_tb
        );

    stimulus : process
    begin

        -- Test 1: 0 + 0 + 0 = 0
        A_tb <= "0000";
        B_tb <= "0000";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0000" and Cout_tb = '0'
            report "Test 1 failed"
            severity error;

        -- Test 2: 0 + 0 + 1 = 1
        A_tb <= "0000";
        B_tb <= "0000";
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = "0001" and Cout_tb = '0'
            report "Test 2 failed"
            severity error;

        -- Test 3: 1 + 1 + 0 = 2
        A_tb <= "0001";
        B_tb <= "0001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0010" and Cout_tb = '0'
            report "Test 3 failed"
            severity error;

        -- Test 4: 2 + 3 + 0 = 5
        A_tb <= "0010";
        B_tb <= "0011";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0101" and Cout_tb = '0'
            report "Test 4 failed"
            severity error;

        -- Test 5: 5 + 3 + 0 = 8
        A_tb <= "0101";
        B_tb <= "0011";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1000" and Cout_tb = '0'
            report "Test 5 failed"
            severity error;

        -- Test 6: 7 + 1 + 0 = 8
        A_tb <= "0111";
        B_tb <= "0001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1000" and Cout_tb = '0'
            report "Test 6 failed"
            severity error;

        -- Test 7: 8 + 1 + 0 = 9
        A_tb <= "1000";
        B_tb <= "0001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1001" and Cout_tb = '0'
            report "Test 7 failed"
            severity error;

        -- Test 8: 9 + 6 + 0 = 15
        A_tb <= "1001";
        B_tb <= "0110";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1111" and Cout_tb = '0'
            report "Test 8 failed"
            severity error;

        -- Test 9: 15 + 0 + 0 = 15
        A_tb <= "1111";
        B_tb <= "0000";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1111" and Cout_tb = '0'
            report "Test 9 failed"
            severity error;

        -- Test 10: 15 + 1 + 0 = 16
        -- 4-bit result = 0000, Cout = 1
        A_tb <= "1111";
        B_tb <= "0001";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0000" and Cout_tb = '1'
            report "Test 10 failed"
            severity error;

        -- Test 11: 15 + 15 + 0 = 30
        -- 30 decimal = 11110 binary
        -- 4-bit result = 1110, Cout = 1
        A_tb <= "1111";
        B_tb <= "1111";
        Cin_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1110" and Cout_tb = '1'
            report "Test 11 failed"
            severity error;

        -- Test 12: 15 + 15 + 1 = 31
        -- 31 decimal = 11111 binary
        -- 4-bit result = 1111, Cout = 1
        A_tb <= "1111";
        B_tb <= "1111";
        Cin_tb <= '1';
        wait for 10 ns;
        assert S_tb = "1111" and Cout_tb = '1'
            report "Test 12 failed"
            severity error;

        report "Simulation finished successfully: CR_adder testbench passed."
            severity note;

        wait;

    end process;

end architecture tb;