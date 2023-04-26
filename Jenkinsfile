pipeline {
    agent any
    parameters { choice(name: "ENVIRONMENT", choices: ["staging", "preprod", "prod"], description: "Profile needs to be used while executing test")}
    stages {
        stage("Cleanup Stage") {
            steps {
                // define the single or multiple steps
                sh "echo Cleanup Stage!"
                cleanWs notFailBuild: true
            }
        }
        stage("Git Checkout Stage") {
            steps {
                // define the single or multiple steps
                sh "echo Git Checkout Stage!"
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Mandroide/karateframework.git']])
            }
        }
        stage("Restore Package Stage") {
            steps {
                // define the single or multiple steps
                sh "echo Restore Package Stage!"
            }
        }
        stage("Build Stage") {
            steps {
                // define the single or multiple steps
                sh "echo Build Stage!"
                sh "mvn clean compile"
            }
        }
        stage("Test Execution Stage") {
            steps {
                // define the single or multiple steps
                sh "echo Test Execution Stage Started!"
                sh "mvn -P ${ENVIRONMENT} test"
                sh "echo Test Execution Stage Completed!"
            }
        }
    }
    post {
        always {
        // One or more steps need to be included within each condition's block.
            junit 'target/surefire-reports/*.xml'
            cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
}

}