import groovy.json.JsonSlurper

node {
    def container
    def acrSettings


agent {
        dockerfile true
    } 
    stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
 
    
}