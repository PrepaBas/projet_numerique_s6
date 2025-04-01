library iEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity transcodeur is 
   Port( entre : natural range 1 to 49;
   A0: out STD_LOGIC_VECTOR (6 downto 0);
   A1: out STD_LOGIC_VECTOR (6 downto 0));
end transcodeur;

--      0
--     ---
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3

architecture Behavioral of transcodeur is
signal DIX : natural range 0 to 4;
begin

    DIX <= entre / 10;
    with entre - 10* DIX select
       A0<= "1111001" when 1,   --1
         "0100100" when 2,   --2
         "0110000" when 3,   --3
         "0011001" when 4,   --4
         "0010010" when 5,   --5
         "0000010" when 6,   --6
         "1111000" when 7,   --7
         "0000000" when 8,   --8
         "0010000" when 9,   --9
         "1000000" when others;   --0
         
    with DIX select
       A1<= "1111001" when 1,   --1
         "0100100" when 2,   --2
         "0110000" when 3,   --3
         "0011001" when others;   --4


end process;
end Behavioral;

