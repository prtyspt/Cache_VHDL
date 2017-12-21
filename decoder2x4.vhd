----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:02 04/14/2012 
-- Design Name: 
-- Module Name:    decoder4x16 - Behavioral 
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

entity decoder2x4 is
	port (D: in std_logic_vector(1 downto 0);
			E: out std_logic_vector(3 downto 0);
			en: in std_logic);
end decoder2x4;

architecture Behavioral of decoder2x4 is

begin
	process(D, en)
		begin
			if en='1' then
				case D is
					when "00" =>
						E <= (others => '0');
						E(0) <= '1';
					when "01" =>
						E <= (others => '0');
						E(1) <= '1';
					when "10" =>
						E <= (others => '0');
						E(2) <= '1';
					when "11" =>
						E <= (others => '0');
						E(3) <= '1';
					when others =>
						E <= (others => 'X');
				end case;
			end if;
		end process;
					

end Behavioral;

