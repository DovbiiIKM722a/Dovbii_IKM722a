library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity kxx_rom is
	port (
		R : in STD_LOGIC;
		X : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture kxx_rom_arc of kxx_rom is  
	signal inp_addr   : STD_LOGIC_VECTOR(4 downto 0);
	signal y_internal : STD_LOGIC_VECTOR(3 downto 0);

	type sbox_array is array (0 to 31) of STD_LOGIC_VECTOR(3 downto 0);
	constant kxx : sbox_array := (
		x"7", x"D", x"E", x"3", x"0", x"6", x"9", x"A",
		x"1", x"2", x"8", x"5", x"B", x"C", x"4", x"F",
		x"4", x"8", x"9", x"3", x"E", x"B", x"5", x"0",
		x"A", x"6", x"7", x"C", x"D", x"1", x"2", x"F"
	); 
	
	constant INJECT_ERROR  : boolean := true; 
	constant MISSING_VAL_1 : STD_LOGIC_VECTOR(3 downto 0) := x"D";
	constant REPLACE_VAL_1 : STD_LOGIC_VECTOR(3 downto 0) := x"F";
	constant MISSING_VAL_2 : STD_LOGIC_VECTOR(3 downto 0) := x"3";
	constant REPLACE_VAL_2 : STD_LOGIC_VECTOR(3 downto 0) := x"F";

begin
	inp_addr <= R & X;
	
	y_internal <= kxx(to_integer(unsigned(inp_addr))); 
	
	Y <= REPLACE_VAL_1 when (INJECT_ERROR and y_internal = MISSING_VAL_1) else
	     REPLACE_VAL_2 when (INJECT_ERROR and y_internal = MISSING_VAL_2) else 
	     y_internal;

end architecture;