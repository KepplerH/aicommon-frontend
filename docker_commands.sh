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

# Pausar contenedor
 docker pause # suspends all processes in the specified containers.

# Detener contenedor
docker stop containerID #The main process inside the container will receive SIGTERM, and after a grace period, SIGKILL

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

# Mapear carpeta de mi local (Mac, en este caso) a directorio del contenedor (local:contenedor) a.k.a bind mount
docker run --name db -d -v /Users/dev/Dev/platzi/mongodata:/data/db mongo

# Crear volumen de docker (Mejor que bind mounts)
docker volume create NOMBRE

# Listar los volúmenes que tengo
docker volume ls

# Mapear carpeta de mi volumen a directorio del contenedor (volume:contenedor) ...parecido al comando anterior
docker run -d --name NOMBRE_CONTENEDOR —mount src=NOMBRE_VOLUMEN,dst=/data/db NOMBRE_IMAGEN

# eliminar todos los volumenes (WARNING)
docker volume prune

# Listar las imagenes
docker image ls

# Eliminar una imagen
docker rmi HASH #el hash de la imagen, tipo: 0d91s8E3s

# Descargar imagenes
docker pull NOMBRE_IMAGEN
docker pull ubuntu:18.04 # descargando una version en particular, POR DEFECTO SUELE SER "LATEST"

# Dockerfile: es la receta para construir nuestras imagenes. Siempre debe partir con un FROM
ejemplo: FROM ubuntu
         RUN touch /usr/src/hola

# con esto construimos nuestra imagen basada en el dockerfile
docker build -t NOMBRE_IMAGEN:TAG . # puede ser ubuntu:hans, por ejemplo

# Flujo para construir en docker
https://puu.sh/C9opx/759d333008.png (ver imagen)

# Taggear mi imagen para poder subirla a DockerHub
docker tag NOMBRE_IMAGEN:TAG_PREVIO MI_USUARIO_DOCKERHUB/ubuntu:hans # por ejemplo

# Luego de taggear, publicar tu imagen propia
docker push hansfpc/ubuntu:hans # nombredetucuenta/imagen:tag

# listar las capas de la imagen, cuanto pesa cada layer, etc
docker history imagen:tag