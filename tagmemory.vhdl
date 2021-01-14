-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tagmem is
    port 
        ( address   : in std_logic_vector(8 downto 0)
        ; d         : out std_logic_vector(19 downto 0)
        ; we        : in std_logic
        ; data      : in std_logic_vector(19 downto 0)
        );
end entity;

architecture arch of tagmem is

    type mem is array(0 to 511) of std_logic_vector(19 downto 0);
    signal memory : mem := (others => (others => 'U'));

begin
    d <= memory(conv_integer(address));

    process (we, address, data)
    begin
        if (we = '1') then
            memory(conv_integer(address)) <= data;
        end if;
    end process;
end architecture;