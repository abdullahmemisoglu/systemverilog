/* //SAYFA 1
* memisoglu.sv
* Hazirlayan:
* Abdullah MEMISOGLU
*/
module memisoglu (
  input logic clk,reset,
  input logic [31:0] komut,
  output logic [31:0]pc ,
  output logic hata
  );
lab8_q1_a_m_fetch uuf(clk,reset,pc);
lab7_decode udd
(.clk(clk),.reset(reset),.komut(komut),.hata(hata));
endmodule
