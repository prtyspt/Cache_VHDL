----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:40 04/14/2012 
-- Design Name: 
-- Module Name:    tag_data_l1 - Behavioral 
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

entity tag_data_l2 is
    Port ( D : in  STD_LOGIC_VECTOR (19 downto 0);
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (19 downto 0);
           en : in  STD_LOGIC);
end tag_data_l2;

architecture Behavioral of tag_data_l2 is

	component Dff
		port(d: in std_logic;
			  q: out std_logic;
			  clk: in std_logic;
			  en: in std_logic);
	end component;
	
	signal outbuf: std_logic_vector(19 downto 0);

begin
	gen: for i in 0 to 19 generate
		mem: Dff
			port map(d(i),
						q(i),
						clk,
						en);
	end generate;


end Behavioral;

