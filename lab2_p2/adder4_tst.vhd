


entity TEST_ADD4 is
end TEST_ADD4;

-- El testbench del sumador de 4 bits para 2 casos distintos

architecture behavior of TEST_ADD4 is 

	component adder4
		port( a, b		: in    	STD_LOGIC_VECTOR(3 downto 0) ;
				cin 		: in STD_LOGIC;
		      ans		: out		STD_LOGIC_VECTOR(3 downto 0) ;
		      cout		: out 	STD_LOGIC		);
	end component;

	signal a, b		: STD_LOGIC_VECTOR(3 downto 0):= "0000";
	signal cin		: STD_LOGIC := '0';
	signal ans		: STD_LOGIC_VECTOR(3 downto 0);
	signal cout		: STD_LOGIC;
	
	
	
	begin
	uut: adder4 port map (a => a,b => b, cin=>cin, ans => ans,cout => cout);
		stim_process: process
		begin

		-- Case 1

			a <= "0000";
			b <= "0000";
			cin <='0';
			
			wait for 40 ns;
		
		-- Case 2 

			a <= "0001";
			b <= "0001";
			cin <='0';
			
			wait for 40 ns;
		end process;
		
END;