library iEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Port ( 
        current_number : in natural range 1 to 49;
        num1 : in natural range 1 to 49;
        num2 : in natural range 1 to 49;
        num3 : in natural range 1 to 49;
        num4 : in natural range 1 to 49;
        num5 : in natural range 1 to 49;
        num6 : in natural range 1 to 49;
        restart : out std_logic);
end comparator;

architecture Behavioral of comparator is
    
begin
    process(current_number)
    begin
        if(current_number = num1) then restart <= '1';
        elsif(current_number = num2) then restart <= '1';
        elsif(current_number = num3) then restart <= '1';
        elsif(current_number = num4) then restart <= '1';
        elsif(current_number = num5) then restart <= '1';
        elsif(current_number = num6) then restart <= '1';
        else restart <= '0';
        end if;
    end process;
end Behavioral;
