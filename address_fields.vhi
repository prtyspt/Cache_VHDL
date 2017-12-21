
-- VHDL Instantiation Created from source file address_fields.vhd -- 21:45:04 04/12/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT address_fields
	PORT(
		addr : IN std_logic_vector(31 downto 0);
		sep : IN std_logic;          
		word : OUT std_logic_vector(1 downto 0);
		set : OUT std_logic_vector(7 downto 0);
		tag : OUT std_logic_vector(21 downto 0)
		);
	END COMPONENT;

	Inst_address_fields: address_fields PORT MAP(
		addr => ,
		word => ,
		set => ,
		tag => ,
		sep => 
	);


