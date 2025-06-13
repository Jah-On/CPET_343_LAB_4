library IEEE;
use IEEE.std_logic_1164.all;

entity seven_seg is
    port (
        enable          : in std_logic;
        bcd             : in std_logic_vector(3 downto 0);
        seven_seg_out   : out std_logic_vector(6 downto 0)
    );
end entity; 

architecture display of seven_seg is
begin
    proc_name: process(enable, bcd)
    begin
        if (enable) then
            case bcd is
                when "0001" => seven_seg_out <= "1111001";
                when "0010" => seven_seg_out <= "0100100";
                when "0011" => seven_seg_out <= "0110000";
                when "0100" => seven_seg_out <= "0011001";
                when "0101" => seven_seg_out <= "0010010";
                when "0110" => seven_seg_out <= "0000010";
                when "0111" => seven_seg_out <= "1111000";
                when "1000" => seven_seg_out <= "0000000";
                when "1001" => seven_seg_out <= "0011000";
                when others => seven_seg_out <= "1000000";
            end case;
        end if;
    end process proc_name;
end architecture display;