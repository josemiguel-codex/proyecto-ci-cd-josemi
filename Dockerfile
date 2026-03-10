# Usa la imagen base oficial de Python
FROM python:3.10-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos locales al contenedor
COPY . .

# Instalar las dependencias necesarias
RUN pip install -r requirements.txt

# Exponer el puerto para acceder a la app
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
