library ieee;
use ieee.std_logic_1164.all;

package sine_package is

  constant max_table_value: integer := 127;
  subtype table_value_type is integer range -127 to max_table_value;

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
table_value := 0;
 when 1 =>
table_value := 19;
 when 2 =>
table_value := 38;
 when 3 =>
table_value := 55;
 when 4 =>
table_value := 70;
 when 5 =>
table_value := 83;
 when 6 =>
table_value := 93;
 when 7 =>
table_value := 101;
 when 8 =>
table_value := 106;
 when 9 =>
table_value := 109;
 when 10 =>
table_value := 109;
 when 11 =>
table_value := 106;
 when 12 =>
table_value := 100;
 when 13 =>
table_value := 93;
 when 14 =>
table_value := 83;
 when 15 =>
table_value := 72;
 when 16 =>
table_value := 59;
 when 17 =>
table_value := 45;
 when 18 =>
table_value := 31;
 when 19 =>
table_value := 16;
 when 20 =>
table_value := 2;
 when 21 =>
table_value := -13;
 when 22 =>
table_value := -26;
 when 23 =>
table_value := -39;
 when 24 =>
table_value := -50;
 when 25 =>
table_value := -59;
 when 26 =>
table_value := -67;
 when 27 =>
table_value := -73;
 when 28 =>
table_value := -77;
 when 29 =>
table_value := -79;
 when 30 =>
table_value := -79;
 when 31 =>
table_value := -78;
 when 32 =>
table_value := -74;
 when 33 =>
table_value := -68;
 when 34 =>
table_value := -62;
 when 35 =>
table_value := -53;
 when 36 =>
table_value := -44;
 when 37 =>
table_value := -34;
 when 38 =>
table_value := -24;
 when 39 =>
table_value := -13;
 when 40 =>
table_value := -2;
 when 41 =>
table_value := 8;
 when 42 =>
table_value := 18;
 when 43 =>
table_value := 27;
 when 44 =>
table_value := 36;
 when 45 =>
table_value := 43;
 when 46 =>
table_value := 49;
 when 47 =>
table_value := 53;
 when 48 =>
table_value := 56;
 when 49 =>
table_value := 58;
 when 50 =>
table_value := 58;
 when 51 =>
table_value := 57;
 when 52 =>
table_value := 54;
 when 53 =>
table_value := 50;
 when 54 =>
table_value := 46;
 when 55 =>
table_value := 40;
 when 56 =>
table_value := 33;
 when 57 =>
table_value := 26;
 when 58 =>
table_value := 18;
 when 59 =>
table_value := 10;
 when 60 =>
table_value := 2;
 when 61 =>
table_value := -5;
 when 62 =>
table_value := -13;
 when 63 =>
table_value := -19;
 when 64 =>
table_value := -25;
 when 65 =>
table_value := -31;
 when 66 =>
table_value := -35;
 when 67 =>
table_value := -39;
 when 68 =>
table_value := -41;
 when 69 =>
table_value := -42;
 when 70 =>
table_value := -42;
 when 71 =>
table_value := -42;
 when 72 =>
table_value := -40;
 when 73 =>
table_value := -37;
 when 74 =>
table_value := -34;
 when 75 =>
table_value := -29;
 when 76 =>
table_value := -25;
 when 77 =>
table_value := -19;
 when 78 =>
table_value := -14;
 when 79 =>
table_value := -8;
 when 80 =>
table_value := -2;
 when 81 =>
table_value := 3;
 when 82 =>
table_value := 9;
 when 83 =>
table_value := 14;
 when 84 =>
table_value := 18;
 when 85 =>
table_value := 22;
 when 86 =>
table_value := 25;
 when 87 =>
table_value := 28;
 when 88 =>
table_value := 30;
 when 89 =>
table_value := 31;
 when 90 =>
table_value := 31;
 when 91 =>
table_value := 31;
 when 92 =>
table_value := 29;
 when 93 =>
table_value := 27;
 when 94 =>
table_value := 25;
 when 95 =>
table_value := 22;
 when 96 =>
table_value := 18;
 when 97 =>
table_value := 15;
 when 98 =>
table_value := 11;
 when 99 =>
table_value := 6;
 when 100 =>
table_value := 2;
 when 101 =>
table_value := -2;
 when 102 =>
table_value := -6;
 when 103 =>
table_value := -10;
 when 104 =>
table_value := -13;
 when 105 =>
table_value := -16;
 when 106 =>
table_value := -18;
 when 107 =>
table_value := -20;
 when 108 =>
table_value := -22;
 when 109 =>
table_value := -22;
 when 110 =>
table_value := -23;
 when 111 =>
table_value := -22;
 when 112 =>
table_value := -22;
 when 113 =>
table_value := -20;
 when 114 =>
table_value := -18;
 when 115 =>
table_value := -16;
 when 116 =>
table_value := -14;
 when 117 =>
table_value := -11;
 when 118 =>
table_value := -8;
 when 119 =>
table_value := -5;
 when 120 =>
table_value := -2;
 when 121 =>
table_value := 1;
 when 122 =>
table_value := 4;
 when 123 =>
table_value := 7;
 when 124 =>
table_value := 9;
 when 125 =>
table_value := 11;
 when 126 =>
table_value := 13;
 when 127 =>
table_value := 15;
    end case;
    return table_value;
  end;

end;

