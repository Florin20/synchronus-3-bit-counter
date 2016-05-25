library IEEE;
use IEEE.std_logic_1164.all;

entity t_flipflop is
	port(T, S, R, clk: in std_logic;
	Q: out std_logic);
end entity;

architecture behav of t_flipflop is
begin
	process(clk, S, R)
	variable temp: std_logic;
	begin
		if(S = '1' and R = '0') then
			temp := '1';
		elsif(S = '0' and R = '1') then
			temp := '0';
		elsif(S = '1' and R = '1') then
			temp := not temp;
		else
			if(rising_edge(clk)) then
				if(T = '1') then
					temp := not temp;
				else
				end if;
			end if;
		end if;
	Q <= temp;
end process;
end architecture;
			