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

entity tag_mem is
    Port ( Din : in  STD_LOGIC_VECTOR (21 downto 0);
           Dout : out  STD_LOGIC_VECTOR (21 downto 0);
           en : in  STD_LOGIC_VECTOR (255 downto 0);
           clk : in  STD_LOGIC);
end tag_mem;

architecture Behavioral of tag_mem is

	component tag_data_l1
		port(D: in std_logic_vector(21 downto 0);
			  clk: in std_logic;
			  Q: out std_logic_vector(21 downto 0);
			  en: in std_logic);
	end component;

begin

	gen_array: for i in 0 to 255 generate
		regs: tag_data_l1
			port map(Din(21 downto 0),
						clk,
						Dout(21 downto 0),
						en(i));
	end generate;

end Behavioral;

