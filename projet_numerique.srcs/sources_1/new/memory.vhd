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

entity memory is
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
end memory;

architecture Behavioral of memory is
signal s1 : natural range 1 to 49;
signal s2 : natural range 1 to 49;
signal s3 : natural range 1 to 49;
signal s4 : natural range 1 to 49;
signal s5 : natural range 1 to 49;
signal s6 : natural range 1 to 49;

begin
    process (clk, rst)
    begin
        if(rst = '1') then
            s1 <= 0;
            s2 <= 0;
            s3 <= 0;
            s4 <= 0;
            s5 <= 0;
            s6 <= 0;
        elsif(clk'event and clk = '1') then
            if(current_number = 6) then
                s6 <= random_number;
                             
             elsif(current_number = 5) then
                s5 <= random_number;
             
             elsif(current_number = 4) then
                s4 <= random_number;
             
             elsif(current_number = 3) then
                s3 <= random_number;
             
             elsif(current_number = 2) then
                s2 <= random_number;
             
             elsif(current_number = 1) then
                s1 <= random_number;
             end if;
         end if;
     end process;

end Behavioral;
