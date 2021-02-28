# algorithms1
Algoritmo que calcula cantidad de caminos posibles para llegar al destino

Dado que ruby pasa los "values" de los arrays en las funciones, se utiliza la función "copy_a" para aplicar de manera recursiva un ".dup" a los elementos del array. De esa forma se simula una copia que no mantiene la referencia.

```ruby
def copy_a a 
  a.map{|e| e.dup}
end
```
