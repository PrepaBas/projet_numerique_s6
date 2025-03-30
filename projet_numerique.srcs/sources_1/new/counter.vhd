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

entity counter is
    Port ( clk : in STD_LOGIC;
           clk_25M : out STD_LOGIC;
           clk_3k : out STD_LOGIC;
           clk_1 : out STD_LOGIC);
end counter;

architecture Behavioral of counter is
    -- constantes de scale
    constant SCALE_25M : integer := 4;
    constant SCALE_3k : integer := 33333;
    constant SCALE_1 : integer := 100000000;
    
    --signaux des trois compteurs
    signal counter_25M : natural range 0 to (SCALE_25M - 1) := 0;
    signal s_25M : STD_LOGIC := '0';
    
    signal counter_3k : natural range 0 to (SCALE_3k - 1) := 0;
    signal s_3k : STD_LOGIC := '0';
    
    signal counter_1 : natural range 0 to (SCALE_1 - 1) := 0;
    signal s_1 : STD_LOGIC := '0';
    
begin
    process (clk)
    begin
        if (clk'event and clk='1') then
            if (counter_25M = SCALE_25M/2-1) then
                counter_25M <= 0;
                s_25M <= not s_25M; 
            else
                counter_25M <= counter_25M + 1;
            end if;

        
            if (counter_3k = SCALE_3k/2-1) then
                counter_3k <= 0;
                s_3k <= not s_3k;  
            else
                counter_3k <= counter_3k + 1;
            end if;
            
            if (counter_1 = SCALE_1/2-1) then
                counter_1 <= 0;
                s_1 <= not s_1;  
            else
                counter_1 <= counter_1 + 1;
            end if;
        end if;
    end process;

    clk_25M <= s_25M;
    clk_3k <= s_3k;
    clk_1 <= s_1;

end Behavioral;
