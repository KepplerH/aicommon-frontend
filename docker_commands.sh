# Comprobar funcionamiento docker
docker -v
# o
docker version

# Instalar imagen
docker pull distribución # busybox y alpine son distribuciones libianas, o la clasica ubuntu

# Ejecutar container
docker run distribución
# Si se corre un container con una imagen y esta no esta disponible, docker la descarga y ejecuta.

# Ejecutar container con un comando
docker run distribucion comando # un posible comando es el clasico echo helloWord

# Enlistar imagenes
docker images

# Enlistar contenedores activos
docker ps 

# Enlistar todos los contenedores
docker ps -a

# Borrar contenedor
docker rm CONTAINER ID # suficiente con los primeros 3 dijitos del id

# Mejor forma de ejecutar un container y quedar en consola
docker run -it distribución 
# Siemrpe se va a ejecutar como usuario root

