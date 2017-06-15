node {
    def app
    def mvnHome
    def token
    
    stage('Clone repository'){
    
    /* Let's make sure we have the repository cloned to our workspace - */
     
     checkout scm
     
     
    }
    
    stage('Build Project'){
        mvnHome = tool 'Maven'
        // Run the maven build
      if (isUnix()) {
       
          //  sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean install"
          
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
     sh 'pwd'
     sh 'java -version'
     //sh 'mvn -version'
    
    }
    
    stage('Login to ECR'){
    
        token = sh 'aws ecr get-login --no-include-email --region us-east-1'
        sh 'echo $token' 
        sh 'token'
    
    
    }
    
    stage('Build docker image'){
    
        sh 'docker build -t baseImage_tomcat:latest .'
       //sh 'docker run -it --rm --name tomcat_with_application -p 3000:8080 centosjavatomcat:1.0'
    
    }
    
   /* stage('Push Image'){
    
    }   */
    
 /*    stage('Run container and up the application'){
         
         sh 'docker run -it --rm --name tomcat_with_application -p 3000:8080 anujsaxenadocker90/centosjavatomcat:1.0'
    
    } */
}
