/*
Notlar:
*Pattern yakalayıcı
* Author:
* Abdullah MEMISOGLU
*/
  module lab6_q1_a_m ( 
    input logic clk,reset,
    input logic A,
    output logic tick );
typedef enum {s0 ,s1 ,s2 ,s3 ,s4 ,s5 ,s6 ,s7 ,s8 } statetype ;
statetype state,next_state ;
//State Registers
always_ff @(posedge clk)
begin
  if(reset) state <= s0;
  else state <= next_state;
end
always_comb
begin
  case(state)
// A girişi 1111 ise tick oluştur 4 elemandan 1'i 0 olursa başa dön.
    s0:
      begin
      if(A) next_state = s1;
      else next_state = s5;
// s0 case'inde A=1 ise 1111 için kontrol edilir.
// A=0 ise s5 case'i (0000) için kontrol etmeye başlanır.
// Sonrasında hangi case yanlış olursa olsun bu case'e dönüp
//tekrar başlanır.
      end
    s1:
      begin
      if(A) next_state = s2;
      else next_state = s0;
      end
    s2: 
      begin
      if(A) next_state = s3;
      else next_state = s0;
      end
    s3:
      begin
      if(A) next_state = s4;
      else next_state = s0;
      end
    s4:
      begin
      if(A) next_state = s4;
      // 1111 den sonra 1 gelirse son 4
      //yeniden 1111 olacak tick oluşmaya
      // devam etsin.o yüzden s4ten s4e döndük.
      else next_state = s0;
      end
      // A girişi 0000 iste tick oluştur 4
      //elemandan biri 1 olursa başa dön.
    s5:
      begin
      if(!A) next_state = s6;
      else next_state = s0;
      end
    s6:
      begin
      if(!A) next_state = s7;
      else next_state = s0;
      end
    s7:
      begin
      if(!A) next_state = s8;
      else next_state = s0;
      end
    s8:
      begin
      if(!A) next_state = s8;
      //0000 dan sonra 0 gelirse son4
      //yeniden 0000 olacak tick oluşmaya devam etsin.
      //O yüzden s8den s8e döndük.
      else next_state = s0;
      end
    default: next_state = s0;
      endcase
end
always_comb
begin
    if(state == s4) // 1111 geldiğinde tick'e 1 ata.
      tick = 1;
    else if(state == s8) // 0000 geldiğinde tick'e 1 ata.
      tick = 1;
    else
      tick = 0;
end
endmodule

