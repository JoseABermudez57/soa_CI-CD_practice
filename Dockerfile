# Usa una imagen base oficial de Node.js
FROM node:20

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo package.json y package-lock.json (si existe)
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto en el que la aplicación correrá
EXPOSE 3000

# Define el comando por defecto para iniciar la aplicación
CMD ["npm", "start"]
