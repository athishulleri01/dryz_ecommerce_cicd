#!groovy

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm

                // Execute shell command to log changes
                sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
                
                // Read file contents using readFile step
                script {
                    def lastChanges = readFile('GIT_CHANGES')
                    echo "Last changes: ${lastChanges}"
                }
            }
        }

        stage('Deploy') {
            steps {
                // sh 'chmod +x ./deployment/deploy_prod.sh'
                sh './deployment/deploy_prod.sh'
            }
        }

        stage('Publish results') {
            steps {
                echo "Deployment successful"
            }
        }
    }

    post {
        success {
            echo "Build successful"
            // You can add additional steps here, like running tests or notifications.
        }

        failure {
            echo "Build failed"
        }
    }
}

// node {

//     try {
//         stage 'Checkout'
//             checkout scm

//             sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
//             def lastChanges = readFile('GIT_CHANGES')
//             // slackSend color: "warning", message: "Started `${env.JOB_NAME}#${env.BUILD_NUMBER}`\n\n_The changes:_\n${lastChanges}"

//         // stage 'Test'
//         //     // sh 'virtualenv env -p python3.10'
//         //     // sh '. env/bin/activate'
//         //     // sh 'env/bin/pip install -r requirements.txt'
//         //     sh 'env/bin/python3.10 manage.py test --testrunner=blog.tests.test_runners.NoDbTestRunner'

//         stage 'Deploy'
//             sh './deployment/deploy_prod.sh'

//         stage 'Publish results'
//             slackSend color: "good", message: "Build successful: `${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"
//     }

//     catch (err) {
//         slackSend color: "danger", message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"

//         throw err
//     }

// }
