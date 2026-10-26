# Build the WAR file
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn -B clean package

# Run the application on Tomcat 9 (javax.servlet compatible)
FROM tomcat:9.0-jdk17-temurin
ENV PORT=10000
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /build/target/StudentManagement.war /usr/local/tomcat/webapps/ROOT.war
COPY docker-start.sh /usr/local/bin/docker-start.sh
RUN chmod +x /usr/local/bin/docker-start.sh
EXPOSE 10000
CMD ["/usr/local/bin/docker-start.sh"]
