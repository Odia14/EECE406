

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Counter is
    Port (
        clk: in std_logic;
        reset: in std_logic;
        ctrl1: in std_logic_vector(1 downto 0);
        ctrl2: in std_logic_vector(1 downto 0);
        leds: out std_logic_vector(1 downto 0)
    );
end Counter;

architecture rtl of Counter is
    signal cnter1_reg, cnter1_next: unsigned(29 downto 0);
    signal cnter2_reg, cnter2_next: unsigned(29 downto 0);
    begin
    process(clk, reset)
        begin
            if ( reset = '1' ) then
                cnter1_reg <= (others=>'0');
                cnter2_reg <= (others=>'0');
            elsif( rising_edge(clk) ) then
                cnter1_reg <= cnter1_next;
                cnter2_reg <= cnter2_next;
            end if;
    end process;
-- Counter via selected signal assignment
    with ctrl1 select 
        cnter1_next <= cnter1_reg + 1 when "00", 
                       cnter1_reg + 2 when "01", 
                       cnter1_reg + 4 when "10", 
                       cnter1_reg + 8 when others;
-- Output Logic 
    leds(0) <= cnter1_reg(29); 
-- Counter2 via case assignment in a process block (Your code)
    process(ctrl2, cnter2_reg)
        begin
        case ctrl2 is
            when "00" =>
                cnter2_next <= cnter2_reg + 1;
            when "01" =>
                cnter2_next <= cnter2_reg + 2;
            when "10" =>
                cnter2_next <= cnter2_reg + 4;
            when others =>
                cnter2_next <= cnter2_reg + 8;
        end case;
    end process;
-- Output Logic 
    leds(1) <= cnter2_reg(29);
end rtl; 
