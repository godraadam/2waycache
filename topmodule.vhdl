-- by Godra Adam 30434 @ UTCN 
-- Structure of Computer Systems Fall 2020/2021

-- 2-way set-assocaitive cache memory
-- memory address: 32 bits
-- tag: 20 bits, set address: 9 bits, offset: 3 bits
-- tag memory: 2^9 * 20 bits
-- data memory: 2^9 * 64 bits
-- main memory: 2^15 * 64 bits

library ieee;
use ieee.std_logic_1164.all;

entity main is
end entity;

architecture arch of main is

    

    signal databus          : std_logic_vector(63 downto 0) := (others => '0');
    signal addressbus       : std_logic_vector(31 downto 0) := (others => '0');
    signal match1, match2   : std_logic;
    signal tag1, tag2       : std_logic_vector(19 downto 0);
    signal we1, we2, we_main: std_logic;
    signal cs1, cs2, cs_main: std_logic;
    signal tag              : std_logic_vector(19 downto 0);
    signal index            : std_logic_vector(8 downto 0);
    signal offset           : std_logic_vector(2 downto 0);


begin
    comp1   : entity work.comparator    port map(tag1, addressbus(31 downto 12), match1);
    comp2   : entity work.comparator    port map(tag2, addressbus(31 downto 12), match2);
    tagmem1 : entity work.tagmem        port map(addressbus(11 downto 3), tag1, we1, addressbus(31 downto 12));
    tagmem2 : entity work.tagmem        port map(addressbus(11 downto 3), tag2, we2, addressbus(31 downto 12));
    datmem1 : entity work.datmem        port map(addressbus(11 downto 3), databus, cs1, we1);
    datmem2 : entity work.datmem        port map(addressbus(11 downto 3), databus, cs2, we2);
    mainmem : entity work.mainmem       port map(addressbus, databus, cs_main, we_main);
    cu      : entity work.controlunit   port map(match1, match2, cs1, cs2, we1, we2, cs_main, we_main);

    tag <= addressbus(31 downto 12);
    index <= addressbus(11 downto 3);
    offset <= addressbus(2 downto 0);


    process
    begin
        wait for 5ns;
        addressbus <= x"00000000";
        wait for 20ns;

        addressbus <= x"00000008";
        wait for 20ns;

        addressbus <= x"00000010";
        wait for 20ns;

        addressbus <= x"00000018";
        wait for 20ns;

        addressbus <= x"00000020";
        wait for 20ns;

        addressbus <= x"00001000";
        wait for 20ns;

        addressbus <= x"00000000";
        wait;
    end process;
end architecture;