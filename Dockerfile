# Usar la imagen oficial de Golang como imagen base
FROM golang:1.18-alpine as builder

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo 'go.mod' y 'go.sum' (si existe)
# COPY go.sum ./
COPY go.mod ./

# Descargar las dependencias del módulo Go. Esto beneficia a la caché de capas del Docker.
RUN go mod download

# Copiar el resto de los archivos del proyecto
COPY . .

# Compilar la aplicación. Asegúrate de ajustar el nombre del archivo según sea necesario.
RUN go build -o game .

# Etapa final, usar alpine para un contenedor más pequeño
# FROM alpine:latest  
#WORKDIR /root/
#COPY --from=builder /app/main .
# CMD ["./main"]  # Ejecutar la aplicación compilada

# CMD ["tail", "-f", "/dev/null" ]  # Ejecutar el comando "tail -f /dev/null" para mantener el contenedor en ejecución