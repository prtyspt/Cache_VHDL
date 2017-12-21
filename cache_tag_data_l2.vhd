----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:13 04/14/2012 
-- Design Name: 
-- Module Name:    cache_tag_data_l1 - Behavioral 
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

entity cache_tag_data_l2 is
    Port ( add : in  STD_LOGIC_VECTOR (9 downto 0);
           tag : inout  STD_LOGIC_VECTOR (19 downto 0);
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC);
end cache_tag_data_l2;

architecture structural of cache_tag_data_l2 is
	component tag_mem2 is
		port(Din: in std_logic_vector(19 downto 0);
			  Dout: out std_logic_vector(19 downto 0);
			  en: in std_logic_vector(1023 downto 0);
			  clk: in std_logic);
	end component;
	
	component inout_buf_tag2 is
		port(A: inout std_logic_vector(19 downto 0);
			  B: inout std_logic_vector(19 downto 0);
			  wr: in std_logic;
			  rd: in std_logic);
	end component;
	
	component decoder10x1024 is
		port(S: in std_logic_vector(9 downto 0);
			  en: out std_logic_vector(1023 downto 0);
			  mem_en: in std_logic);
	end component;
	
	signal int: std_logic_vector(1023 downto 0);
	signal dat: std_logic_vector(19 downto 0);
	
begin

	decoder: decoder10x1024
		port map(add,
					int,
					en);
	buff: inout_buf_tag2
		port map(tag,
					dat,
					wr,
					rd);
	mem: tag_mem2
		port map(dat,
					tag,
					int,
					clk);

end structural;

