----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2025 04:10:10 PM
-- Design Name: 
-- Module Name: number_mux - Behavioral
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


library iEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity number_mux is
  Port ( 
    cmd : in std_logic_vector(2 downto 0);
    num_1 : in natural range 1 to 49;
    num_2 : in natural range 1 to 49;
    num_3 : in natural  range 1 to 49;
    num_4 : in natural range 1 to 49;
    num_5 : in natural range 1 to 49;
    num_6 : in natural range 1 to 49;
    num_out : out natural range 1 to 49);
end number_mux;

architecture Behavioral of number_mux is
begin
    with cmd select num_out <=
	num_1 when "000",
	num_2 when "001",
	num_3 when "010",
	num_4 when "011",
	num_5 when "100",
	num_6 when others;
end Behavioral;
