----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 05:40:59 PM
-- Design Name: 
-- Module Name: tb_general - Behavioral
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
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_general is
end tb_general;

architecture Behavioral of tb_general is
   component Mux4 is
        Port ( 
        cmd : in STD_LOGIC_VECTOR (1 downto 0);
        A0 : in STD_LOGIC_VECTOR (6 downto 0);
        A1 : in STD_LOGIC_VECTOR (6 downto 0);
        A2 : in STD_LOGIC_VECTOR (6 downto 0);
        A3 : in STD_LOGIC_VECTOR (6 downto 0);
        Affiche : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component number_mux is
      Port ( 
        cmd : in std_logic_vector(2 downto 0);
        num_1 : in natural range 1 to 49;
        num_2 : in natural range 1 to 49;
        num_3 : in natural  range 1 to 49;
        num_4 : in natural range 1 to 49;
        num_5 : in natural range 1 to 49;
        num_6 : in natural range 1 to 49;
        num_out : out natural range 1 to 49);
    end component;
    
    component counter is
        Port ( clk : in STD_LOGIC;
               clk_25M : out STD_LOGIC;
               clk_3k : out STD_LOGIC;
               clk_1 : out STD_LOGIC);
    end component;
    
    component transcodeur is 
       Port( entre : natural range 1 to 49;
       A0: out STD_LOGIC_VECTOR (6 downto 0);
       A1: out STD_LOGIC_VECTOR (6 downto 0));
    end component;


    signal clk  : STD_LOGIC := '0';
    signal clk_25M : STD_LOGIC;
    signal clk_3k : STD_LOGIC;
    signal clk_1 : STD_LOGIC;
    
    signal commande_number : natural range 0 to 6;
    signal cmd : std_logic_vector(2 downto 0); 
    signal num_1 : natural range 1 to 49:= 12;
    signal num_2 : natural range 1 to 49:= 42;
    signal num_3 : natural  range 1 to 49:= 1;
    signal num_4 : natural range 1 to 49:= 40;
    signal num_5 : natural range 1 to 49:= 21;
    signal num_6 : natural range 1 to 49:= 3;
    signal number_mux_transcodeur : natural range 1 to 49;
    
    signal s_0 : STD_LOGIC_VECTOR (6 downto 0);
    signal s_1 : STD_LOGIC_VECTOR (6 downto 0);
    
    signal cmd_segment : STD_LOGIC_VECTOR (1 downto 0):= "00";
    signal A0 : STD_LOGIC_VECTOR (6 downto 0):="0000111";
    signal A1 : STD_LOGIC_VECTOR (6 downto 0):="1000000";
    signal mux4_out : STD_LOGIC_VECTOR (6 downto 0);
    
begin
    counter1 : counter port map(clk, clk_25M, clk_3k, clk_1);
    mux6 : number_mux port map( cmd, num_1, num_2, num_3, num_4, num_5, num_6, number_mux_transcodeur);
    transcodeur1 : transcodeur port map(number_mux_transcodeur, s_0, s_1);
    mux04 : mux4 port map(cmd_segment,A0, A1, s_0, s_1, mux4_out);

    change_number : process(clk_1)
    begin
        if(clk_1'event and clk_1='1') then
            commande_number <= commande_number +1;
        end if;
    end process;
    
    change_segment : process(clk_3k)
    begin
        if(clk_3k'event and clk_3k ='1') then
            if(cmd_segment = "00") then cmd_segment <= "01";
            elsif(cmd_segment = "01") then cmd_segment <= "10";
            elsif(cmd_segment = "10") then cmd_segment <= "11";
            else cmd_segment <= "00";
            end if;
         end if;
     end process;
        
        
     clk <= not clk after 10 ns;
    cmd <= std_logic_vector(to_unsigned(commande_number, 3));
end Behavioral;
