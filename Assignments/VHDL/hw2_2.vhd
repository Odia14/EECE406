library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hw2_2 is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC);
end hw2_2;
architecture sel_arch of hw2_2 is
begin
    with s select
    z<= '0' when "00",
        '1' when "01",
        '0' when "10",
        '1' when "11";
end sel_arch;
