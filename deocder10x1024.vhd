----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:41 04/12/2012 
-- Design Name: 
-- Module Name:    memory_decoder_8x256 - Behavioral 
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

entity decoder10x1024 is
	port (S: in std_logic_vector(9 downto 0);
			en: out std_logic_vector(1023 downto 0);
			mem_en: in std_logic);
end decoder10x1024;

architecture Behavioral of decoder10x1024 is

	component decoder4x16 is
		port(D: in std_logic_vector(3 downto 0);
			  E: out std_logic_vector(15 downto 0);
			  en: in std_logic);
	end component;
	
	component decoder2x4 is
		port(D: in std_logic_vector(1 downto 0);
			  E: out std_logic_vector(3 downto 0);
			  en: in std_logic);
	end component;
	
	signal C1: std_logic_vector(63 downto 0);
	signal C2: std_logic_vector(3 downto 0);
	
begin
	stage1 : decoder2x4
		port map(S(9 downto 8), 
					C2(3 downto 0),
					mem_en);
	struct: for i in 4 downto 1 generate
		stage2 : decoder4x16
			port map(S(7 downto 4),
						C1(((16*i)-1) downto ((16*i)-16)),
						C2(i-1));
	
	
	struct: for j in 64 downto 1 generate
		stage3 : decoder4x16
			port map(S(3 downto 0),
						en(((16*i)-1) downto ((16*i)-16)),
						C1(i-1));
	end generate;
	end generate;
	
end Behavioral;

