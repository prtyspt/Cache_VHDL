
-- VHDL Instantiation Created from source file tag_mem2.vhd -- 20:05:40 04/26/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT tag_mem2
	PORT(
		Din : IN std_logic_vector(19 downto 0);
		en : IN std_logic_vector(1023 downto 0);
		clk : IN std_logic;          
		Dout : OUT std_logic_vector(19 downto 0)
		);
	END COMPONENT;

	Inst_tag_mem2: tag_mem2 PORT MAP(
		Din => ,
		Dout => ,
		en => ,
		clk => 
	);


