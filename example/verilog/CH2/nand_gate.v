module nand_gate (a, b, c);
  // 輸入輸出宣告
  input a, b;
  output c;

  // 資料類型宣告
  nand(c, a, b);
    
  // 描述模組內部電路敘述
endmodule // nand_gate