FROM jenkins:1.565.3

USER root

RUN apt-get update && apt-get -y install mysql-client

RUN curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/git-client.hpi http://updates.jenkins-ci.org/download/plugins/git-client/1.11.0/git-client.hpi \
  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/git.hpi https://updates.jenkins-ci.org/latest/git.hpi \
  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/sbt.hpi https://updates.jenkins-ci.org/latest/sbt.hpi \
  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/role-strategy.hpi https://updates.jenkins-ci.org/latest/role-strategy.hpi \
  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

EXPOSE 8080

USER jenkins

RUN wget -P /var/jenkins_home/ http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.5/sbt-launch.jar

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
