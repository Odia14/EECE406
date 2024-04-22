library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_2_to_4_with_enable is
    port(
        en : in  std_logic;
        s : in  std_logic_vector(1 downto 0);
        X : out std_logic_vector(3 downto 0)
    );
end entity decoder_2_to_4_with_enable;

process (en, s)
    begin
        if (en '0') then 
            x <= "0000";
        elsif (en = '1' and s = "00") then
             x <= "0001";
        elsif (en = '1' and s = "01") then 
        x <= "0010";
        elsif (en = '1' and s = "10") then
             x <= "0100";
        else
            x <= "1000";
        end if;
end process;