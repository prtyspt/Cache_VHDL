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

entity decoder4x16 is
	port (D: in std_logic_vector(3 downto 0);
			E: out std_logic_vector(15 downto 0);
			en: in std_logic);
end decoder4x16;

architecture Behavioral of decoder4x16 is

begin
	process(D, en)
		begin
			if en='1' then
				case D is
					when "0000" =>
						E <= (others => '0');
						E(0) <= '1';
					when "0001" =>
						E <= (others => '0');
						E(1) <= '1';
					when "0010" =>
						E <= (others => '0');
						E(2) <= '1';
					when "0011" =>
						E <= (others => '0');
						E(3) <= '1';
					when "0100" =>
						E <= (others => '0');
						E(4) <= '1';
					when "0101" =>
						E <= (others => '0');
						E(5) <= '1';
					when "0110" =>
						E <= (others => '0');
						E(6) <= '1';
					when "0111" =>
						E <= (others => '0');
						E(7) <= '1';
					when "1000" =>
						E <= (others => '0');
						E(8) <= '1';
					when "1001" =>
						E <= (others => '0');
						E(9) <= '1';
					when "1010" =>
						E <= (others => '0');
						E(10) <= '1';
					when "1011" =>
						E <= (others => '0');
						E(11) <= '1';
					when "1100" =>
						E <= (others => '0');
						E(12) <= '1';
					when "1101" =>
						E <= (others => '0');
						E(13) <= '1';
					when "1110" =>
						E <= (others => '0');
						E(14) <= '1';
					when "1111" =>
						E <= (others => '0');
						E(15) <= '1';
					when others =>
						E <= (others => 'X');
				end case;
			end if;
		end process;
					

end Behavioral;

