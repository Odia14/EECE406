library ieee;
use ieee.std_logic_1164.all;

entity decoder_case_statement is
    port(
        s : in  std_logic_vector(1 downto 0);
        z : out std_logic
    );
end entity decoder_case_statement;

architecture behavioral of decoder_case_statement is
begin
    process (s)
    begin
        case s is
            when "00" =>
                z <= '0';
            when "01" =>
                z <= '1';
            when "10" =>
                z <= '0';
            when "11" =>
                z <= '1';
            when others =>
                z <= '0'; 
        end case;
    end process;
end architecture behavioral;