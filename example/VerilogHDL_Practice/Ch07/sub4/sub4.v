// Ch07 sub4.v
// �|�줸�L���ƻP�����ƴ�k�B��

module sub4 (A, B, C, D, S1, S2);
input  [3:0] A, B;		// A, B �|�줸�L���ƿ�J
output [4:0] S1;		// S1   ���줸�L���ƿ�X
input  signed [3:0] C, D;	// C, D �|�줸�����ƿ�J
output signed [4:0] S2;		// S2   ���줸�����ƿ�X

// ��k�B��l
assign S1 = A - B;
assign S2 = C - D;

endmodule