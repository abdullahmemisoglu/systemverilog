/*tb_lab3_q_2.sv
Author:
* Abdullah MEMISOGLU
* Notlar:
* Y = NOT A and B denkleminin simulasyonu
* Basit bir devrede gecikme simülasyonu
* Bütün olası girişlere göre çıkış gözlemlenir.
*/
// Time Units and resolution of the simulation
`timescale 1ns/1ps
module tb_lab3_q_2 ();
// These names do not need to be the same as the part1 ports
// but, we make them the same to make it easier to understand
// which is connected to what port
logic a, b; // all the inputs
logic y; // all the outputs
// Explicit port mapping. Always prefer it, vs. the implicit.
lab3_q_2 uut(.a(a), .b(b), .y(y));
// This part is applied to the circuit sequentially.
// The results can be inspected
initial begin
a = 0; b = 0; #10; // a = 0, b = 0, wait 10 ns
b = 1; #10; // a = 0, b = 1, wait 10 ns
a = 1; #10; // a = 1, b = 1, wait 10 ns
b = 0; #10; // a = 1, b = 0, wait 10 ns
#20; // wait 20 ns after completion
$stop; // stop the simulation
end
endmodule
