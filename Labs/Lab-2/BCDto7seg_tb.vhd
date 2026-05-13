entity BCDto7seg_tb is
end entity BCDto7seg_tb;

architecture tb of BCDto7seg_tb is

    component BCDto7seg is
        port (
            BCD : in  bit_vector(3 downto 0);
            SEG : out bit_vector(6 downto 0)
        );
    end component;

    signal BCD_tb : bit_vector(3 downto 0) := "0000";
    signal SEG_tb : bit_vector(6 downto 0);

begin

    DUT : BCDto7seg
        port map (
            BCD => BCD_tb,
            SEG => SEG_tb
        );

    stimulus : process
    begin

        -- 0
        BCD_tb <= "0000";
        wait for 10 ns;
        assert SEG_tb = "1111110"
            report "Test failed for BCD 0"
            severity error;

        -- 1
        BCD_tb <= "0001";
        wait for 10 ns;
        assert SEG_tb = "0110000"
            report "Test failed for BCD 1"
            severity error;

        -- 2
        BCD_tb <= "0010";
        wait for 10 ns;
        assert SEG_tb = "1101101"
            report "Test failed for BCD 2"
            severity error;

        -- 3
        BCD_tb <= "0011";
        wait for 10 ns;
        assert SEG_tb = "1111001"
            report "Test failed for BCD 3"
            severity error;

        -- 4
        BCD_tb <= "0100";
        wait for 10 ns;
        assert SEG_tb = "0110011"
            report "Test failed for BCD 4"
            severity error;

        -- 5
        BCD_tb <= "0101";
        wait for 10 ns;
        assert SEG_tb = "1011011"
            report "Test failed for BCD 5"
            severity error;

        -- 6
        BCD_tb <= "0110";
        wait for 10 ns;
        assert SEG_tb = "1011111"
            report "Test failed for BCD 6"
            severity error;

        -- 7
        BCD_tb <= "0111";
        wait for 10 ns;
        assert SEG_tb = "1110000"
            report "Test failed for BCD 7"
            severity error;

        -- 8
        BCD_tb <= "1000";
        wait for 10 ns;
        assert SEG_tb = "1111111"
            report "Test failed for BCD 8"
            severity error;

        -- 9
        BCD_tb <= "1001";
        wait for 10 ns;
        assert SEG_tb = "1111011"
            report "Test failed for BCD 9"
            severity error;

        -- Invalid BCD values: 10 to 15
        BCD_tb <= "1010";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 10"
            severity error;

        BCD_tb <= "1011";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 11"
            severity error;

        BCD_tb <= "1100";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 12"
            severity error;

        BCD_tb <= "1101";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 13"
            severity error;

        BCD_tb <= "1110";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 14"
            severity error;

        BCD_tb <= "1111";
        wait for 10 ns;
        assert SEG_tb = "0000000"
            report "Test failed for invalid BCD 15"
            severity error;

        report "Simulation finished successfully: BCDto7seg testbench passed."
            severity note;

        wait;

    end process;

end architecture tb;
