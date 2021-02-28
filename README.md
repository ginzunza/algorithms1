# Cantidad de caminos
Lo que hace este algoritmo es simular todas las posibles combinaciones de rutas para llegar a un destino. Evita obstáculos y siempre avanza en los ejes x e y para posiciones adyacentes. Para cada ruta individual no retrocede ni repite posiciones ya recorridas.

Dado que ruby pasa los "values" de los arrays en las funciones, se utiliza la función "copy_a" para aplicar de manera recursiva un ".dup" a los elementos del array. De esa forma se simula una copia que no mantiene la referencia.

### Condiciones
* Los obstáculos o caminos recorridos se denotan con -1
* Los caminos disponibles se denotan con 0
* Se asumen matrices simétricas

```ruby
DIRECCIONES = [[0,1],[0,-1],[1,0],[-1,0]]# guarda las 4 posibilidades de movimientos ↓, ↑, →, ←

def copy_a a 
  a.map{|e| e.dup}
end

def cantidad_destinos camino, ruta, x, y, caminos = 0
  return 1 if (x == camino.length - 1 && y == camino.length - 1) # si llegó al destino retorna 1, pues encontró un camino válido
  return 0 if ruta.empty? # si no llegó al destino y se quedó sin opciones, retorna 0 pues no encontró camino válido

  copia_ruta = copy_a ruta # se hace copia del arreglo de rutas para que las modificaciones no se repliquen a otros niveles de recursión
  p = copia_ruta[0] #p se sitúa en la posición actual en la ruta
  copia_ruta.shift #se elimina el primer elemento de la ruta
  copia_camino = copy_a camino # se hace copia del arreglo del camino para que las modificaciones no se repliquen a otros niveles de recursión
  copia_camino[p[0]][p[1]] = -1 # se marca como recorrida la posición actual, solo para este nivel de profundidad

  DIRECCIONES.each do |d| # se recorre cada posible dirección
    x = p[0]+d[0]
    y = p[1]+d[1]
    if x >= 0 && y >=0 && x < copia_camino.length && y < copia_camino.length && copia_camino[x][y] != -1 # si es una posición valida, lo agrega al arreglo de rutas
      copia_ruta2 = copy_a copia_ruta
      copia_ruta2 << [x,y]
      copia_camino2 = copy_a copia_camino
      caminos += cantidad_destinos(copia_camino2,copia_ruta2,x,y) #guarda en caminos todos los retornos de las rutas recorridas
    end
  end
  caminos
end
```
### Ejemplo
```ruby
camino =[
  [0,0,0],
  [0,0,0],
  [0,0,0]
]
cantidad_destinos(camino,[[0,0]],0,0)# => 12 caminos posibles

camino =[
  [0,0],
  [0,0]
]
cantidad_destinos(camino,[[0,0]],0,0)# => 2 caminos posibles
```
