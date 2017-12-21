----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:53 04/14/2012 
-- Design Name: 
-- Module Name:    data_buff_l1 - Behavioral 
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

entity data_buff_l1 is
    Port ( Din : in  STD_LOGIC_VECTOR (127 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           en : in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC);
			  
end data_buff_l1;

architecture Behavioral of data_buff_l1 is

begin
	process(clk, en)
		begin
			if (clk'event) then
				case en is
					when "00" =>
						Dout <= Din(127 downto 96);
					when "01" =>
						Dout <= Din(95 downto 64);
					when "10" =>
						Dout <= Din(63 downto 32);
					when others =>
						Dout <= Din(31 downto 0);
				end case;
			end if;
		end process;
end Behavioral;

