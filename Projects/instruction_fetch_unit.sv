/* //SAYFA1
* lab8_q1_a_m.sv
Notlar:
ELM235 2020 Bahar Lab8 - Problem 1
*Instruction Fetch Ünitesi
* Hazirlayan:
* Abdullah MEMISOGLU
*/
module lab8_q1_a_m (
  input logic clk,reset ,
  output logic [31:0] pc ,
  input logic pc_update ,
  input logic [31:0] pc_new );
logic [31:0] pc_reg;
always_ff@(posedge clk, negedge reset)
begin
  if(!reset)
    pc_reg<=32'b0;
    else if(pc_update)
    pc_reg<=pc_new;
  else
    pc_reg<=pc_reg+32'd4;
    end
always_ff@(posedge clk)
pc<=pc_reg;
endmodule
