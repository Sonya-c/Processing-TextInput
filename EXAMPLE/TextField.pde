
public class textField {
  float x, y, w, h; // Posición y tamaño del cuadro de texto

  float marginLeft = 5;
  float marginRigth = 5;
  float marginTop = 5;
  float marginBotton = 5;

  PGraphics board;
  String text = "";

  boolean active = true; // Cuando se esta escribiendo

  color backgroundColor = #FFFFFF;
  color textColor = #050505;
  color focusColor = #FFF300;
  color placeHolderColor = #8E8E8E;

  // Personalización
  float textSize = 12;
  String placeHolder = "";


  // ... CONSTRUCTORES
  public textField(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    board = createGraphics(int(w), int(h));
  }

  public void setStyle (color backgroundColor, color textColor, float textSize) {
    this.backgroundColor = backgroundColor;
    this.textColor = textColor;
    this.textSize = textSize;
  }
  // ... ACTIVADO
  public void active(boolean active) {
    this.active = active;
  }

  public void active(boolean active, color focusColor) {
    this.active = active;
    this.focusColor = focusColor;
  }

  public void active() {
    if (mouseX > x && mouseY > y && mouseX < x + w && mouseY < y + h) {
      this.active = true;
    } else {
      this.active = false;
    }
  }

  // ... ESCRIBIR
  public void write() {
    if (active) {
      if (key == DELETE || key == 8) {
        if (text.length() > 0) {
          text = text.substring(0, text.length()-1);
        }
      } else if (key == ENTER) {
        text += "\n";
      } else {
        text += key;
      }
    }
  }

  public void write(boolean condicion) {
    if (active) {
      if (key == DELETE || key == 8) {
        if (text.length() > 0) {
          text = text.substring(0, text.length()-1);
        }
      } else if (key == ENTER && condicion) {
        text += "\n";
      } else if (condicion){
        text += key;
      }
    }
  }
  

  // ... MOSTAR EL TEXTO
  public void show() {
    board.beginDraw();

    if (active) {
      board.stroke(focusColor);
      board.strokeWeight(marginLeft);
    } else {
      board.noStroke();
    }
    board.fill(backgroundColor);
    board.rect(0, 0, w, h);

    board.textSize(textSize);
    board.textLeading(15);
    board.textAlign(LEFT, TOP);

    if (text.length() < 1) {
      board.fill(placeHolderColor);
      board.text(placeHolder, marginLeft, marginTop, w - marginRigth, h - (marginTop + marginBotton));
    } else {
      board.fill(textColor);
      board.text(text, marginLeft, marginTop, w - marginRigth, h - (marginTop + marginBotton));
    }

    board.endDraw();
    image(board, x, y, w, h);
  }

  // ... PLACEHOLDER
  public void placeHolder(String placeHolder) {
    this.placeHolder = placeHolder;
  }

  public void placeHolder(String placeHolder, color placeHolderColor) {
    this.placeHolder = placeHolder;
    this.placeHolderColor = placeHolderColor;
  }


  // ... MARGENES
  public void margin(float margin) {
    this.marginLeft = margin;
    this.marginRigth = margin;
    this.marginTop = margin;
    this.marginBotton = margin;
  }

  public void margin(float marginLeft, float marginRigth, float marginTop, float marginBotton) {
    this.marginLeft = marginLeft;
    this.marginRigth = marginRigth;
    this.marginTop = marginTop;
    this.marginBotton = marginBotton;
  }
  

  // .............
  String getText() {
    return text;
  }
}
