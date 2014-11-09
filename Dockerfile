FROM jenkins:latest

USER root

RUN apt-get update && apt-get -y install mysql-client

EXPOSE 8080

USER jenkins

RUN wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        https://updates.jenkins-ci.org/latest/scm-api.hpi &&\
    wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        http://updates.jenkins-ci.org/download/plugins/git-client/1.11.0/git-client.hpi &&\
    wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        https://updates.jenkins-ci.org/latest/git.hpi &&\
    wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        https://updates.jenkins-ci.org/latest/ghprb.hpi &&\
    wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        https://updates.jenkins-ci.org/latest/sbt.hpi &&\
    wget -nv -T 60 -t 3 -P /var/jenkins_home/plugins \
        https://updates.jenkins-ci.org/latest/role-strategy.hpi

RUN wget -P /var/jenkins_home/ http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.5/sbt-launch.jar

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
