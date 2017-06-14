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
    
    }
    
    stage('Build docker image'){
    
    
    }
    
   /* stage('Push Image'){
    
    }   */
    
    stage('Run container and up the application'){
    
    }
}
