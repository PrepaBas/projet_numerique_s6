----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 05:14:31 PM
-- Design Name: 
-- Module Name: tb_transcodeur - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_transcodeur is
end tb_transcodeur;

architecture Behavioral of tb_transcodeur is
component transcodeur is
    Port( entre : natural range 1 to 49;
   A0: out STD_LOGIC_VECTOR (6 downto 0);
   A1: out STD_LOGIC_VECTOR (6 downto 0));
end component;

    signal input : natural range 1 to 49;
    signal s_0 : STD_LOGIC_VECTOR (6 downto 0);
    signal s_1 : STD_LOGIC_VECTOR (6 downto 0);
begin
    transcodeur_ut : transcodeur port map(input, s_0, s_1);
    input <= input + 1 after 10 ns;
    

end Behavioral;
