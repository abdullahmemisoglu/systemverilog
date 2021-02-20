/* 
Author:
* Abdullah MEMISOGLU
* Notlar:
*/
// Time Units and resolution of the
simulation
`timescale 1ns/1ps
module tb_lab3_q_3 ();
logic a, b, c, d; // all the inputs
logic y; // all the outputs
lab3_q_3 in1(a, b, c, d, y);
initial begin
a = 0; b = 0; c = 0; d = 0; #10; //
a=0 b=0 c=0 d=0
a = 1; #10; // a=1 b=0 c=0 d=0
b = 1; #10; // a=1 b=1 c=0 d=0
c = 1; #10; // a=1 b=1 c=1 d=0
d = 1; #10 ; // a=1 b=1 c=1 d=1
a = 0 ; c = 0 ; d = 0 ; #10 ; // a=0
b=1 c=0 d=0
d = 1; #10 ; // a=0 b=1 c=0 d=1
c = 1 ; #10 ;// a=0 b=1 c=1 d=1
b = 0; d = 0 ; #10 ; // a=0 b=0 c=1
d=0
d = 1 ; #10 ; // a=0 b=0 c=1
d=1
a = 1 ; #10 ; // a=1 b=0 c=1 d=1
a = 0 ; c = 0 ; d = 1 ;#10 ;// a=0 b=0
c=0 d=1
a = 1 ; #10 ; // a=1 b=0 c=0
d=1
c = 1; d = 0 ; #10// a=1 b=0 c=1
d=0
b = 1 ; c = 0 ; d = 1 ;#10// a=1 b=1
c=0 d=1
a = 0 ; c = 1 ; d = 0 ; #10 ; // a=0 b=1
c=1 d=0
#20; // wait 20 ns after completion
$stop; // stop the simulation
end
endmodule
