-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

library ieee;
use ieee.std_logic_1164.all;

entity controlunit is
    port 
        ( match1    : in std_logic
        ; match2    : in std_logic
        ; cs1       : out std_logic
        ; cs2       : out std_logic
        ; we1       : out std_logic
        ; we2       : out std_logic
        ; cs_main   : out std_logic
        ; we_main   : out std_logic
        );
end entity;

architecture arch of controlunit is
    signal sel : std_logic := '0';
begin
    process (match1, match2)
    begin

        cs1 <= '0';
        cs2 <= '0';
        we1 <= '0';
        we2 <= '0';
        we_main <= '0';
        cs_main <= '0';

        if (match1 = '1') then
            cs1 <= '1';
        elsif (match2 = '1') then
            cs2 <= '1';
        else
            cs_main <= '1';

            if (sel = '1') then
                cs1 <= '1';
                we1 <= '1';
                sel <= '0';
            else
                cs2 <= '1';
                we2 <= '1';
                sel <= '1';
            end if;
        end if;
    end process;
end architecture;