LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DoubleDabblerTest IS
END DoubleDabblerTest;
 
ARCHITECTURE behavior OF DoubleDabblerTest IS 
 
    -- Component in test (DUT)
 
    COMPONENT DoubleDabbler16Bit
    PORT(
         BIN : IN  std_logic_vector(15 downto 0);
         BCD : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal BIN : std_logic_vector(15 downto 0) := x"00BA"; -- We test with the value 183 = 0x00BA

 	--Outputs
   signal BCD : std_logic_vector(19 downto 0);
 
BEGIN
 
	-- Instantiate the DUT
   uut: DoubleDabbler16Bit PORT MAP (
          BIN => BIN,
          BCD => BCD
        );

END;
