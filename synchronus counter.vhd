library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
	port(Reset: in std_logic;
	clk: in std_logic;
	Q: out std_logic_vector(2 downto 0));
end entity;

architecture behav of counter is

component t_flipflop is
	port(T, S, R, clk: in std_logic;
	Q: out std_logic);
end component;
	
signal r1, r2, r3, N1, N2, N3: std_logic;
begin
	rst:process(Reset)
	begin
		if(Reset = '1') then
			r1 <= '1';
			r2 <= '1';
			r3 <= '1';
		else
			r1 <= '0';
			r2 <= '0';
			r3 <= '0';
		end if;
	end process;
	
	N3 <= N1 and N2;
	c1: t_flipflop port map(N3, '0', r1, clk, Q(2));
	c2: t_flipflop port map(N1, '0', r2, clk, N2);
	c3: t_flipflop port map('1', '0', r3, clk, N1);
	Q(1) <= N2;
	Q(0) <= N1;
end architecture;
	
	
	