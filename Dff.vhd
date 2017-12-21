----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:04:10 03/20/2012 
-- Design Name: 
-- Module Name:    Dff - Behavioral 
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

entity Dff is
    Port ( D : in  STD_LOGIC;
           clk, en : in  STD_LOGIC;
           Q : out  STD_LOGIC
          );
end Dff;

architecture Behavioral of Dff is

begin

	process (clk, en, D)
		begin
			if (en = '1' and clk'event) then
				 Q <= D;
			end if;			
		end process;

end Behavioral;

