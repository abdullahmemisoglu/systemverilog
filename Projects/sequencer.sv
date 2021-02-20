/*lab6_q2_a_m.sv //SAYFA 1
Notlar:
ELM235 2020 Bahar Lab6 - Problem 2
*Sıralayıcı
* Hazirlayan:
* Abdullah MEMISOGLU
*/
module lab6_q2_a_m (
  input logic clk, reset,
  input logic [4:0] D,
  input logic baslat,
  output logic y,
  output logic mesgul );
typedef enum { s0,s1, s2, s3, s4, s5, s6, s7} statetype;
/* s0(s0),s1(baslat=1 olunca y=0) ,
s2(d0) ,s3(d1) ,s4(d2) ,s5(d3) ,s6(d4) ,s7(d bitince y = 1) */
statetype state,next_state;
always_ff @(posedge clk) //SAYFA2
begin
if(reset)
state <= s0;
else
state <= next_state;
end
always_comb
begin
case(state)
  s0:
    begin
    if(!baslat) //baslat 0 iken s0 sarti saglandi.
    next_state = s0;
    else
    next_state = s1; /*baslat 1 olduktan sonra 1 clk
    cycle lojik 0 sartı */
    end
  s1:
    begin
    if(!baslat)
    next_state = s2;
    else
    next_state = s0;
    end
  s2:
    begin
    if(!baslat)
    next_state = s3;
    else
    next_state = s0;
    end
  s3:
    begin
    if(!baslat)
    next_state = s4;
    else
    next_state = s0;
    end
  s4:
    begin
    if(!baslat)
    next_state = s5;
    else
    next_state = s0;
    end
  s5:
    begin
    if(!baslat)
    next_state = s6;
    else
    next_state = s0;
    end
  s6:
    begin
    if(!baslat)
    next_state = s7;
    else
    next_state = s0;
    end
  s7:
    begin
    next_state = s0;
    end
    default: next_state = s0;
endcase //SAYFA4
end
always_comb
begin
case(state)
  s0:
    begin
    mesgul = 0;
    y = 1;
    end
  s1:
    begin
    mesgul = 0;
    y = 0;
    end
  s2:
    begin
    mesgul = 1;
    y = D[0];
    end
  s3:
    begin
    mesgul = 1;
    y = D[1];
    end
  s4:
    begin
    mesgul = 1;
    y = D[2];
    end
  s5: //SAYFA 5
    begin
    mesgul = 1;
    y = D[3];
    end
  s6:
    begin
    mesgul = 1;
    y = D[4];
    end
  s7:
    begin
    mesgul = 0;
    y = 1;
    end
endcase
end
endmodule
