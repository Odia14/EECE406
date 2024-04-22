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

architecture cond_arch  of decoder_2_to_4_with_enable is
    begin
        x<= "0000" when (en='0') else 
            "0001" when ( s='00') else
            "0010" when ( s='01') else
            "0100" when ( s='10') else
            "1000";
    end cond_arch;
