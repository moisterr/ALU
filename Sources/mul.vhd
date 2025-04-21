library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity mul is 
    generic (
        M: integer
    );
    
    port (
        a: in std_logic_vector (M - 1 downto 0);
        b: in std_logic_vector (M - 1 downto 0);
        c: out std_logic_vector (M + M - 1 downto 0)
    );
end mul;

architecture behav of mul is
begin
    process(a, b)
        variable mul_mid: unsigned(M + M downto 0);
        variable a_mid: unsigned(M + M downto 0);
    begin
        a_mid := '0' & unsigned(a) & to_unsigned(0, M);
        mul_mid := '0' & to_unsigned(0, M) & unsigned(b);

        for i in 0 to M - 1 loop
            if mul_mid(0) = '1' then
                mul_mid := mul_mid + a_mid;
            end if;
            mul_mid := shift_right(mul_mid, 1);
        end loop;

        c <= std_logic_vector(mul_mid(M + M - 1 downto 0));
    end process;
end behav;
