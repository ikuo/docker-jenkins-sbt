FROM jenkins:1.565.3

USER root

# Install mysql client
RUN apt-get update && apt-get -y install mysql-client

# Download sbt-launch.jar
RUN curl -L --create-dirs --connect-timeout 3 -o /usr/local/lib/sbt-launch.jar http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.5/sbt-launch.jar

# Download Jenkins plugins
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/git-client.hpi http://updates.jenkins-ci.org/download/plugins/git-client/1.11.0/git-client.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/scm-api.hpi https://updates.jenkins-ci.org/latest/scm-api.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/ghprb.hpi http://updates.jenkins-ci.org/download/plugins/ghprb/1.16-5/ghprb.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/git.hpi https://updates.jenkins-ci.org/latest/git.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/sbt.hpi https://updates.jenkins-ci.org/latest/sbt.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/role-strategy.hpi https://updates.jenkins-ci.org/latest/role-strategy.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/ssh-agent.hpi https://updates.jenkins-ci.org/latest/ssh-agent.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/github.hpi https://updates.jenkins-ci.org/latest/github.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/github-api.hpi https://updates.jenkins-ci.org/latest/github-api.hpi
RUN curl -L --create-dirs --connect-timeout 3 -o /tmp/WEB-INF/plugins/thinBackup.hpi https://updates.jenkins-ci.org/latest/thinBackup.hpi
RUN cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

EXPOSE 8080

USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
