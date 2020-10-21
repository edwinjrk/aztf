import groovy.json.JsonSlurper

node {
    def container
    def acrSettings

     environment { 
        registry = "https://hub.docker.com/repository/docker/rkedwinjose/aztf"    
        registryCredential = 'DockerHub'
        dockerImage = ''
    }

    stage('Building our image') { 
                 script { 
                dockerImage = docker.build("rkedwinjose/aztf:$BUILD_NUMBER", **/Dockerfile)
            }
        
    }
 
    
}