# A text fiel for processing
This is a class for make simple text fiel for processing 

## Constructor
**Sintax:**  
```
textField example = new textField(x, y, w, h);
```
parameter| use
--|-------------------------------
x | float: x-coordinate of the box
y | float: y-coordinate of the box
w | float: width of the box
h | float: heigth of the box

## active
By default, the text field is enabled. So everything the user types will be written in the box. This can be a problem when working with multiple inputs. To control this, we can use the * active * method
```
example.active(state);
example.active(state, color);
```
parameter| use
--|-------------------------------
state | boolean: the status of the text field (activated or not)
color | color: the color of the border

Also, using the * active * method without any parameters and within a * mousePressed *, the keyboard is automatically activated when the mouse click on it. Here a example:
```
void mousePressed() {
  example.active();
}
```

## setStyle
By default, the size of the text is 12, and the colors are: 
- Background color `#FFFFFF`
- Text color `#050505`
- Border color (when is active) `#FFF300`
- PlaceHolder color (when is empty) `#8E8E8E`
to c
