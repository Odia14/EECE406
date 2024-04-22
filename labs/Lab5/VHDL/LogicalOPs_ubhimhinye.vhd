library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LogicalOps is
    port (
        ctrl: in std_logic_vector(3 downto 0);
        a: in std_logic;
        b: in std_logic;
        x: out std_logic
    );
end LogicalOps;

architecture rtl of LogicalOps is
begin
-- Write your VHDL code here
    x<= (a and b) when (ctrl(3)='1') else
        (a or b) when (ctrl(2)='1')else
        (a xor b) when (ctrl(1)='1')else
        not a when (ctrl(0)='1')else
        not b;
end rtl;
