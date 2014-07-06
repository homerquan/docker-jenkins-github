# Jenkins CI server for private github

## How to use
- edit .netrc with your github username and password
- build docker image
  - `sudo docker build -t homerquan/docker-jenkins-github docker-jenkins-github`
  - The build process will generate a public key, please copy and paste it to your github account
- run docker container
  - `sudo docker run -d -p 8080:8080 homerquan/docker-jenkins-github`
- Open http://<hostname>:8080
- Install github and other necessary plugins

Enjoy!

Homer Quan
support@homerquan.com

