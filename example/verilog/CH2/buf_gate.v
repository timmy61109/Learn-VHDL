module buf_gate (a, b);
  // 輸入輸出宣告
  input a;
  output b;

  // 資料類型宣告
  buf(b, a);
    
  // 描述模組內部電路敘述
endmodule // buf_gate