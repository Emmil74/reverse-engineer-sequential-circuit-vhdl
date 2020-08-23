library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity reverseEng is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           a : in  STD_LOGIC;
           y : out  STD_LOGIC);
end reverseEng;

architecture Behavioral of reverseEng is
type statetype is (state0, state1, state2, state3);
signal state:statetype;

begin
process (clk, reset, a) begin 
if (reset = '0') then state <= state0;
elsif rising_edge(clk) then 

case (state) is 
when state0 =>
if (a='0') then state <= state0;
elsif (a='1') then state <= state1;
end if;
when state1 =>
if (a='0') then state <= state0;
elsif (a='1') then state <=state2;
end if;
when state2 => 
if (a='1') then state <= state1;
elsif (a='0') then state <= state0;
end if;
when state3 =>
state <= state3;
when others =>
state <= state0;
end case;
end if;
end process;

--output logic 
y <= '1' when state = state2 else '0';
end Behavioral;

