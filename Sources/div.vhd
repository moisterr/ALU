library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div is
    generic (
        M: integer
        );
    
    port (
        a: in std_logic_vector ( M - 1 downto 0);
        b: in std_logic_vector ( M - 1 downto 0);
        c: out std_logic_vector (M + M - 1 downto 0)
    );
end div;

architecture behav of div is
begin
    process (a, b) 
    variable div_mid: unsigned(2 * M  downto 0);
    variable b_mid: unsigned (2 * M   downto 0);
    variable b_mid_minus: unsigned (2 * M  downto 0);
    begin
        div_mid :='0' & to_unsigned(0, M) & unsigned(a);
        b_mid := '0' & unsigned(b) & to_unsigned(0, M);
        b_mid_minus := '0' & (unsigned(not b) + 1) & to_unsigned(0, M);
        
        for i in 0 to M - 1 loop
            div_mid := shift_left(div_mid, 1);
            div_mid := div_mid + b_mid_minus;
            
            if(div_mid( 2 * M - 1) = '0') then
                div_mid(0) := '1';
            else 
                div_mid(0) := '0';
                div_mid := div_mid + b_mid;
            end if;
        end loop; 
        
        c <= std_logic_vector(div_mid(M + M - 1 downto 0));
    end process;

end behav;