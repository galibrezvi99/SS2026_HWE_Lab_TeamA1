entity CR_add_sub_tb is
end entity CR_add_sub_tb;

architecture tb of CR_add_sub_tb is

    component CR_add_sub is
        port (
            A    : in  bit_vector(3 downto 0);
            B    : in  bit_vector(3 downto 0);
            mode : in  bit;
            S    : out bit_vector(3 downto 0);
            Cout : out bit
        );
    end component;

    signal A_tb    : bit_vector(3 downto 0) := "0000";
    signal B_tb    : bit_vector(3 downto 0) := "0000";
    signal mode_tb : bit := '0';
    signal S_tb    : bit_vector(3 downto 0);
    signal Cout_tb : bit;

begin

    DUT : CR_add_sub
        port map (
            A    => A_tb,
            B    => B_tb,
            mode => mode_tb,
            S    => S_tb,
            Cout => Cout_tb
        );

    stimulus : process
    begin

        ----------------------------------------------------------------
        -- Addition tests: mode = 0
        ----------------------------------------------------------------

        -- Test 1: 0 + 0 = 0
        A_tb <= "0000";
        B_tb <= "0000";
        mode_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0000" and Cout_tb = '0'
            report "Addition Test 1 failed"
            severity error;

        -- Test 2: 2 + 3 = 5
        A_tb <= "0010";
        B_tb <= "0011";
        mode_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0101" and Cout_tb = '0'
            report "Addition Test 2 failed"
            severity error;

        -- Test 3: 5 + 3 = 8
        A_tb <= "0101";
        B_tb <= "0011";
        mode_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1000" and Cout_tb = '0'
            report "Addition Test 3 failed"
            severity error;

        -- Test 4: 15 + 1 = 16
        -- 4-bit result = 0000, Cout = 1
        A_tb <= "1111";
        B_tb <= "0001";
        mode_tb <= '0';
        wait for 10 ns;
        assert S_tb = "0000" and Cout_tb = '1'
            report "Addition Test 4 failed"
            severity error;

        -- Test 5: 15 + 15 = 30
        -- 30 decimal = 11110 binary
        -- 4-bit result = 1110, Cout = 1
        A_tb <= "1111";
        B_tb <= "1111";
        mode_tb <= '0';
        wait for 10 ns;
        assert S_tb = "1110" and Cout_tb = '1'
            report "Addition Test 5 failed"
            severity error;

        ----------------------------------------------------------------
        -- Subtraction tests: mode = 1
        ----------------------------------------------------------------

        -- Test 6: 5 - 3 = 2
        A_tb <= "0101";
        B_tb <= "0011";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "0010" and Cout_tb = '1'
            report "Subtraction Test 6 failed"
            severity error;

        -- Test 7: 7 - 7 = 0
        A_tb <= "0111";
        B_tb <= "0111";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "0000" and Cout_tb = '1'
            report "Subtraction Test 7 failed"
            severity error;

        -- Test 8: 8 - 1 = 7
        A_tb <= "1000";
        B_tb <= "0001";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "0111" and Cout_tb = '1'
            report "Subtraction Test 8 failed"
            severity error;

        -- Test 9: 3 - 5 = -2
        -- In 4-bit two's complement, -2 = 1110
        -- Cout = 0 means borrow occurred
        A_tb <= "0011";
        B_tb <= "0101";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "1110" and Cout_tb = '0'
            report "Subtraction Test 9 failed"
            severity error;

        -- Test 10: 0 - 1 = -1
        -- In 4-bit two's complement, -1 = 1111
        -- Cout = 0 means borrow occurred
        A_tb <= "0000";
        B_tb <= "0001";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "1111" and Cout_tb = '0'
            report "Subtraction Test 10 failed"
            severity error;

        -- Test 11: 15 - 1 = 14
        A_tb <= "1111";
        B_tb <= "0001";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "1110" and Cout_tb = '1'
            report "Subtraction Test 11 failed"
            severity error;

        -- Test 12: 10 - 6 = 4
        A_tb <= "1010";
        B_tb <= "0110";
        mode_tb <= '1';
        wait for 10 ns;
        assert S_tb = "0100" and Cout_tb = '1'
            report "Subtraction Test 12 failed"
            severity error;

        report "Simulation finished successfully: CR_add_sub testbench passed."
            severity note;

        wait;

    end process;

end architecture tb;
