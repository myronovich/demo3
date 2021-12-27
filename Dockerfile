                                                               
FROM alpine/git as clone
WORKDIR /app
RUN git clone  https://github.com/myronovich/demo3
FROM maven:3.8.4-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/demo3 /app
RUN mvn package
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target /app
CMD ["java -jar dev.war"]
