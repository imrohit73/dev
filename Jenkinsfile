pipeline{
	agent { label "built-in" }
	tools { jdk 'java8' }
	stages{
		stage ('parallel pipeline') {
			parallel {
				stage ("Project1") {
					agent { label "built-in"}
					stages {
						stage ("clone") {
							steps {
								cleanWs()
								git credentialsId: 'Lokesh', url: 'https://github.com/kiran064/Myproject.git'
							}
						}
						stage ("Build") {
							steps {
								sh "mvn clean install"
							}
						}
						stage ("Copy") {
                        steps {
                            stash includes: 'target/*.war', name: 'Project1'
                    		}
                		}
					}
				}
				stage ("Project2") {
					agent { label "Linux"}
					tools { jdk 'java8' }
					stages {
						stage ("clone") {
							steps{
								cleanWs()
								git 'https://github.com/kiran064/game-of-life.git'
							}
						}
						stage ("Build") {
							steps {
								sh "mvn clean install"
							}
						}
						stage ("Copy") {
                        steps {
                            stash includes: 'gameoflife-web/target/*.war', name: 'Project2'
                    		}
                		}
					}
				}
			}
		}
		stage ("Deploy") {
			agent { label "Docker"}
			tools { jdk 'java8' }
			stages {
				stage ("Docker_Compose") {
					steps {
						sh "sudo systemctl start docker.service"
                        sh "sudo docker stop dockerproject-web1-1 dockerproject-web2-1"
                        sh "sudo docker system prune -af"
						//sh "sudo docker-compose down"
					    //sh "rm -rf gameoflife-web target docker-compose.yaml"
						writeFile file: 'docker-compose.yaml', text: '''version: "3.9"
services:
  web1:
    image: "tomcat:9.0.70-jdk11-corretto-al2"
    ports:
      - "8085:8080"
    volumes:
      - ./target:/usr/local/tomcat/webapps
  web2:
    image: "tomcat:9"
    ports:
      - "8090:8080"
    volumes:
      - ./gameoflife-web/target:/usr/local/tomcat/webapps'''
						unstash 'Project1'
						unstash 'Project2'
						sh "sudo docker-compose up -d"
					}
				}
			}
		}
	}
}