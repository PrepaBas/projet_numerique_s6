// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module top_level(clk, raz, AN, Sept_Segments);
  input clk;
  input raz;
  output [7:0]AN;
  output [6:0]Sept_Segments;
endmodule
