// Ch07 voter_if1.v
// �|�H�벼�� (�ϥ� if �d��)

module voter_if1 (I, O);
input  [3:0] I;		// I �|�줸��J
output [3:1] O;		// O �T�줸��X
reg    [3:1] O;		// �ŧi O ���Ȧs�����

// �ϥ� if �ԭz
always@ (I)
  if      (I == 4'b0000)   O = 3'b100;
  else if (I == 4'b0001)   O = 3'b100;
  else if (I == 4'b0010)   O = 3'b100;
  else if (I == 4'b0011)   O = 3'b010;
  else if (I == 4'b0100)   O = 3'b100; 
  else if (I == 4'b0101)   O = 3'b010;
  else if (I == 4'b0110)   O = 3'b010;
  else if (I == 4'b0111)   O = 3'b001;
  else if (I == 4'b1000)   O = 3'b100;
  else if (I == 4'b1001)   O = 3'b010;
  else if (I == 4'b1010)   O = 3'b010;
  else if (I == 4'b1011)   O = 3'b001;
  else if (I == 4'b1100)   O = 3'b010; 
  else if (I == 4'b1101)   O = 3'b001;
  else if (I == 4'b1110)   O = 3'b001;
  else                     O = 3'b001;

endmodule