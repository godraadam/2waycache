-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity datmem is
    port 
        ( address   : in std_logic_vector(8 downto 0)
        ; data      : inout std_logic_vector(63 downto 0)
        ; cs        : in std_logic
        ; we        : in std_logic
        );
end entity;

architecture arch of datmem is

    -- 512 * 8 bytes of data memory
    type mem is array(0 to 511) of std_logic_vector(63 downto 0);
    signal memory : mem := (others => (others => '-'));

begin

    process (cs, we, data, address)
    begin
        if (cs = '1') then
            if (we = '1') then
                memory(conv_integer(address)) <= data;
            else
                data <= memory(conv_integer(address));
            end if;
        else
            data <= (others => 'Z');
        end if;

    end process;
end architecture;