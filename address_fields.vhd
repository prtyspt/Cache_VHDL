----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:15 04/12/2012 
-- Design Name: 
-- Module Name:    address_fields - Behavioral 
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

entity address_fields is
	port (addr: in std_logic_vector(31 downto 0);
			word: out std_logic_vector(1 downto 0);
			set: out std_logic_vector(7 downto 0);
			tag: out std_logic_vector(21 downto 0);
			sep: in std_logic);
end address_fields;

architecture Behavioral of address_fields is
	begin
		process(addr)
			begin
				if sep = '1' then
					word <= addr (1 downto 0);
					set <= addr (9 downto 2);
					tag <= addr (31 downto 10);
				end if;
		end process;
	end Behavioral;

