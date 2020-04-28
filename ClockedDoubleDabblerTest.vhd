--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:54:11 04/28/2020
-- Design Name:   
-- Module Name:   C:/Users/Andreas/XilinxShared/DoubleDabbler16Bit/ClockedDoubleDabblerTest.vhd
-- Project Name:  DoubleDabbler16Bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ClockedDoubleDabbler16Bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY ClockedDoubleDabblerTest IS
END ClockedDoubleDabblerTest;
 
ARCHITECTURE behavior OF ClockedDoubleDabblerTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ClockedDoubleDabbler16Bit
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         BIN : IN  UNSIGNED(15 downto 0);
         BCD : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal BIN : UNSIGNED(15 downto 0) := x"00BA";

 	--Outputs
   signal BCD : std_logic_vector(19 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

	RESET <= '1', '0' after 20 ns;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ClockedDoubleDabbler16Bit PORT MAP (
          CLK => CLK,
          RESET => RESET,
          BIN => BIN,
          BCD => BCD
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
