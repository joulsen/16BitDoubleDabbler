----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:45 04/28/2020 
-- Design Name: 
-- Module Name:    ClockedDoubleDabbler16Bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockedDoubleDabbler16Bit is
    Port ( CLK 	: in  	STD_LOGIC;
			  RESET 	: in		STD_LOGIC;
           BIN 	: in  	UNSIGNED (15 downto 0);
           BCD 	: out  	STD_LOGIC_VECTOR (19 downto 0)
			  );
end ClockedDoubleDabbler16Bit;

architecture Behavioral of ClockedDoubleDabbler16Bit is

signal scratch : UNSIGNED(35 downto 0) := (others => '0');
signal cntr		: UNSIGNED(7 downto 0) := (others => '0');

begin

BCD <= STD_LOGIC_VECTOR(scratch(35 downto 16));

process(clk)
begin
	if rising_edge(clk) then
		if reset = '1' then
			cntr <= (others => '0');
			scratch(35 downto 16) <= (others => '0');
			scratch(15 downto 0) <= BIN;
		else
			if cntr > 15 then
			else
				if scratch(34 downto 31) > 4 then
					scratch(35 downto 31) <= scratch(35 downto 31) + 3;
				end if;
				if scratch(31 downto 28) > 4 then
					scratch(35 downto 28) <= scratch(35 downto 28) + 3;
				end if;
				if scratch(27 downto 24) > 4 then
					scratch(35 downto 24) <= scratch(35 downto 24) + 3;
				end if;
				if scratch(23 downto 20) > 4 then
					scratch(35 downto 20) <= scratch(35 downto 20) + 3;
				end if;
				if scratch(19 downto 16) > 4 then
					scratch(35 downto 16) <= scratch(35 downto 16) + 3;
				end if;
				scratch <= scratch sll 1;
				cntr <= cntr + 1;
			end if;
		end if;
	end if;
end process;


end Behavioral;

