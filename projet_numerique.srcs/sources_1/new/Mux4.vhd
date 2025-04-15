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
    cmd : in STD_LOGIC_VECTOR (1 downto 0);
    A0 : in STD_LOGIC_VECTOR (6 downto 0);
    A1 : in STD_LOGIC_VECTOR (6 downto 0);
    A2 : in STD_LOGIC_VECTOR (6 downto 0);
    A3 : in STD_LOGIC_VECTOR (6 downto 0);
    Affiche : out STD_LOGIC_VECTOR (6 downto 0));
end Mux4;

architecture Behavioral of Mux4 is

begin
    with cmd select 
    Affiche<= A0 when "00",
    A1 when "01",
    A2 when "10",
    A3 when others;

end Behavioral;










