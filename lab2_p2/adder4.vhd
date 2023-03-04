LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIT_ADDER_1 is
	port( a, b, cin         : in  STD_LOGIC;
	      sum, cout         : out STD_LOGIC );
end BIT_ADDER_1;

architecture BHV of BIT_ADDER_1 is
begin
	
	-- Calculate the sum of the 1-BIT adder.
	sum <=  (a xor b) xor cin;
	-- Calculates the carry out of the 1-BIT adder.
	cout <= (a and b) or (cin and (a xor b));
end BHV;







LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder4_aux is
	port( a, b		: in	STD_LOGIC_VECTOR(3 downto 0);
			cin      : in STD_LOGIC;
	      ans		: out	STD_LOGIC_VECTOR(3 downto 0);
--	      cout		: out	STD_LOGIC);
end adder4_aux;



architecture STRUCTURE of adder4_aux is


component BIT_ADDER_1
	port( a, b, cin		: in  STD_LOGIC;
	      sum, cout		: out STD_LOGIC );
end component;




signal c1, c2, c3 : STD_LOGIC;
begin

b_adder0: BIT_ADDER_1 port map (a(0), b(0), cin, ans(0), c1);
b_adder1: BIT_ADDER_1 port map (a(1), b(1), c1, ans(1), c2);
b_adder2: BIT_ADDER_1 port map (a(2), b(2), c2, ans(2), c3);
b_adder3: BIT_ADDER_1 port map (a(3), b(3), c3, ans(3), cout);


END STRUCTURE;
