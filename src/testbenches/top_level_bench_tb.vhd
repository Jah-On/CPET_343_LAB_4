/*

Author: John Schulz
DateL 06/13/2025

Test bench for top level entity for lab 4.

*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_bench is
end entity top_level_bench;

architecture bench of top_level_bench is
    component display_counter is
        port (
            clock_50 : in  std_logic;
            hex0     : out std_logic_vector(6 downto 0)
        );
    end component display_counter;

    constant tick : time      := 10ns;
    signal   clk  : std_logic := '0';
begin
    stinuli: process
    begin
        for num in 0 to 1000000 loop
            clk <= not clk;

            wait for tick;
        end loop;

        wait;
    end process stinuli;
    
    uut : display_counter port map (
        clock_50 => clk,
        hex0     => open
    );

end architecture bench;