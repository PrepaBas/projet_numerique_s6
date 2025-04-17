----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 09:58:10 AM
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
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
end fsm;

architecture Behavioral of fsm is
    type ETAT is (e_loop, e_pressed, e_released, e_restart, e_save, e_end);
    signal ep : ETAT :=e_loop;    
    signal ef : ETAT;
begin
    process(bouton, restart, number)
    begin
        case ep is
            when e_loop =>
                if(bouton = '1') then ef <= e_pressed;
                else ef <= ep;
                end if;
                
            when e_pressed => 
                if(bouton = '0') then ef <= e_restart;
                elsif(bouton = '0') then ef <= e_released;
                else ef <= ep;
                end if;
                
            when e_restart =>
                if(bouton = '1') then
                    ef <= ep;
               else ef <= e_pressed;
               end if;
            when e_released =>
                if(restart = '1') then ef <= e_restart;
                else ef <= e_save; 
                end if;
            when e_save =>
                if(number = 6) then
                    ef <= e_end;
                else ef <= e_loop;
                end if;
            when e_end => ef <= e_end;         
        end case;
        
    end process;
    
    process (clk)
    begin
        if(clk'event and clk='1') then   
            ep <= ef;
        end if;
    end process;
     
    process (ep)
    begin 
         if(ep = e_loop) then 
            trigger <= '0';
            green <='0';
            red <= '0';     
         elsif(ep = e_pressed) then 
            trigger <= '0';
            green <='1';
            red <= '1';     
         elsif(ep = e_restart) then 
            trigger <= '0';
            green <='0';
            red <= '1';     
         elsif(ep = e_save) then 
            trigger <= '1';
            green <='1';
            red <= '0';     
         elsif(ep = e_end) then 
            trigger <= '0';
            green <='0';
            red <= '0';
         elsif(ep = e_released) then
            trigger <= '0';
            green <='1';
            red <= '1';
         end if;
     end process;
        
        


end Behavioral;
