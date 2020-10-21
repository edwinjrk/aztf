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
stage('test'){
    
}
 
    }
}