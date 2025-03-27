----------------------------------------------------------------------------------
-- Create Date: 03/27/2025 08:57:16 AM
-- Design Name: Compteur 4 bits
-- Module Name: compteur - Behavioral
-- Description: on veut que chaque fois que l'entrée enregistre un front montant on ajoute 1 à la sortie
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur is
    Port ( clk : in STD_LOGIC; --clk est la variable d'entrée
           sortie : out STD_LOGIC); --nbr est la variable de sortie
end compteur;

architecture Behavioral of compteur is

signal scaler_1hz :natural range 0 to 99999999;

begin

    comptage : process (clk)
    begin 
        if (clk' event and clk = '1') then 
            if (scaler_1hz < 50000000) then
                sortie <= '1';
            elsif (scaler_1hz > 50000000) then
                sortie <='0';
            end if;
            scaler_1hz <= scaler_1hz + 1;
        end if;
    end process;
    
end Behavioral;
