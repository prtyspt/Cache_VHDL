----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:37 04/14/2012 
-- Design Name: 
-- Module Name:    cache_controller - Behavioral 
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

entity cache_controller is
    Port ( add_req : in  STD_LOGIC_VECTOR (31 downto 0);
           C_busy : out  STD_LOGIC;
           C_reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           l1_miss : out  STD_LOGIC;
           l2_miss : out  STD_LOGIC;
           rd : out  STD_LOGIC;
           add_l1 : out  STD_LOGIC_VECTOR (31 downto 0);
           dav_l1 : out  STD_LOGIC;
           cache_hit_l1 : in  STD_LOGIC_VECTOR (3 downto 0);
           add_l2 : out  STD_LOGIC_VECTOR (31 downto 0);
           dav_l2 : out  STD_LOGIC;
           cache_hit_l2 : in  STD_LOGIC_VECTOR (7 downto 0));
end cache_controller;

architecture Behavioral of cache_controller is

	signal C1, C2: std_logic_vector(3 downto 0);

	begin
		process(clk, en, add_req, cache_hit_l1, C1)
			begin
		if (clk'event and (clk ='0' or clk='1')) then
			if en='1' then
				add_l1 <= add_req;
			end if;
			
			if (cache_hit_l1(0) = '1' or cache_hit_l1(1) = '1' or cache_hit_l1(2) = '1' or cache_hit_l1(3) = '1') then 
				dav_l1 <= '1';
				C1 <= C1 + 1;
				add_l1 <= add_req + 1;
				rd <= '1';
			else
				l1_miss <= '1';
				add_l2 <= add_req;
			end if;
		end if;
	end process;
	
	process(clk, en, add_req, cache_hit_L2, C2)
	begin
		if clk'event then
			if (cache_hit_l2(0) = '1' or cache_hit_l2(1) = '1' or cache_hit_l2(2) = '1' or cache_hit_l2(3) = '1' or cache_hit_l2(4) = '1' or cache_hit_l2(5) = '1' or cache_hit_l2(6) = '1' or cache_hit_l2(7) = '1') then 
				dav_l2 <= '1';
				C2 <= C2 + 1;
				add_l2 <= add_req + 1;
				rd <= '1';
			else
				l2_miss <= '1';
			end if;
		end if;
	end process;
	
	
	


end Behavioral;

