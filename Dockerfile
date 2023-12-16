# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые пакеты
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

# Устанавливаем зависимости проекта
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt

# Копируем код проекта в контейнер
COPY . /app

# Указываем порт, на котором будет работать приложение
EXPOSE 5000

# Запускаем приложение
CMD ["python3", "app.py"]