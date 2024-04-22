library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder24 is
    port (
        ctrl: in std_logic_vector(1 downto 0);
        a: out std_logic_vector(3 downto 0)
    );
end decoder24;

architecture rtl of decoder24 is
begin
   with ctrl select 
   a<= "0001" when "00",
       "0010" when "01",
       "0100" when "10",
       "1000" when "11";
end rtl;
