docker-jenkins-sbt
==================

Dockerfile for Jenkins + sbt

## Deploying to Elastic Beanstalk

Run the following and upload the generated zip file to the AWS console.

```
$ ./scripts/package <version-string>
```

Example:

```
$ ./scripts/package 0.11
  adding: Dockerfile (deflated 62%)
  adding: Dockerrun.aws.json (deflated 17%)
generated jenkins-0.11.zip
```
