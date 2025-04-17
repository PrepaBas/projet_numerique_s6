----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library iEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mod6 is
    Port ( bouton : in STD_LOGIC;
           c_e_slow : in STD_LOGIC;
           horloge : in STD_LOGIC;
           raz : in STD_LOGIC;
           entree : in natural range 1 to 6;
           sortie : out natural range 1 to 6;
           sortieSeptSeg : out STD_LOGIC_VECTOR (6 downto 0));
end mod6;

architecture Behavioral of mod6 is
    constant cycle : integer := 6;
    
    signal compteurCycle : natural range 1 to cycle := 0;
begin
    process(c_e_slow, horloge)
    begin
    if (raz = '0') then
        if (bouton = '1' and horloge' event) then
            sortie <= entree;
            with entree select
                sortieSeptSeg<= "1111001" when 1,   --1
                "0100100" when 2,   --2
                "0110000" when 3,   --3
                "0011001" when 4,   --4
                "0010010" when 5,   --5
                "0000010" when others;   --6
                
        elsif (bouton = '0' and c_e_slow' event and c_e_slow = '1' and horloge = '1') then
            if (compteurCycle = 6) then
                compteurCycle <= 1;
            else
                compteurCycle <= compteurCycle +1;
            end if;
        sortie <= compteurCycle;
        end if;
    else
        sortie <= 1 ;
        sortieSeptSeg<="1111001";   
    end if;
end process;
end Behavioral;
