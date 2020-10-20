import groovy.json.JsonSlurper

node {
    def container
    def acrSettings

    withCredentials([azureServicePrincipal('AzureServicePrincipal')]) {
        stage('Prepare Environment') {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
            acrSettings = new JsonSlurper().parseText(
                                            sh(script: "az acs show -o json -n my-acr", returnStdout: true))
        }

        environment { 
            registry = "https://hub.docker.com/repository/docker/rkedwinjose/aztf"    
            registryCredential = 'DockerHub'
            dockerImage = ''
    }
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
        stage('Deploy our image') { 
            steps { 
                script {                     
                    withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/rkedwinjose/aztf') {
                        dockerImage.push()
                    }
                } 
            }
        } 
    }
}