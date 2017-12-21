----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:18 04/14/2012 
-- Design Name: 
-- Module Name:    tag_comparator - Behavioral 
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

entity tag_comparator2 is
    Port ( addr_req : in  STD_LOGIC_VECTOR (19 downto 0);
           addr_tag : in  STD_LOGIC_VECTOR (19 downto 0);
           tag_hit : out  STD_LOGIC;
           en : in  STD_LOGIC);
end tag_comparator2;

architecture Behavioral of tag_comparator2 is

begin
	process(addr_req, addr_tag, en)
		begin
			tag_hit <= '0';
			
			if en='1' then
				if addr_req = addr_tag then
					tag_hit <= '1';
				end if;
			end if;
		end process;
end Behavioral;

