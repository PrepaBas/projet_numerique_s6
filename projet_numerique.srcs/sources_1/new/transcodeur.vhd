



--en gros ici on prend un entier entre 1 et 49 et on le code en séparant la dixaine sur a1 et l'unité sur a0 de telle sorte que le mux 4 puisse choisir lequel afficher



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
       A0<= "1001111" when 1,   --1
         "0010010" when 2,   --2
         "0000110" when 3,   --3
         "1001100" when 4,   --4
         "0100100" when 5,   --5
         "0100000" when 6,   --6
         "0001111" when 7,   --7
         "0000000" when 8,   --8
         "0000100" when 9,   --9
         "0000001" when others;   --0
         
    with DIX select
       A1<= "0000001" when 0,
       "1001111" when 1,   --1
         "0010010" when 2,   --2
         "0000110" when 3,   --3
         "1001101" when others;   --4

end Behavioral;

