node {
    def app 
    
    stage('Clone repository'){
    
    /* Let's make sure we have the repository cloned to our workspace - */
     
     checkout scm
     sh 'pwd'
     
    }
    
    stage('Build Project'){
    sh 'mvn clean install'
    
    }
    
    stage('Build docker image'){
    
    
    }
    
   /* stage('Push Image'){
    
    }   */
    
    stage('Run container and up the application'){
    
    }
}