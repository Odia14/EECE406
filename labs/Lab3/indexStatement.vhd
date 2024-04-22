library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Index is
    Port (
        ctrl: in std_logic_vector(2 downto 0);
        a: out std_logic_vector(7 downto 0)
    );
end Index;

architecture rtl of Index is

signal au: unsigned(7 downto 0);
begin
    process (au, ctrl)
        begin
        au <= (others=>'1');
        au(to_integer(unsigned(ctrl))) <= '0';
        a <= std_logic_vector(au);
end process;

end rtl;