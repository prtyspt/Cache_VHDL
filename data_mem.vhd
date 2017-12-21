----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:37 04/14/2012 
-- Design Name: 
-- Module Name:    data_mem - Behavioral 
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

entity data_mem is
    Port ( Din : in  STD_LOGIC_VECTOR (127 downto 0);
           Dout : out  STD_LOGIC_VECTOR (127 downto 0);
           en : in  STD_LOGIC_VECTOR (255 downto 0);
           clk : in  STD_LOGIC);
end data_mem;

architecture Behavioral of data_mem is
	component reg_128_data
		port(D: in std_logic_vector(127 downto 0);
			  clk: in std_logic;
			  Q: out std_logic_vector(127 downto 0);
			  en: in std_logic);
	end component;

begin
	gen_array: for i in 0 to 255 generate
		regs: reg_128_data
			port map(Din(127 downto 0),
						clk,
						Dout(127 downto 0),
						en(i));
	end generate;

end Behavioral;

