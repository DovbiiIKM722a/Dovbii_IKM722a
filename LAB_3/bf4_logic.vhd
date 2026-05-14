-------------------------------------------------------------------------------
-- Lab Work 2 - Combinatorial Logic Implementations
-- Example 1: multiply output combinatorial circuit
--            using logic operators (2 variants)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity bf4_logic is
	port(
		X : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
		);
end bf4_logic;

architecture bf4_logic of bf4_logic is
	signal P : STD_LOGIC_VECTOR(18 downto 0);
begin
	-- Variant 1: equations built on default results of minimization
	P(0) <= not X(3) and X(1) and not X(0);           -- 0-10
	P(1) <= X(2) and X(1) and X(0);                   -- -111
	P(2) <= not X(3) and not X(2) and not X(1) and X(0); -- 0001
	P(3) <= X(3) and X(2) and not X(1);               -- 110-
	P(4) <= not X(2) and X(1) and not X(0);           -- -010
	P(5) <= not X(3) and not X(1) and X(0);           -- 0-01
	P(6) <= X(2) and not X(1) and X(0);               -- -101
	P(7) <= not X(3) and not X(2) and not X(0);       -- 00-0
	P(8) <= X(3) and X(2) and X(1);                   -- 111-
	P(9) <= X(3) and X(1) and X(0);                   -- 1-11
	P(10) <= not X(3) and X(1) and X(0);              -- 0-11
	P(11) <= X(3) and X(2) and not X(1) and not X(0); -- 1100
	P(12) <= X(3) and not X(2) and not X(1) and X(0); -- 1001
	P(13) <= not X(3) and X(2) and X(0);              -- 01-1
	P(14) <= not X(2) and X(1) and X(0);              -- -011
	P(15) <= not X(3) and not X(2) and not X(1);      -- 000-
	P(16) <= X(3) and not X(1) and not X(0);          -- 1-00
	P(17) <= not X(3) and X(2) and X(1) and not X(0); -- 0110
	
	Y(3) <= P(0) or P(1) or P(2) or P(3) or P(4);
	Y(2) <= P(5) or P(6) or P(7) or P(8) or P(9);
	Y(1) <= P(10) or P(11) or P(7) or P(12) or P(1) or P(13);
	Y(0) <= P(14) or P(15) or P(16) or P(17) or P(9);
	
	
end bf4_logic;
