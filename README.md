# Cantidad de caminos
Algoritmo que calcula cantidad de caminos posibles para llegar al destino

Dado que ruby pasa los "values" de los arrays en las funciones, se utiliza la función "copy_a" para aplicar de manera recursiva un ".dup" a los elementos del array. De esa forma se simula una copia que no mantiene la referencia.

### Condiciones
* Los obstáculos o caminos recorridos se denotan con -1
* Los caminos disponibles se denotan con 0

```ruby
def copy_a a 
  a.map{|e| e.dup}
end

def cantidad_destinos camino, ruta, x, y, caminos = 0
  return 1 if (x == camino.length - 1 && y == camino.length - 1)
  return 0 if ruta.empty?

  copia_ruta = copy_a ruta
  p = copia_ruta[0]
  copia_ruta.shift
  copia_camino = copy_a camino
  copia_camino[p[0]][p[1]] = -1

  DIRECCIONES.each do |d|
    x = p[0]+d[0]
    y = p[1]+d[1]
    if x >= 0 && y >=0 && x < copia_camino.length && y < copia_camino.length && copia_camino[x][y] != -1
      copia_ruta2 = copy_a copia_ruta
      copia_ruta2 << [x,y]
      copia_camino2 = copy_a copia_camino
      caminos += cantidad_destinos(copia_camino2,copia_ruta2,x,y)
    end
  end
  caminos
end
```
