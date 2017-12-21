----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:08 04/14/2012 
-- Design Name: 
-- Module Name:    inoutbuffer - Behavioral 
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

entity inoutbuffer is
    Port ( A : inout  STD_LOGIC_VECTOR (127 downto 0);
           B : inout  STD_LOGIC_VECTOR (127 downto 0);
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC);
end inoutbuffer;

architecture Behavioral of inoutbuffer is

	begin
		process(wr, rd, A, B)
			begin
				if wr='1' then
					B <= A;
				else B <= (others =>'Z');
				end if;
				if rd='1' then
					A <= B;
				else A <= (others => 'Z');
				end if;
			end process;
	end Behavioral;

