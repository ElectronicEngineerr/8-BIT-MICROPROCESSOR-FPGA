library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity program_memory is
	port(
			clk	: in std_logic;
			address	: in std_logic_vector(7 downto 0);
			-- Output:
			data_out	: out std_logic_vector(7 downto 0)
	);
end program_memory;

architecture arch of program_memory is

-- Tum komutlar:

-- Kaydet/Yukle komutlari
constant YUKLE_A_SBT	:std_logic_vector(7 downto 0) := x"86";
constant YUKLE_A		:std_logic_vector(7 downto 0) := x"87";
constant YUKLE_B_SBT	:std_logic_vector(7 downto 0) := x"88";
constant YUKLE_B		:std_logic_vector(7 downto 0) := x"89";
constant KAYDET_A		:std_logic_vector(7 downto 0) := x"96";	
constant KAYDET_B		:std_logic_vector(7 downto 0) := x"97";
-- ALU Komutlari
constant TOPLA_AB		:std_logic_vector(7 downto 0) := x"42";
constant CIKAR_AB		:std_logic_vector(7 downto 0) := x"43";
constant AND_AB			:std_logic_vector(7 downto 0) := x"44";
constant OR_AB			:std_logic_vector(7 downto 0) := x"45";
constant ARTTIR_A		:std_logic_vector(7 downto 0) := x"46";
constant ARTTIR_B		:std_logic_vector(7 downto 0) := x"47";
constant DUSUR_A		:std_logic_vector(7 downto 0) := x"48";
constant DUSUR_B		:std_logic_vector(7 downto 0) := x"49";
-- Atlama komutlari (Kosullu/Kosulsuz)
constant ATLA					:std_logic_vector(7 downto 0) := x"20";
constant ATLA_NEGATIFSE			:std_logic_vector(7 downto 0) := x"21";
constant ATLA_POZITIFSE			:std_logic_vector(7 downto 0) := x"22";
constant ATLA_ESITSE_SIFIR		:std_logic_vector(7 downto 0) := x"23";
constant ATLA_DEGILSE_SIFIR		:std_logic_vector(7 downto 0) := x"24";
constant ATLA_OVERFLOW_VARSA	:std_logic_vector(7 downto 0) := x"25";
constant ATLA_OVERFLOW_YOKSA	:std_logic_vector(7 downto 0) := x"26";
constant ATLA_ELDE_VARSA		:std_logic_vector(7 downto 0) := x"27";
constant ATLA_ELDE_YOKSA		:std_logic_vector(7 downto 0) := x"28";

type rom_type is array (0 to 127) of std_logic_vector(7 downto 0);
constant ROM : rom_type := (	
                                	0 => YUKLE_A_SBT, -- A registerine sabit sayi atama
                                	1 => x"F0",       -- 11110000  ( 240 )
                                	2 => YUKLE_B_SBT, -- B registerine sabit sayi atama
                                	3 => x"0F",       -- 00001111   ( 15 )
                                	4 => TOPLA_AB,    -- A ve B toplananacak ( 255)
                                	5 => KAYDET_A,    -- Toplam sonucunu A registerine kaydedecek
                                	6 => x"80",       -- Bellek adresi ( 128. adrese kaydedecek)
                                	7 => ATLA,        -- Programın sonuna atla
                                	8 => x"00",       -- Atlanan adres
                                	others => x"00"   -- 
								);



								
-- Sinyaller:
signal enable : std_logic;
begin

process(address)
begin
	if(address >= x"00" and address <= x"7F") then -- 0 ile 127 araliginda ise
		enable <= '1';
	else
		enable <= '0';
	end if;
end process;

----
process(clk)
begin
	if(rising_edge(clk)) then
		if(enable = '1') then
			data_out <= ROM(to_integer(unsigned(address)));
		end if;
	end if;
end process;

end architecture;