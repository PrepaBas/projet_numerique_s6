library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity tb_counter is
end tb_counter;

architecture Behavioral of tb_counter is
    component counter
        Port ( clk  : in  STD_LOGIC;
               clk_25M : out STD_LOGIC;
               clk_3k : out STD_LOGIC;
               clk_1 : out STD_LOGIC);
    end component;

    signal clk_in  : STD_LOGIC := '0';
    signal clk_25M : STD_LOGIC;
    signal clk_3k : STD_LOGIC;
    signal clk_1 : STD_LOGIC;
    
begin
    counter1: counter port map (
            clk_in,
            clk_25M,
            clk_3k,
            clk_1);

    clk_in <= not clk_in after 5 ns;


end Behavioral;
