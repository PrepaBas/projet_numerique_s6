----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity cpt_valeurs is
    Port ( horloge : in STD_LOGIC;
           increment : in STD_LOGIC;
           raz : in STD_LOGIC;
           sortie : out natural range 1 to 6);
end cpt_valeurs;

architecture Behavioral of cpt_valeurs is
signal s_1 : natural range 1 to 6 ;
begin
    process (horloge)
    begin
        if (raz = '1') then 
            s_1 <=1;
        else
            if (increment = '1' and horloge' event and horloge = '1') then
                if (s_1 = 6) then 
                    s_1 <= 1;
                else 
                    s_1 <= s_1 + 1;
                end if;
            end if;
        end if;
    end process;
    sortie <= s_1;
end Behavioral;
