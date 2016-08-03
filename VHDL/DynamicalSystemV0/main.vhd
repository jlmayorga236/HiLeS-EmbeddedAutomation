----------------------------------------------------------------------------------
-- Main.vhdl 
----------------------------------------------------------------------------------
--  file    : main.vhdl
--  project : DynamicalSystemV0
--  author  : Jorge Luis Mayorga Taborda
--  email   : jl.mayorga236@uniandes.edu.co
--  company : Universidad de los Andes
--
--  Description :
--
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------






----------------------------------------------------------------------------------
-- Entity :: Main
----------------------------------------------------------------------------------
entity main is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           u : in  STD_LOGIC_VECTOR (31 downto 0);
			  y : out  STD_LOGIC_VECTOR (31 downto 0));
end main;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Behavioral of Main
----------------------------------------------------------------------------------
architecture Behavioral of main is

	signal x_i: unsigned(31 downto 0);
	signal u_i: unsigned(31 downto 0);
	
begin

	x_proc: process(clk, rst, u)
	begin
	u_i <= unsigned(u);
	 if(rst='0') then
		 x_i <= to_unsigned(0,x_i'length);
	 elsif(rising_edge(clk)) then
		
		 x_i <=  (x_i - 1000)/1000 + (u_i - 1000)/1000 + x_i;
	 
	 end if;
	end process x_proc;
	y <= std_logic_vector(x_i);
 
end Behavioral;
----------------------------------------------------------------------------------
