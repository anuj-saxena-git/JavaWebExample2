node {
    def app
    def mvnHome
    
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
        //-
    
    }
    
    stage('Build the docker Image'){
    
       
        docker.withRegistry('https://848859896798.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:anuj-ecr-credentials') {
        
           sh 'docker build -t childimage/tomcat:latest . '
        }
    
    }
    
}
