----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 09:41:59 AM
-- Design Name: 
-- Module Name: loto - Behavioral
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

entity loto is
  Port (
    clk : in std_logic;
    ce : in std_logic;
    press : in std_logic;
    rst : in std_logic;
    tempo : in std_logic;
    green : out std_logic;
    red : out std_logic;
    number : out natural range 1 to 6;
    num_1 : out natural range 1 to 49;
    num_2 : out natural range 1 to 49;
    num_3 : out natural range 1 to 49;
    num_4 : out natural range 1 to 49;
    num_5 : out natural range 1 to 49;
    num_6 : out natural range 1 to 49);
end loto;

architecture Behavioral of loto is
component counter_49 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           valid : in STD_LOGIC;
           num_out : out natural range 1 to 49);
end component;

component fsm is
  Port (
    bouton : in std_logic;
    clk : in std_logic;
    rst : in std_logic;
    restart : in std_logic;
    tempo : in std_logic;
    number : in natural range 1 to 6;
    trigger : out std_logic;
    green : out std_logic;
    red : out std_logic  
     );
end component;

component comparator is
    Port ( 
        current_number : in natural range 1 to 49;
        num1 : in natural range 1 to 49;
        num2 : in natural range 1 to 49;
        num3 : in natural range 1 to 49;
        num4 : in natural range 1 to 49;
        num5 : in natural range 1 to 49;
        num6 : in natural range 1 to 49;
        restart : out std_logic);
end component;

component memory is
  Port (
    save : in std_logic;
    clk : in std_logic;
    random_number : in natural range 1 to 49;
    current_number : in natural range 1 to 6;
    rst : in std_logic;
    
    num1 : out natural range 1 to 49;
    num2 : out natural range 1 to 49;
    num3 : out natural range 1 to 49;
    num4 : out natural range 1 to 49;
    num5 : out natural range 1 to 49;
    num6 : out natural range 1 to 49);             
end component;


signal random_number : natural range 1 to 49;
signal restart : std_logic;
signal current_number : natural range 1 to 6;
signal save : std_logic;
signal s_num_1 : natural range 1 to 49;
signal s_num_2 : natural range 1 to 49;
signal s_num_3 : natural range 1 to 49;
signal s_num_4 : natural range 1 to 49;
signal s_num_5 : natural range 1 to 49;
signal s_num_6 : natural range 1 to 49;
begin

    cmpt_tirage : counter_49 port map(ce, rst, press, random_number);
    control : fsm port map (press, clk, rst, restart, tempo, current_number, save, green, red);
    comp : comparator port map (random_number, s_num_1, s_num_2, s_num_3, s_num_4, s_num_5, s_num_6);  
    registres : memory port map(save, clk, random_number, current_number, rst, s_num_1, s_num2, s_num_3, s_num_4, s_num_5, s_num_6);
    
    

end Behavioral;
