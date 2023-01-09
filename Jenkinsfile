pipeline {
    agent { label "built-in" }
    tools {
  jdk 'java8'
}
    stages {
        stage ("Cloning") {
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
                stash includes: 'target/*.war', name: 'project'
            }
        }
        stage ("Deploy"){
		agent { label "Linux" }
		steps {
            sh "sudo yum install docker -y"
		    sh "sudo systemctl start docker.service"
            sh "sudo docker stop tomcat"
            sh "sudo docker system prune -a -f"
		    cleanWs()
		    unstash 'project'
		    sh "sudo docker run -it -p 8090:8080 -v /home/ec2-user/workspace/Project/target:/usr/local/tomcat/webapps -d --name tomcat tomcat:9.0.70-jdk11-corretto-al2"
		    //sh "sudo docker exec tomcat sh -c 'cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/'"
		}
    }
}
}