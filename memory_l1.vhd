----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:04 04/14/2012 
-- Design Name: 
-- Module Name:    memory_l1 - Behavioral 
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

entity memory_l1 is
    Port ( add : in  STD_LOGIC_VECTOR (7 downto 0);
           data : inout  STD_LOGIC_VECTOR (127 downto 0);
           rd : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC);
end memory_l1;

architecture structural of memory_l1 is

	component data_mem is
		port(Din: in std_logic_vector(127 downto 0);
			  Dout: out std_logic_vector(127 downto 0);
			  en: in std_logic_vector(255 downto 0);
			  clk: in std_logic);
	end component;
	
	component inoutbuffer is
		port(A: inout std_logic_vector(127 downto 0);
			  B: inout std_logic_vector(127 downto 0);
			  wr: in std_logic;
			  rd: in std_logic);
	end component;
	
	component memory_decoder_8x256 is
		port(S: in std_logic_vector(7 downto 0);
			  en: out std_logic_vector(255 downto 0);
			  mem_en: in std_logic);
	end component;
	
	signal int: std_logic_vector(255 downto 0);
	signal dat: std_logic_vector(127 downto 0);
	
begin

	decoder: memory_decoder_8x256
		port map(add,
					int,
					en);
	buff: inoutbuffer
		port map(data,
					dat,
					wr,
					rd);
	mem: data_mem 
		port map(dat,
					data,
					int,
					clk);


end structural;

