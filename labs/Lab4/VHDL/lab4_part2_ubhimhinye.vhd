library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab4_circuit is
    port (
        a1: in std_logic;
        a2: in std_logic;
        s: in std_logic_vector(1 downto 0);
        x: out std_logic
    );
end lab4_circuit;

architecture rtl of lab4_circuit is

begin
-- Write your VHDL code here
    with s select 
    x<= (a1 and a2) when "11",
        (a1 or a2) when "10",
        a2 when "01",
        a1 when "00";
end rtl;
