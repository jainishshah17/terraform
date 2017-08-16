#!/bin/bash -v

yum update -y
yum install -y java-1.8.0>> /tmp/yum-java8.log
alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
yum -y remove java-1.7.0-openjdk>> /tmp/yum-java7.log 2>&1

##Install Artifactory
wget https://bintray.com/jfrog/artifactory-pro-rpms/rpm -O bintray-jfrog-artifactory-pro-rpms.repo
mv bintray-jfrog-artifactory-pro-rpms.repo /etc/yum.repos.d/
yum install -y jfrog-artifactory-pro>> /tmp/yum-artifactory.log 2>&1
yum install -y nginx>> /tmp/yum-nginx.log 2>&1
curl -L -o  /opt/jfrog/artifactory/tomcat/lib/mysql-connector-java-5.1.38.jar https://bintray.com/artifact/download/bintray/jcenter/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar


FILE="/var/opt/jfrog/artifactory/etc/binarystore.xml"

cat <<EOM >$FILE
<config version="2">
<chain template="s3"/>
<provider id="s3" type="s3">
<endpoint></endpoint>
<identity></identity>
<credential></credential>
<bucketName></bucketName>
</provider>
</config>
EOM





service artifactory start
service nginx start