---------------------------------------------------
-- square wave-------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity sqwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end sqwav;

architecture sqwav_arch of sqwav is
begin
process(clk)
      variable count:integer:=0;
      variable s:integer:=127;
  begin
    if (clk = '1' and clk'EVENT) then
      count := count + 1;
    end if;
    if(count>=n/2 and count<n) then
      s:= 0;
    elsif (count>=n) then count:=0;
      s:=127;
    end if;
--    n<=count;
    op<=s;
  end process;
  
end sqwav_arch;
-------------------------------------------------------------
---- Triangular wave-----------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity triwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end triwav;

architecture triwav_arch of triwav is
begin
process(clk)
      variable count:integer:=0;
      variable s:std_logic:='0';
  begin
    if (clk = '1' and clk'EVENT) then
      count := count + 1;
--      if(s='0') then
--      count := count + 1;
--    else
--      count := count - 1;
--    end if;
  end if;
    if(count>=n/2) then count:=0;
      s := NOT s;
    end if;
--    n<=count;
      if(s='0') then
      op <= count*255/n;
    else
      op <= 127-count*255/n;
    end if;
  end process;  
end triwav_arch;

--------------------------------------------------
-- sawtooth wave
library ieee;
use ieee.std_logic_1164.all;

entity sawtoothwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end sawtoothwav;

architecture sawtoothwav_arch of sawtoothwav is
begin
process(clk)
      variable count:integer:=0;
      variable s:integer:=10;
  begin
    if (clk = '1' and clk'EVENT) then
      count := count + 1;
    end if;
    if(count>=n) then count:=0;
    end if;
--    n<=count;
    op<= count*127/n;
  end process;
  
end sawtoothwav_arch;

-------------------------------------------------------
-- sine wave package
library ieee;
use ieee.std_logic_1164.all;

package sine_package is

  constant max_table_value: integer := 127;
  subtype table_value_type is integer range 0 to max_table_value;

  constant max_table_index: integer := 127;
  subtype table_index_type is integer range 0 to max_table_index;

  subtype sine_vector_type is std_logic_vector( 7 downto 0 );

  function get_table_value (table_index: table_index_type) return table_value_type;

end;

package body sine_package is

  function get_table_value (table_index: table_index_type) return table_value_type is
    variable table_value: table_value_type;
  begin
    case table_index is
      when 0 =>
        table_value := 1;
      when 1 =>
        table_value := 2;
      when 2 =>
        table_value := 4;
      when 3 =>
        table_value := 5;
      when 4 =>
        table_value := 7;
      when 5 =>
        table_value := 9;
      when 6 =>
        table_value := 10;
      when 7 =>
        table_value := 12;
      when 8 =>
        table_value := 13;
      when 9 =>
        table_value := 15;
      when 10 =>
        table_value := 16;
      when 11 =>
        table_value := 18;
      when 12 =>
        table_value := 19;
      when 13 =>
        table_value := 21;
      when 14 =>
        table_value := 22;
      when 15 =>
        table_value := 24;
      when 16 =>
        table_value := 26;
      when 17 =>
        table_value := 27;
      when 18 =>
        table_value := 29;
      when 19 =>
        table_value := 30;
      when 20 =>
        table_value := 32;
      when 21 =>
        table_value := 33;
      when 22 =>
        table_value := 35;
      when 23 =>
        table_value := 36;
      when 24 =>
        table_value := 38;
      when 25 =>
        table_value := 39;
      when 26 =>
        table_value := 41;
      when 27 =>
        table_value := 42;
      when 28 =>
        table_value := 44;
      when 29 =>
        table_value := 45;
      when 30 =>
        table_value := 46;
      when 31 =>
        table_value := 48;
      when 32 =>
        table_value := 49;
      when 33 =>
        table_value := 51;
      when 34 =>
        table_value := 52;
      when 35 =>
        table_value := 54;
      when 36 =>
        table_value := 55;
      when 37 =>
        table_value := 56;
      when 38 =>
        table_value := 58;
      when 39 =>
        table_value := 59;
      when 40 =>
        table_value := 61;
      when 41 =>
        table_value := 62;
      when 42 =>
        table_value := 63;
      when 43 =>
        table_value := 65;
      when 44 =>
        table_value := 66;
      when 45 =>
        table_value := 67;
      when 46 =>
        table_value := 69;
      when 47 =>
        table_value := 70;
      when 48 =>
        table_value := 71;
      when 49 =>
        table_value := 72;
      when 50 =>
        table_value := 74;
      when 51 =>
        table_value := 75;
      when 52 =>
        table_value := 76;
      when 53 =>
        table_value := 78;
      when 54 =>
        table_value := 79;
      when 55 =>
        table_value := 80;
      when 56 =>
        table_value := 81;
      when 57 =>
        table_value := 82;
      when 58 =>
        table_value := 84;
      when 59 =>
        table_value := 85;
      when 60 =>
        table_value := 86;
      when 61 =>
        table_value := 87;
      when 62 =>
        table_value := 88;
      when 63 =>
        table_value := 89;
      when 64 =>
        table_value := 90;
      when 65 =>
        table_value := 91;
      when 66 =>
        table_value := 93;
      when 67 =>
        table_value := 94;
      when 68 =>
        table_value := 95;
      when 69 =>
        table_value := 96;
      when 70 =>
        table_value := 97;
      when 71 =>
        table_value := 98;
      when 72 =>
        table_value := 99;
      when 73 =>
        table_value := 100;
      when 74 =>
        table_value := 101;
      when 75 =>
        table_value := 102;
      when 76 =>
        table_value := 102;
      when 77 =>
        table_value := 103;
      when 78 =>
        table_value := 104;
      when 79 =>
        table_value := 105;
      when 80 =>
        table_value := 106;
      when 81 =>
        table_value := 107;
      when 82 =>
        table_value := 108;
      when 83 =>
        table_value := 109;
      when 84 =>
        table_value := 109;
      when 85 =>
        table_value := 110;
      when 86 =>
        table_value := 111;
      when 87 =>
        table_value := 112;
      when 88 =>
        table_value := 112;
      when 89 =>
        table_value := 113;
      when 90 =>
        table_value := 114;
      when 91 =>
        table_value := 114;
      when 92 =>
        table_value := 115;
      when 93 =>
        table_value := 116;
      when 94 =>
        table_value := 116;
      when 95 =>
        table_value := 117;
      when 96 =>
        table_value := 118;
      when 97 =>
        table_value := 118;
      when 98 =>
        table_value := 119;
      when 99 =>
        table_value := 119;
      when 100 =>
        table_value := 120;
      when 101 =>
        table_value := 120;
      when 102 =>
        table_value := 121;
      when 103 =>
        table_value := 121;
      when 104 =>
        table_value := 122;
      when 105 =>
        table_value := 122;
      when 106 =>
        table_value := 123;
      when 107 =>
        table_value := 123;
      when 108 =>
        table_value := 123;
      when 109 =>
        table_value := 124;
      when 110 =>
        table_value := 124;
      when 111 =>
        table_value := 124;
      when 112 =>
        table_value := 125;
      when 113 =>
        table_value := 125;
      when 114 =>
        table_value := 125;
      when 115 =>
        table_value := 126;
      when 116 =>
        table_value := 126;
      when 117 =>
        table_value := 126;
      when 118 =>
        table_value := 126;
      when 119 =>
        table_value := 126;
      when 120 =>
        table_value := 126;
      when 121 =>
        table_value := 127;
      when 122 =>
        table_value := 127;
      when 123 =>
        table_value := 127;
      when 124 =>
        table_value := 127;
      when 125 =>
        table_value := 127;
      when 126 =>
        table_value := 127;
      when 127 =>
        table_value := 127;
    end case;
    return table_value;
  end;

end;


---------------------------------------------------------
-- sine wave
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sine_package.all;

entity sine_wave is
  port( clock, reset, enable: in std_logic;
        wave_out: out sine_vector_type);
end;

architecture arch1 of sine_wave is
  type state_type is ( counting_up, change_down, counting_down, change_up );
  signal state, next_state: state_type;
  signal table_index: table_index_type;
  signal positive_cycle: boolean;
begin

  process( clock, reset )
  begin
    if reset = '1' then
      state <= counting_up;
    elsif rising_edge( clock ) then
      if enable = '1' then
        state <= next_state;
      end if;
    end if;
  end process;

  process( state, table_index )
  begin
    next_state <= state;
    case state is
      when counting_up =>
        if table_index = max_table_index then
          next_state <= change_down;
        end if;
      when change_down =>
        next_state <= counting_down;
      when counting_down =>
        if table_index = 0 then
          next_state <= change_up;
        end if;
      when others => -- change_up
        next_state <= counting_up;
    end case;
  end process;

  process( clock, reset )
  begin
    if reset = '1' then
      table_index <= 0;
      positive_cycle <= true;
    elsif rising_edge( clock ) then
      if enable = '1' then
        case next_state is
          when counting_up =>
            table_index <= table_index + 1;
          when counting_down =>
            table_index <= table_index - 1;
          when change_up =>
            positive_cycle <= not positive_cycle;
          when others =>
            -- nothing to do
        end case;
      end if;
    end if;
  end process;

  process( table_index, positive_cycle )
    variable table_value: table_value_type;
  begin
    table_value := get_table_value( table_index );
    if positive_cycle then
      wave_out <= std_logic_vector(to_signed(table_value,sine_vector_type'length));
    else
      wave_out <= std_logic_vector(to_signed(-table_value,sine_vector_type'length));
    end if;
  end process;

end;


--------------------------------------------------------
-- total project entity

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Std_logic_unsigned.all;
use IEEE.Std_logic_arith.all;
use IEEE.Numeric_Std.all;
use IEEE.Std_logic_unsigned.all;
use work.sine_package.all;

entity final_tb is
port( clk:in std_logic; select_lines: in std_logic_vector(2 downto 0); hi: out sine_vector_type);
end;

architecture bench of final_tb is
component sine_wave
  port( clock, reset, enable: in std_logic;
        wave_out: out sine_vector_type);
end component;
component sqwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end component;
component triwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end component;
component sawtoothwav is
  port(clk:in std_logic; n :in integer; op:out integer);
end component;



  signal clock, reset, enable: std_logic:='0';
  signal wave_out: sine_vector_type;
  signal op,sqr_out,tri_out,saw_out,sin_out: integer;

  constant clock_period: time := 37 ns;
  signal stop_the_clock: boolean;
  signal n: integer:=1;

begin
  n<=512;
  enable <= '1';
  sin_block: sine_wave port map ( clock, reset, enable, wave_out );
  sqr_block: sqwav port map ( clock, n, sqr_out );
  tri_block: triwav port map (clock, n, tri_out );
  saw_block: sawtoothwav port map(clock, n, saw_out);
  
  sin_out<=conv_integer((wave_out));
  hi <= conv_std_logic_vector(op,8);
-------------------------------
-- this change it, bcoz wait for 5 ns will not be synthesizable.

--  initiate: process
--  begin
  
    -- initialisation code here for sine module

--    enable <= '0';
--    reset <= '1';
--    wait for 5 ns;
--    reset <= '0';

--    wait for 5 ns;
--    enable <= '1';

    -- Put test bench stimulus code here
--    wait;
--end process;
  
  choice: process(select_lines,clock)
  begin
if(select_lines="000") then
  op <= sqr_out;
elsif select_lines="001" then
  op <= saw_out;
elsif select_lines="010" then
  op <= tri_out;
elsif select_lines="011" then
  op <= sin_out;
elsif select_lines="100" then
  op <= sqr_out + saw_out;
elsif select_lines="101" then
  op <= sqr_out + sin_out;
elsif select_lines="110" then
  op <= sqr_out + tri_out;
else op <= 0;
end if;
  end process;
divideclock: process(clk)
  variable divider:std_logic_vector(15 downto 0):="0000000000000000";
begin
  if( clk='1'  and clk'EVENT) then
    divider := divider + '1';
  end if;
  clock <= divider(14);
end process;
-- for simulating in test bench
--  clocking: process
--  begin
--    while not stop_the_clock loop
--      clock <= '1', '0' after clock_period / 2;
--      wait for clock_period;
--    end loop;
--    wait;
--  end process;

end;
