
textField textField1;
textField textField2;

void setup () {
  background(#4D4D4D);
  size(500, 500);

  textField1 = new textField(100, 100, 300, 300);
  textField1.placeHolder("Este es un cuadro de texto con margenes y un placeHolder");
  textField1.margin(5, 10, 30, 20);
  textField1.active(false, #73F7FC); // Se puede inicializar cual textfield esta activo por defecto
  
  textField2 = new textField(150, 30, 200, 50);
  textField2.setStyle(#740239, #FFE8F3, 30);
  textField2.active(true); // Este teclado estara activo al comienzo con el color por defecto
}

void draw() {
  textField1.show();
  textField2.show();
}

void mousePressed() {
  textField1.mousePressed();
  textField2.mousePressed();
}

void keyTyped() {
  textField1.write();
  textField2.write(key >= 48 && key <= 57 && key != ENTER);
}
