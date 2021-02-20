/* lab_3_quest.sv
* Author:
* Abdullah MEMISOGLU
* Notlar:
Problem 5
* Yapısal TASARIMLAR-A
*/
module lab3_quest
(
input logic [7:0] d0, d1, input logic
s,output logic [7:0] y
);
assign y = s ? d1 : d0;
s is 1, then y = d1,
otherwise y = d0
endmodule
