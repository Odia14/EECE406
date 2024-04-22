library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

signal a1, a2, x: unsigned(4 downto 0);
signal s: std_logic_vector(1 downto 0);
-- Write your selected signal assignment statements below
-- to implement the above schematic
    with s select
        x<= a1+a2 when "11",
            a2-1 when "10",
            a2+1 when "01",
            a1   when "00";


