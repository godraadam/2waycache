-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity comparator is
    port 
        ( a     : in std_logic_vector(19 downto 0)
        ; b     : in std_logic_vector(19 downto 0)
        ; res   : out std_logic
        );
end entity;

architecture arch of comparator is

    
begin
   res <= '1' when a = b else '0';
end architecture;