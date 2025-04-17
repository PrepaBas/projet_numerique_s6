----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_tirage is
end tb_tirage;

architecture Behavioral of tb_tirage is
component topLvl is 
    Port ( bouton : in STD_LOGIC;
           c_e : in STD_LOGIC;
           horloge : in STD_LOGIC;
           raz : in STD_LOGIC;
           tempo : in STD_LOGIC;
           led_ok : out STD_LOGIC;
           led_recommence : out STD_LOGIC;
           val_cpt_tirage : out natural range 1 to 6;
           val1 : out natural range 1 to 49;
           val2 : out natural range 1 to 49;
           val3 : out natural range 1 to 49;
           val4 : out natural range 1 to 49;
           val5 : out natural range 1 to 49;
           val6 : out natural range 1 to 49);
    end component;
    
    signal button : STD_LOGIC:= '0';
    signal clkEn : STD_LOGIC;
    signal clk : STD_LOGIC;
    signal reset : STD_LOGIC:= '0';
    signal c_e_slow : STD_LOGIC;
    signal ledV : STD_LOGIC:= '0';
    signal ledR : STD_LOGIC:= '0';
    signal cptTirrage : Natural range 1 to 6:= 1;
    signal V1 : natural range 1 to 49:= 1;
    signal V2 : natural range 1 to 49:= 1;
    signal V3 : natural range 1 to 49:= 1;
    signal V4 : natural range 1 to 49:= 1;
    signal V5 : natural range 1 to 49:= 1;
    signal V6 : natural range 1 to 49:= 1;

begin
    tirage_ut : topLvl port map(button, clkEn, clk, reset, c_e_slow, ledV, ledR, cptTirrage, V1, V2, V3, V4, V5, V6);
    clk <= not (clk) after 10 ns;
    button<= not button after 50 ns;
    ledV<= '1' after 610 ns;
    ledR<= '1' after 620 ns;
    reset<='1' after 500 ns;    
end Behavioral;
