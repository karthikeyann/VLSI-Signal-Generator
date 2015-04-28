--memory bank** pg no. 316 VHDL Programming By Example.pdf


--------------------------------
--------------------------------
-- REAL is NOT SYNTHESISABLE  --
--------------------------------
--------------------------------
--- one more disadvantage is that exact value are not coming--------
-----write  phase accumulator-----
-----connect it to this-----------
------use interpolation with lookuptable method----
----witea general code for interpolation-----
-------store 1024 point from 0 to 90 degree-----
------- storre it in 32 bit form --------
--------similarly write a general method for arbitrary signals-----



library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity sinewav is
  port(clk:in std_logic; n :in REAL; op:out REAL);
end sinewav;

architecture sinewav_arch of sinewav is
begin 
  process(clk,n)
    variable val1,val2,val3,val4,sqr: REAL;
    begin
      if(clk='1' and clk'EVENT) then
        if(n>500.0 or n<-500.0) then
          val1:=0.0;
        else
--          val1:=n;
  val1:=n*3.14*0.0055555555556;
end if;
  sqr := val1*val1;   --x2
  val2:= sqr*val1*0.16666666666;  --x3
  val3:= val2*sqr*0.05; --x5
  val4:= val3*sqr*0.02380952380; --x7
  op<= val1-val2+val3-val4;
end if;
end process;
end sinewav_arch;


----------TESTBENCH----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity tb is
end tb;
architecture tb_arch of tb is
component sinewav is
  port(clk:in std_logic; n :in REAL; op:out REAL);
end component;
signal x,op:REAL;
signal i:integer:=0;
signal clk:STD_LOGIC;
begin
  k1: sinewav port map(clk,x,op);
  process
    begin
      x<=0.0 after 0 ns;
      wait for 10 ns;
  for i in 0 to 500 loop
    x<= x + 1.0;
    wait for 10 ns;
  end loop;
  wait;
end process;
end tb_arch;