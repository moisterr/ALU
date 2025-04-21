library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package lib is
    component mul is
        generic (
            M: integer 
        );
    
        port (
            a: in std_logic_vector (M - 1 downto 0);
            b: in std_logic_vector (M - 1 downto 0);
            c: out std_logic_vector (M + M - 1 downto 0)
        );
    end component;
    
    component div is
        generic (
            M: integer 
        );
    
        port (
            a: in std_logic_vector ( M - 1 downto 0);
            b: in std_logic_vector ( M - 1 downto 0);
            c: out std_logic_vector (M + M - 1 downto 0)
        );
    end component;
end lib;