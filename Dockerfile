FROM alpine/git as clone
WORKDIR /app
RUN git clone  https://github.com/myronovich/demo3
FROM maven:3.8.4-jdk-11 as build
WORKDIR /app
COPY --from=clone /app/demo3 /app
