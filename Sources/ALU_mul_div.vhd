library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.lib.all;

entity alu_mul_div is 
    generic (
        M: integer 
    );
    
    port (
        operand1: in std_logic_vector (M - 1 downto 0);
        operand2: in std_logic_vector (M - 1 downto 0);
        operator: in std_logic;
        answer: out std_logic_vector (2 * M - 1 downto 0)
    );
end alu_mul_div;

architecture behav of alu_mul_div is


    
    signal mul_result: std_logic_vector (2 * M - 1 downto 0);
    signal div_result: std_logic_vector (2 * M - 1 downto 0);

begin

    
    op1: mul 
        generic map (M => M)
        port map (
            a => operand1,
            b => operand2,
            c => mul_result
        );

  
    op2: div 
        generic map (M => M)
        port map (
            a => operand1,
            b => operand2,
            c => div_result
        );

  
    process(operand1, operand2, operator, mul_result, div_result)
    begin
        if operator = '0' then
            answer <= mul_result; 
        else
            answer <= div_result; 
        end if;
    end process;

end behav;
