----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:31 04/14/2012 
-- Design Name: 
-- Module Name:    reg_128_data - Behavioral 
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

entity reg_128_data is
    Port ( D : in  STD_LOGIC_VECTOR (127 downto 0);
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (127 downto 0);
           en : in  STD_LOGIC);
end reg_128_data;

architecture Behavioral of reg_128_data is
	component Dff
		port(d: in std_logic;
			  q: out std_logic;
			  clk: in std_logic;
			  en: in std_logic);
	end component;
	
	signal outbuf: std_logic_vector(127 downto 0);
	
begin

	gen: for i in 0 to 127 generate
		mem: Dff
			port map(d(i),
						q(i),
						clk,
						en);
	end generate;

end Behavioral;

