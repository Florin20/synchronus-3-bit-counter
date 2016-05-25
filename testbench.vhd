library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture behav of testbench is
component counter is
	port(Reset: in std_logic;
	clk: in std_logic;
	Q: out std_logic_vector(2 downto 0));
end component;

signal reset, clk: std_logic;
signal Q: std_logic_vector(2 downto 0);
begin
	clock_generator:process
	begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
	end process;
	
	p:process
	begin
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait;
	end process;
	
	c: counter port map(reset, clk, Q);
end architecture;