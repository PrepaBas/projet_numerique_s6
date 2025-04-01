----------------------------------------------------------------------------------
-- on prend en entrée le chiffre généré, le combientieme c'est et la frequence d'affichage. à chaque front montant de clk on veut afficher le Ai suivant.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux4 is
    Port ( 
    clk : in STD_LOGIC;
    A0 : in STD_LOGIC_VECTOR (6 downto 0);
    A1 : in STD_LOGIC_VECTOR (6 downto 0);
    A2 : in STD_LOGIC_VECTOR (6 downto 0);
    A3 : in STD_LOGIC_VECTOR (6 downto 0);
    Affiche : out STD_LOGIC_VECTOR (6 downto 0));
end Mux4;

architecture Behavioral of Mux4 is

signal rang : natural range 0 to 3 := 0;

begin
    process(clk)
    begin
        if (clk'event and clk='1') then
            if (rang =0) then 
                Affiche <= A0;
                rang <= 1;
            elsif (rang = 1) then
                Affiche <= A1;
                rang <= 2;
            elsif (rang = 2) then
                Affiche <= A2;
                rang <= 3;
            elsif (rang = 3) then
                Affiche <= A3;
                rang <= 0;
            end if ;
        end if;
         
        
end process;


end Behavioral;










