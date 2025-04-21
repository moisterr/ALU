library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.lib.all;

entity ALU_tb is
end ALU_tb;

architecture test of ALU_tb is
    constant M: integer := 4;
    
    signal operand1: std_logic_vector (M - 1 downto 0);
    signal operand2: std_logic_vector (M - 1 downto 0);
    signal operator: std_logic;
    signal answer: std_logic_vector (2 * M - 1 downto 0);
begin
    uut: entity work.alu_mul_div
        generic map (M => M)
        port map (
            operand1 => operand1,
            operand2 => operand2,
            operator => operator,
            answer   => answer
        );
    
    process
    begin
       
        wait for 20ns;
        
        operand1 <= "1011";  
        operand2 <= "1101";  
        operator <= '0';     
        wait for 20 ns;

       
        operand1 <= "0110";  
        operand2 <= "0101";  
        operator <= '0';    
        wait for 20 ns;

      
        operand1 <= "1011";  
        operand2 <= "0011"; 
        operator <= '1';     
        wait for 20 ns;

        wait; 
    end process;    
end test;
