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
