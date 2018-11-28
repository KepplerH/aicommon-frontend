# Notas 

containerID # suficiente con los primeros 3 dijitos del id

-it # Modo iterativo

# Comprobar funcionamiento docker
docker -v
# o
docker version

# Instalar imagen
docker pull distribución # busybox y alpine son distribuciones libianas, o la clasica ubuntu

# Ejecutar container
docker run distribución
# Si se corre un container con una imagen y esta no esta disponible, docker la descarga y ejecuta.

# Ejecutar contenedor, y borrarlo al finalizar su ejecución 
docker run -rm distro

# Crear contenedor sin ejecutarlo
docker create -it distribución comando

# Crear contenedor estableciendo su nombre
docker run -it --name=nombreContenedor distribucion comando

# Ejecutar container con un comando
docker run distribucion comando # un posible comando es el clasico echo helloWord

# Detener contenedor
docker stop containerID

# Forzar la eliminación del contenedor, incluso si está corriendo procesos
docker rm -f nombre_contenedor

# Activar contenedor 
docker start containerID

# Entrar por consola a un contenedor
docker attach containerID

# Ejecutar comandos en un contenedor de forma interactiva (quedando en la consola)
docker exec -it containerID comando #pueder ser bash, por ejemplo.

# Enlistar imagenes
docker images

# Enlistar contenedores activos
docker ps 

# Enlistar todos los contenedores
docker ps -a

# Enlistar todos los contenedores con el id completo
docker ps -a --no-trunc #normalmente docker no muestra el id completo

# Borrar contenedor, siempre y cuando no este activado
docker rm containerID

# Borrar todos los contenedores
docker rm $(docker ps -a -q)

# Mejor forma de ejecutar un container y quedar en consola
docker run -it distribución 
# Siemrpe se va a ejecutar como usuario root

# Crear una imagen en docker
docker commit -a "creador <su@correo.com>" -m "mensaje (version 1.0)" containerID nombreImagen 
# Creara una imagen basada en el containerID
# Devuelve el id de la nueva imagen

# Donde encontrar imagenes creadas por otros desarrolladores
https://hub.docker.com/

# Buscar imagenes por consola
docker search busqueda

# Buscar imagenes por puntuación desde la consola
docker search -s 10 busqueda # 10 es igual a la puntuacion buscada

# Borrar imagen 
docker rmi imagenID # ningun contenedor puede estar usandolo