
-- VHDL Instantiation Created from source file memory_decoder_8x256.vhd -- 17:00:16 04/14/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT memory_decoder_8x256
	PORT(
		S : IN std_logic_vector(7 downto 0);
		mem_en : IN std_logic;          
		en : OUT std_logic_vector(255 downto 0)
		);
	END COMPONENT;

	Inst_memory_decoder_8x256: memory_decoder_8x256 PORT MAP(
		S => ,
		en => ,
		mem_en => 
	);


