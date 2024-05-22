FROM maven:amazoncorretto as maven
WORKDIR /app
COPY . .
RUN mvn clean install

FROM artisantek/tomcat:1
COPY --from=maven /app/target/*.war /usr/local/tomcat/webapps/
