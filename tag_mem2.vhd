----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:36 04/14/2012 
-- Design Name: 
-- Module Name:    tag_mem - Behavioral 
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

entity tag_mem2 is
    Port ( Din : in  STD_LOGIC_VECTOR (19 downto 0);
           Dout : out  STD_LOGIC_VECTOR (19 downto 0);
           en : in  STD_LOGIC_VECTOR (1023 downto 0);
           clk : in  STD_LOGIC);
end tag_mem2;

architecture Behavioral of tag_mem2 is

	component tag_data_l2
		port(D: in std_logic_vector(19 downto 0);
			  clk: in std_logic;
			  Q: out std_logic_vector(19 downto 0);
			  en: in std_logic);
	end component;

begin

	gen_array: for i in 0 to 1023 generate
		regs: tag_data_l2
			port map(Din(19 downto 0),
						clk,
						Dout(19 downto 0),
						en(i));
	end generate;

end Behavioral;

