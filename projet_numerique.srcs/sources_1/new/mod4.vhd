----------------------------------------------------------------------------------
-- on prend en entrée le chiffre généré, le combientieme c'est et la frequence d'affichage. à chaque front montant de clk on veut afficher le Ai suivant.
----------------------------------------------------------------------------------


library iEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod4 is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        anode : out std_logic_vector (7 downto 0);
        number : out std_logic_vector (1 downto 0));
end entity;

architecture Behavioral of mod4 is
    signal cmpt : std_logic_vector (1 downto 0) := "00";
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            anode <= "11111111";
            cmpt <= "00";
        elsif (clk'event and clk = '1') then
            if (cmpt = "00") then
                anode <= "11111101";
                cmpt <= "01";
            elsif (cmpt = "01") then
                anode <= "11111011";
                cmpt <= "10";
            elsif (cmpt = "10") then
                anode <= "11110111";
                cmpt <= "11";
            elsif (cmpt = "11") then
                anode <= "11111110";
                cmpt <= "00";
            end if;
        end if;
        number <= cmpt;
    end process;
end Behavioral;










