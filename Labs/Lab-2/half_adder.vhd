entity half_adder is
    port (
        A : in  bit;
        B : in  bit;
        S : out bit;
        C : out bit
    );
end entity half_adder;

architecture dataflow of half_adder is
begin
    S <= A xor B;
    C <= A and B;
end architecture dataflow;
