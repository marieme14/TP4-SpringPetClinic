#!/bin/bash

yum update -y

yum install -y git

yum install -y java-17-amazon-corretto


cd /home/ec2-user


git clone https://github.com/spring-projects/spring-petclinic.git


chown -R ec2-user:ec2-user /home/ec2-user/spring-petclinic


cd /home/ec2-user/spring-petclinic


cat > src/main/resources/application-mysql.properties <<EOF
spring.datasource.url=jdbc:mysql://petclinic-mysql.c3am0uqk0txz.eu-west-3.rds.amazonaws.com:3306/petclinic
spring.datasource.username=admin
spring.datasource.password=PetClinic1234!
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update
EOF


chown ec2-user:ec2-user src/main/resources/application-mysql.properties


chmod +x mvnw


su - ec2-user -c "
cd /home/ec2-user/spring-petclinic
./mvnw clean package -DskipTests > /tmp/maven.log 2>&1
"


JAR=$(find /home/ec2-user/spring-petclinic/target -name "*.jar" | grep -v original | head -1)


echo "JAR TROUVE : $JAR" > /tmp/build.log


nohup java -jar "$JAR" \
--spring.profiles.active=mysql \
--server.port=8080 \
> /tmp/petclinic.log 2>&1 &