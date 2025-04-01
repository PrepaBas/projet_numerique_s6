----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity tb_Mux4 is
end tb_Mux4;

architecture Behavioral of tb_Mux4 is
    component Mux4
        Port (     
    cmd : in STD_LOGIC_VECTOR (1 downto 0);
    A0 : in STD_LOGIC_VECTOR (6 downto 0);
    A1 : in STD_LOGIC_VECTOR (6 downto 0);
    A2 : in STD_LOGIC_VECTOR (6 downto 0);
    A3 : in STD_LOGIC_VECTOR (6 downto 0);
    Affiche : out STD_LOGIC_VECTOR (6 downto 0)
    );
    end component;

    signal cmd : STD_LOGIC_VECTOR (1 downto 0):= "00";
    signal A0 : STD_LOGIC_VECTOR (6 downto 0);
    signal A1 : STD_LOGIC_VECTOR (6 downto 0);
    signal A2 : STD_LOGIC_VECTOR (6 downto 0);
    signal A3 : STD_LOGIC_VECTOR (6 downto 0);
    signal Affiche : STD_LOGIC_VECTOR (6 downto 0);
    
begin
    Mux4_1: Mux4 port map (
            cmd,
            A0,
            A1,
            A2,
            A3);

cmd<= "01"  after 5 ns, "10" after 10ns, "11"  after 15 ns;

end Behavioral;







