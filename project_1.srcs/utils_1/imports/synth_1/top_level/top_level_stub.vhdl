-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
  Port ( 
    clk : in STD_LOGIC;
    raz : in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Sept_Segments : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end top_level;

architecture stub of top_level is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
begin
end;
