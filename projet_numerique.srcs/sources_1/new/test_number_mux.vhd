library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity tb_number_mux is
end tb_number_mux;

architecture Behavioral of tb_number_mux is
    component number_mux
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

    signal commande : natural range 0 to 6;
    signal cmd : std_logic_vector(2 downto 0); 
    signal clk : std_logic:='1';
    signal num_1 : natural range 1 to 49:= 12;
    signal num_2 : natural range 1 to 49:= 42;
    signal num_3 : natural  range 1 to 49:= 1;
    signal num_4 : natural range 1 to 49:= 40;
    signal num_5 : natural range 1 to 49:= 21;
    signal num_6 : natural range 1 to 49:= 3;
    signal num_out : natural range 1 to 49;
    
begin
    number_mux_1: number_mux port map (cmd, num_1, num_2, num_3, num_4, num_5, num_6, num_out);

    process(clk)
    begin
        if(clk'event and clk='1') then
            if(commande = 6) then
                commande <= 0;
            else 
                commande <= commande +1;
            end if;
        end if;
    end process;
        
    clk <= not clk after 5 ns;
    cmd <= std_logic_vector(to_unsigned(commande, 3));
end Behavioral;
