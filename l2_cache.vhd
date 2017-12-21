----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:55 04/15/2012 
-- Design Name: 
-- Module Name:    l2_cache - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity l2_cache is
    Port ( add : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : inout  STD_LOGIC_VECTOR (31 downto 0);
           cache_hit : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           en : in  STD_LOGIC_VECTOR (7 downto 0));
end l2_cache;

architecture structural of l2_cache is
	component l2_data_way0 is
		port(add: in std_logic_vector(31 downto 0);
			  data_out: inout std_logic_vector(31 downto 0);
			  cache_hit: out std_logic;
			  clk, en, rd, wr: in std_logic);
	end component;
	
begin
	sets: for i in 0 to 7 generate
		struct: l2_data_way0 
			port map(add,
						data_out,
						cache_hit(i),
						clk,
						en(i),
						rd,
						wr);
	end generate;


end structural;

