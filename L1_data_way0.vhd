----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:18 04/14/2012 
-- Design Name: 
-- Module Name:    L1_data_way0 - Behavioral 
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

entity L1_data_way0 is
    Port ( add : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : inout  STD_LOGIC_VECTOR (31 downto 0);
           cache_hit : inout  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC);
end L1_data_way0;

architecture structural of L1_data_way0 is

	signal F1: std_logic_vector(1 downto 0);
	signal F2: std_logic_vector(7 downto 0);
	signal F3: std_logic_vector(21 downto 0);
	
	signal data: std_logic_vector(127 downto 0);
	signal tag: std_logic_vector(21 downto 0);
	
	signal select_add: std_logic_vector(255 downto 0);
	
	component memory_l1 is
		port(add: in std_logic_vector(7 downto 0);
			  data: inout std_logic_vector(127 downto 0);
			  rd, wr, clk, en: in std_logic);
   end component;
	
	component cache_tag_data_l1 is
		port(add: in std_logic_vector(7 downto 0);
			  tag: inout std_logic_vector(21 downto 0);
			  rd, wr, clk, en: in std_logic);
	end component;
	
	component address_fields is
		port(addr: in std_logic_vector(31 downto 0);
			  word: out std_logic_vector(1 downto 0);
			  set: out std_logic_vector(7 downto 0);
			  tag: out std_logic_vector(21 downto 0);
			  sep: in std_logic);
	end component;
	
	component tag_comparator is
		port(addr_req: in std_logic_vector(21 downto 0);
			  addr_tag: in std_logic_vector(21 downto 0);
			  tag_hit: out std_logic;
			  en: in std_logic);
	end component;
	
	component data_buff_l1 is
		port(Din: in std_logic_vector(127 downto 0);
			  Dout: out std_logic_vector(31 downto 0);
			  en: in std_logic_vector(1 downto 0);
			  clk: in std_logic);
	end component;
	

begin

data_mem: memory_l1 
	port map(F2,
				data,
				rd,
				wr,
				clk,
				en);
				
tag_mem: cache_tag_data_l1 
	port map(F2,
				tag,
				rd,
				wr,
				clk,
				en);
				
address_seperate: address_fields 
	port map(add,
				F1,
				F2,
				F3,
				en);
				
compare: tag_comparator 
	port map(F3,
				tag,
				cache_hit,
				en);

data_seperate: data_buff_l1
	port map(data,
				data_out,
				F1,
				cache_hit);

end structural;

