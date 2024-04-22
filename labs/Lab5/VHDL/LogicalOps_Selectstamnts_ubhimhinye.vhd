library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 

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

with ctrl select 
 
    x<= (a and b) when "1000"|"1001"|"1010"|"1011"|"1100"|"1101"|"1110"|"1111",
        (a or b) when "0100"|"0101"|"0110"|"0111",
        (a xor b) when "0010"|"0011",
        (not a) when "0001",
        (not b) when others; 

end rtl;        
