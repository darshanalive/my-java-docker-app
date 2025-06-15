FROM openjdk:11
WORKDIR /usr/src/myapp
COPY . .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
