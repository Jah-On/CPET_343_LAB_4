/*

Author: John Schulz
DateL 06/13/2025

Top level entity for lab 4.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity display_counter is
    port (
        clock_50 : in  std_logic;
        hex0     : out std_logic_vector(6 downto 0)
    );
end entity display_counter;

architecture mafs of display_counter is
    signal enable   : std_logic                    := '0';
    signal last_sum : std_logic_vector(3 downto 0) := "0000";
    signal new_sum  : std_logic_vector(3 downto 0) := "0000";

    component generic_counter is
        generic (
            max_count       : integer := 3
        );
        port (
            clk             : in  std_logic; 
            reset           : in  std_logic;
            output          : out std_logic
        );
    end component generic_counter; 

    component generic_adder_beh is
        generic (
            bits    : integer := 4
        );
        port (
            a       : in  std_logic_vector(bits-1 downto 0);
            b       : in  std_logic_vector(bits-1 downto 0);
            cin     : in  std_logic;
            sum     : out std_logic_vector(bits-1 downto 0);
            cout    : out std_logic
        );
    end component generic_adder_beh;

    component seven_seg is
        port (
            enable          : in std_logic;
            bcd             : in std_logic_vector(3 downto 0);
            seven_seg_out   : out std_logic_vector(6 downto 0)
        );
    end component seven_seg; 

begin
    add: process(enable)
    begin
        if rising_edge(enable) then
            last_sum <= new_sum;
        end if;
    end process add;

    de1 : generic_counter 
        port map (
            clk    => clock_50,
            output => enable,
            reset  => '0'
        );

    de2 : generic_adder_beh 
        port map (
            a    => last_sum,
            b    => "0001",
            sum  => new_sum,
            cin  => '0',
            cout => open
        );

    de3 : seven_seg 
        port map (
            enable        => '1',
            bcd           => last_sum,
            seven_seg_out => hex0
        );

end architecture mafs;