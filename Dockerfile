# Используем базовый образ с Java
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем сгенерированный JAR файл в контейнер
COPY target/jenkins-sample-1.0-SNAPSHOT.jar /app/app.jar

# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
