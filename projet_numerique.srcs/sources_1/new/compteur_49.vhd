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

entity counter_49 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           valid : in STD_LOGIC;
           num_out : out natural range 1 to 49);
end counter_49;

architecture Behavioral of counter_49 is
    -- constantes de scale
    signal counter : natural range 1 to 49 := 0;
    
begin
    process (clk, rst)
    begin
        if(rst = '1') then 
            counter <= 0;
        elsif(valid = '1') then 
            if (clk'event and clk='1') then
                if (counter = 49) then
                    counter <= 1; 
                else
                    counter <= counter + 1;
                end if;
            end if;
         end if;
    end process;

    num_out <= counter;

end Behavioral;
