-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity mainmem is
    port 
        ( address   : in std_logic_vector(31 downto 0)
        ; data      : inout std_logic_vector(63 downto 0)
        ; cs        : in std_logic
        ; we        : in std_logic
        );
end entity;

architecture arch of mainmem is
    --2^15 * 8 bytes
    type mem is array (0 to 2 ** 16 - 1) of std_logic_vector(63 downto 0);
    signal memory : mem :=
        ( x"DECADE0000000000"
        , x"FEEDBEEF00000000"
        , x"C0FFEE0000000000"
        , x"C0C0A00000000000"
        , others => x"FFFFFFFFFFFFFFFF"
        );
begin

    process (cs, we, data, address)
    begin

        if (cs = '1') then
            if (we = '1') then
                memory(conv_integer(address(18 downto 3))) <= data;
            else
                data <= memory(conv_integer(address(18 downto 3)));
            end if;
        else
            data <= (others => 'Z');
        end if;

    end process;
end architecture;